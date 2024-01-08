import 'package:flutter/material.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/helpers/company_on_site_fetcher.dart';

class PopupCompanyWidget extends StatelessWidget {
  const PopupCompanyWidget(
    this.siteId,
    this.mainCompanies, {
    super.key,
  });

  final String siteId;
  final List<Company> mainCompanies;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 1,
          child: Text(
            'Företag:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (var company in mainCompanies ?? [])
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        company.logoUrl == null
                            ? const SizedBox(
                                height: 25,
                                width: 25,
                              )
                            : Image.network(
                                company.logoUrl!,
                                height: 25,
                                width: 25,
                              ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Text(
                            company.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                      'Arbetställe:',
                    ),
                    const Divider(
                      endIndent: 64,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Expanded(child: Text('Kollektivare:')),
                        Text(getCompanySite(company, siteId)?.employees.toString() ?? '0',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Expanded(child: Text('Medlemmar:')),
                        Text(getCompanySite(company, siteId)?.members.toString() ?? '0',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Expanded(child: Text('Förtroendevalda:')),
                        Text(getCompanySite(company, siteId)?.electedOfficials.toString() ?? '0',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Expanded(child: Text('Organisationsgrad:')),
                        Text(
                            '${((getCompanySite(company, siteId)?.members ?? 0) / (getCompanySite(company, siteId)?.employees ?? 1) * 100).toStringAsFixed(2)}%',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
            ],
          ),
        )
      ],
    );
  }
}
