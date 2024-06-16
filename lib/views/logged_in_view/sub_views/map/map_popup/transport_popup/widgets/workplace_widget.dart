import 'package:flutter/material.dart';
import 'package:transportkartan/bloc/crud/company_repository.dart';
import 'package:transportkartan/bloc/crud/workplace_repository.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/data/models/workplace_model.dart';
import 'package:transportkartan/views/shared_widgets/charts/piechart_degree_of_organization.dart';
import 'package:transportkartan/views/shared_widgets/company_logo_widget.dart';

class PopupCompanyWidget extends StatefulWidget {
  const PopupCompanyWidget({
    super.key,
    required this.siteId,
    required this.title,
    required this.type,
  });

  final String siteId;
  final String title;
  final CompanyType type;

  @override
  State<PopupCompanyWidget> createState() => _PopupCompanyWidgetState();
}

class _PopupCompanyWidgetState extends State<PopupCompanyWidget> {
  List<Workplace> workplaces = [];
  List<Company> listOfCompanies = [];

  @override
  void initState() {
    super.initState();
    _fetchCompanies();
  }

  void _fetchCompanies() async {
    final workplaceRepository = WorkplaceRepository();
    final companyRepository = CompanyRepository();

    workplaces = await workplaceRepository.fetchWorkplacesBySiteId(
      widget.siteId,
    );
    if (workplaces.isNotEmpty) {
      for (var workplace in workplaces) {
        listOfCompanies.add(await companyRepository.fetchCompanyById(workplace.companyId));
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        for (var workplace in workplaces)
          listOfCompanies.isNotEmpty
              ? ExpansionTile(
                  leading: LogoWidget(
                    company: listOfCompanies.firstWhere((element) => element.id == workplace.companyId),
                  ),
                  title: Text(
                    listOfCompanies.firstWhere((element) => element.id == workplace.companyId).name,
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
                                  listOfCompanies
                                      .firstWhere((element) => element.id == workplace.companyId)
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
                                Text(workplace.employees.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Expanded(child: Text('Medlemmar:')),
                                Text(workplace.members.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Expanded(child: Text('Annat förbund:')),
                                Text(workplace.otherUnion.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Expanded(child: Text('Oorganiserade:')),
                                Text((workplace.employees - workplace.members - workplace.otherUnion).toString(),
                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Expanded(child: Text('Förtroendevalda:')),
                                Text(workplace.electedOfficials.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 64,
                          ),
                          DegreeOfOrganizationPieChart(
                            workplace: workplace,
                            vertical: true,
                          ),
                          const SizedBox(
                            height: 16,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : CircularProgressIndicator.adaptive(),
      ],
    );
  }
}
