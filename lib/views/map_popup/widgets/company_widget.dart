import 'package:flutter/material.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/helpers/company_on_site_fetcher.dart';
import 'package:transportkartan/views/map_popup/widgets/charts/piechart_degree_of_organization.dart';

class PopupCompanyWidget extends StatelessWidget {
  const PopupCompanyWidget({super.key, required this.siteId, required this.title, required this.companies});

  final String siteId;
  final List<Company> companies;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        for (var company in companies)
          ExpansionTile(
            leading: company.logoUrl == null
                ? const SizedBox(
                    height: 25,
                    width: 25,
                  )
                : Image.network(
                    company.logoUrl!,
                    height: 25,
                    width: 25,
                  ),
            title: Text(
              company.name,
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
                        Text(company.totalEmployees.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
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
                          Text(getCompanySite(company, siteId)?.employees.toString() ?? '0',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Expanded(child: Text('Medlemmar:')),
                          Text(getCompanySite(company, siteId)?.members.toString() ?? '0',
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
                          Text(getCompanySite(company, siteId)?.electedOfficials.toString() ?? '0',
                              style: const TextStyle(fontWeight: FontWeight.bold)),
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
  }
}
