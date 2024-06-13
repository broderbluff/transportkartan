import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/crud/company_firestore_cubit.dart';
import 'package:transportkartan/bloc/crud/company_repository.dart';
import 'package:transportkartan/bloc/crud/site_repository.dart';
import 'package:transportkartan/bloc/crud/workplace_firestore_cubit.dart';
import 'package:transportkartan/bloc/crud/workplace_repository.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/data/models/state/company_firestore_state.dart';
import 'package:transportkartan/data/models/state/workplace_firestore_state.dart';
import 'package:transportkartan/data/models/workplace_model.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/map/map_popup/transport_popup/widgets/charts/piechart_degree_of_organization.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/views/widgets/company_list_item.dart';

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
  @override
  List<Workplace> workplaces = [];
  List<Site> listOfSite = [];
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        for (var workplace in workplaces)
          listOfSite.isNotEmpty
              ? InkWell(
                child: ExpansionTile(
                  
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
                            const Divider(
                              thickness: 2,
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
                                  const Expanded(child: Text('Förtroendevalda:')),
                                  Text(workplace.electedOfficials.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            DegreeOfOrganizationPieChart(
                              company: workplace,
                            ),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
              )
              : CircularProgressIndicator.adaptive(),
      ],
    );
  }
}
