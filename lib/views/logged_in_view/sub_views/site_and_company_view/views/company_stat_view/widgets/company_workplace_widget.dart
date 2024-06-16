import 'package:flutter/material.dart';
import 'package:transportkartan/bloc/crud/site_repository.dart';
import 'package:transportkartan/bloc/crud/workplace_repository.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/data/models/workplace_model.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';
import 'package:transportkartan/views/shared_widgets/charts/piechart_degree_of_organization.dart';

class CompanyWorkplaceWidget extends StatefulWidget {
  const CompanyWorkplaceWidget({
    super.key,
    required this.companyId,
  });

  final String companyId;

  @override
  State<CompanyWorkplaceWidget> createState() => _CompanyWorkplaceWidgetState();
}

class _CompanyWorkplaceWidgetState extends State<CompanyWorkplaceWidget> {
  List<Workplace> workplaces = [];
  List<Site> listOfSite = [];
  int selectedIndex = -1; // Track the index of the selected ListTile
  int hoverIndex = -1; // Track the index of the selected ListTile

  @override
  void initState() {
    super.initState();
    _fetchCompanies();
  }

  void _fetchCompanies() async {
    final workplaceRepository = WorkplaceRepository();
    final siteRepository = SiteRepository();

    workplaces = await workplaceRepository.fetchWorkplacesByCompanyId(
      widget.companyId,
    );
    if (workplaces.isNotEmpty) {
      for (var workplace in workplaces) {
        listOfSite.add(await siteRepository.fetchSiteById(workplace.siteId));
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (workplaces.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: workplaces.length,
          itemBuilder: (context, index) {
            var workplace = workplaces[index];
            bool selected = selectedIndex == index;
            bool hover = hoverIndex == index;

            return MouseRegion(
              onExit: (event) {
                setState(() {
                  hoverIndex = -1;
                });
              },
              onEnter: (event) {
                setState(() {
                  hoverIndex = index;
                });
              },
              child: ExpansionTile(
                collapsedBackgroundColor: hover ? Colors.grey[200] : Colors.white,
                backgroundColor: hover ? Colors.grey[50] : Colors.white,
                leading: SizedBox(
                  width: 30,
                  height: 30,
                  child: SiteTypeIcon(siteType: listOfSite.firstWhere((element) => element.id == workplace.siteId).type),
                ),
                title: Text(
                  listOfSite.firstWhere((element) => element.id == workplace.siteId).name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Organisationsgrad: '),
                    Text((workplace.members / workplace.employees * 100).toStringAsFixed(1) + '%',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: (workplace.members / workplace.employees * 100) >= 65.0
                                ? Colors.green
                                : (workplace.members / workplace.employees * 100) <= 49.0
                                    ? Colors.red
                                    : Colors.orange)),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                              Text(workplace.employees.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Expanded(child: Text('Medlemmar:')),
                              Text(workplace.members.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Expanded(child: Text('Förtroendevalda:')),
                              Text(workplace.electedOfficials.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Expanded(child: Text('Annat förbund:')),
                              Text(workplace.otherUnion.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Expanded(child: Text('Oorganiserade:')),
                              Text((workplace.employees - workplace.members - workplace.otherUnion).toString(),
                                  style: const TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        DegreeOfOrganizationPieChart(
                          workplace: workplace,
                          vertical: false,
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    }
  }
}
