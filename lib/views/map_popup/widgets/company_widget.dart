import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/cubit/company_firestore_cubit.dart';
import 'package:transportkartan/data/models/workplace_model.dart';
import 'package:transportkartan/views/map_popup/widgets/charts/piechart_degree_of_organization.dart';

class PopupCompanyWidget extends StatelessWidget {
  const PopupCompanyWidget({super.key, required this.siteId, required this.title, required this.companies});

  final String siteId;
  final List<Workplace> companies;
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyFirestoreCubit, CompanyFirestoreState>(
      builder: (context, state) {
        if (state is InitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is AllCompaniesState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              for (var company in companies)
                ExpansionTile(
                  leading: context.read<CompanyFirestoreCubit>().findCompanyById(company.companyId).logoUrl == null
                      ? const SizedBox(
                          height: 25,
                          width: 25,
                        )
                      : Image.network(
                          context.read<CompanyFirestoreCubit>().findCompanyById(company.companyId).logoUrl!,
                          height: 25,
                          width: 25,
                        ),
                  title: Text(
                    context.read<CompanyFirestoreCubit>().findCompanyById(company.companyId).name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Divider(
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Expanded(child: Text('Anställda i hela företaget:')),
                              Text(
                                  context
                                      .read<CompanyFirestoreCubit>()
                                      .findCompanyById(company.companyId)
                                      .totalEmployees
                                      .toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const Divider(
                            endIndent: 64,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Detta arbetställe:',
                          ),
                          const Divider(
                            endIndent: 64,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Expanded(child: Text('Kollektivare:')),
                                Text(company.employees.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Expanded(child: Text('Medlemmar:')),
                                Text(company.members.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Expanded(child: Text('Förtroendevalda:')),
                                Text(company.electedOfficials.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          DegreeOfOrganizationPieChart(company: company, siteId: siteId),
                          const SizedBox(
                            height: 16,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
