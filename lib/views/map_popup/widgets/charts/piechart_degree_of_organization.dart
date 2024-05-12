import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/helpers/company_on_site_fetcher.dart';

class DegreeOfOrganizationPieChart extends StatelessWidget {
  final Company company;
  final String siteId;

  DegreeOfOrganizationPieChart({required this.company, required this.siteId});

  @override
  Widget build(BuildContext context) {
    double members = getCompanySite(company, siteId)?.members.toDouble() ?? 0.0;
    double employees = getCompanySite(company, siteId)?.employees.toDouble() ?? 1.0;
    double nonMembers = employees - members;

    List<PieChartSectionData> sections = [
      PieChartSectionData(
        color: Colors.red,
        value: members,
        badgeWidget: Chip(
            label: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Medlemmar'),
            Text('${((members / employees) * 100).toStringAsFixed(2)}%'),
          ],
        )),
        titleStyle: TextStyle(color: Colors.blue),
      ),
      PieChartSectionData(
        color: Colors.grey,
        value: nonMembers,
        title: '',
      ),
    ];

    return SizedBox(
      height: 200.0,
      child: PieChart(
        PieChartData(
          sections: sections,
          sectionsSpace: 0,
          centerSpaceRadius: 40,
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}
