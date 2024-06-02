import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/crud/company_firestore_cubit.dart';
import 'package:transportkartan/bloc/crud/workplace_firestore_cubit.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/data/models/workplace_model.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/widgets/site_company_list_widget/cubit/company_on_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/views/widgets/company_list_item.dart';

class CompanyOnSiteListWidget extends StatefulWidget {
  final String siteId;
  final CompanyType companyType;
  final List<Workplace>? companyList;

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

          context.read<CompanyOnSiteRowCubit>().updateState(company);

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
                  LogoWidget(company: context.read<CompanyFirestoreCubit>().findCompanyById(company.companyId)),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(context.read<CompanyFirestoreCubit>().findCompanyById(company.companyId).name),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Lokalt anställda'),
                          Text(
                            '${company.employees}',
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
                          Text('${company.members}'),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [const Text('Förtroendevalda'), Text('${company.electedOfficials}')],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showEditDialog(context, context.read<CompanyFirestoreCubit>().findCompanyById(company.companyId), company);
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<WorkplaceFirestoreCubit>().deleteWorkplace(company.id);
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

  Future<dynamic> showEditDialog(BuildContext context, Company company, Workplace workplace) {
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
                controller: TextEditingController(text: '${workplace.employees}'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Medlemmar',
                ),
                controller: TextEditingController(text: '${workplace.members}'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Förtroendevalda',
                ),
                controller: TextEditingController(text: '${workplace.electedOfficials}'),
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
                context.read<CompanyOnSiteRowCubit>().updateState(workplace);

                workplace = workplace.copyWith(
                  employees: int.parse(context.read<CompanyOnSiteRowCubit>().state.employees.toString()),
                  members: int.parse(context.read<CompanyOnSiteRowCubit>().state.members.toString()),
                  electedOfficials: int.parse(context.read<CompanyOnSiteRowCubit>().state.electedOfficials.toString()),
                );
                context.read<WorkplaceFirestoreCubit>().updateWorkplace(workplace);
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
