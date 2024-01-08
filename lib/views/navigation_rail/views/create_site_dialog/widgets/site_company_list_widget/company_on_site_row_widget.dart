import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/cubit/company_firestore_cubit.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/data/typedefs/company_id.dart';
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
  late TextEditingController employeesController;
  late TextEditingController membersController;
  late TextEditingController electedOfficialsController;
  late CompanyId companyId;
  int employees = 0;
  int members = 0;
  int electedOfficials = 0;

  @override
  void initState() {
    super.initState();

    employeesController = TextEditingController();
    employeesController.addListener(_updateEmployees);

    membersController = TextEditingController();
    membersController.addListener(_updateMembers);

    electedOfficialsController = TextEditingController();
    electedOfficialsController.addListener(_updateElectedOfficials);
  }

  @override
  void dispose() {
    employeesController.removeListener(_updateEmployees);
    employeesController.dispose();

    membersController.removeListener(_updateMembers);
    membersController.dispose();

    electedOfficialsController.removeListener(_updateElectedOfficials);
    electedOfficialsController.dispose();

    super.dispose();
  }

  void _updateEmployees() {
    int newEmployees = int.tryParse(employeesController.text) ?? 0;
    employees = newEmployees;
    context.read<CompanyOnSiteRowCubit>().updateEmployees(employees);
  }

  void _updateMembers() {
    int newMembers = int.tryParse(membersController.text) ?? 0;
    members = newMembers;
    context.read<CompanyOnSiteRowCubit>().updateMembers(members);
  }

  void _updateElectedOfficials() {
    int newElectedOfficials = int.tryParse(electedOfficialsController.text) ?? 0;
    electedOfficials = newElectedOfficials;
    context.read<CompanyOnSiteRowCubit>().updateElectedOfficials(electedOfficials);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyOnSiteRowCubit, Workplace>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.companyList?.length ?? 0,
            itemBuilder: (context, index) {
              final company = widget.companyList![index];
              companyId = company.id;
              // final companySite = company.sites?.firstWhere((element) => element.siteId == siteId,
              //     orElse: () => Site(siteId: siteId, members: 0, electedOfficials: 0, employees: 0));
              final companySite = getCompanySite(company, widget.siteId);
              context.read<CompanyOnSiteRowCubit>().updateState(companySite!);

              employees = state.employees;
              members = state.members;
              electedOfficials = state.electedOfficials;
              employeesController.text = employees.toString();
              membersController.text = members.toString();
              electedOfficialsController.text = electedOfficials.toString();

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
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  controller: employeesController,
                                  decoration: const InputDecoration(isDense: true),
                                ),
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
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  controller: membersController,
                                  decoration: const InputDecoration(isDense: true),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Förtroendevalda'),
                              SizedBox(
                                width: 100,
                                child: TextField(
                                  controller: electedOfficialsController,
                                  decoration: const InputDecoration(isDense: true),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            context.read<CompanyFirestoreCubit>().updateWorkplace(
                                  widget.companyType,
                                  companyId,
                                  employees,
                                  members,
                                  electedOfficials,
                                  widget.siteId,
                                );
                          },
                          icon: Icon(Icons.save)),
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
      },
    );
  }
}
