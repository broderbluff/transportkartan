import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/helpers/company_on_site_fetcher.dart';
import 'package:transportkartan/views/navigation_rail/views/create_site_dialog/cubit/create_site_cubit.dart';
import 'package:transportkartan/views/navigation_rail/views/create_site_dialog/widgets/site_company_list_widget/cubit/company_on_site_cubit.dart';

class CompanyOnSiteListWidget extends StatefulWidget {
  final String siteId;
  final CompanyType companyType;
  final List<Company>? companyList;

  const CompanyOnSiteListWidget({
    super.key,
    required this.siteId,
    required this.companyType,
    required this.companyList,
  });

  @override
  State<CompanyOnSiteListWidget> createState() => _CompanyOnSiteListWidgetState();
}

class _CompanyOnSiteListWidgetState extends State<CompanyOnSiteListWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.companyList?.length ?? 0,
        itemBuilder: (context, index) {
          final company = widget.companyList![index];
          // final companySite = company.sites?.firstWhere((element) => element.siteId == siteId,
          //     orElse: () => Site(siteId: siteId, members: 0, electedOfficials: 0, employees: 0));
          final companySite = getCompanySite(company, widget.siteId);
          context.read<CompanyOnSiteRowCubit>().updateState(companySite!);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.orange[50],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: company.logoUrl!.isEmpty ? const Icon(Icons.business_sharp) : Image.network(company.logoUrl!),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(company.name),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Lokalt anställda'),
                          Text(
                            '${companySite.employees}',
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Medlemmar'),
                          Text('${companySite.members}'),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [const Text('Förtroendevalda'), Text('${companySite.electedOfficials}')],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showEditDialog(context, company, companySite);
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<CreateSiteCubit>().removeCompany(company.id, widget.companyType);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> showEditDialog(BuildContext context, Company company, Workplace companySite) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ändra arbetsplatsuppgifter för ${company.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Lokalt anställda',
                ),
                controller: TextEditingController(text: '${companySite.employees}'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Medlemmar',
                ),
                controller: TextEditingController(text: '${companySite.members}'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Förtroendevalda',
                ),
                controller: TextEditingController(text: '${companySite.electedOfficials}'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Avbryt'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            //TODO: Move the firebase function to repo
            TextButton(
              child: const Text('Spara'),
              onPressed: () async {
                companySite = companySite.copyWith(employees: 30);

                DocumentReference docRef = FirebaseFirestore.instance.collection('company').doc(company.id);

                FirebaseFirestore.instance.runTransaction((transaction) async {
                  DocumentSnapshot snapshot = await transaction.get(docRef);

                  if (snapshot.exists) {
                    Company comp = Company.fromJson(snapshot.data() as Map<String, dynamic>);
                    List<dynamic> yourArrayField = List.from(comp.workplaces ?? []);

                    // Find the index of the item you want to update
                    int indexToUpdate = yourArrayField.indexWhere((item) => item['siteId'] == companySite.siteId);

                    // Update the item
                    yourArrayField[indexToUpdate] = companySite;

                    // Write the updated array back to the document
                    transaction.update(docRef, {'workplaces': yourArrayField});
                  }
                });
                // Save the changes here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
