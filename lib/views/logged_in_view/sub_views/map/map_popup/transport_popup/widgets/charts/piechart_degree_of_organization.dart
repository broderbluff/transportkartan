import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:transportkartan/data/models/workplace_model.dart';

class DegreeOfOrganizationPieChart extends StatelessWidget {
  final Workplace company;
  final String siteId;

  const DegreeOfOrganizationPieChart({super.key, required this.company, required this.siteId});

  @override
  Widget build(BuildContext context) {
    double members = company.members.toDouble();
    double employees = company.employees.toDouble();
    double nonMembers = employees - members;

    List<PieChartSectionData> sections = [
      PieChartSectionData(
        color: Colors.red,
        value: members,
        badgeWidget: Chip(
            label: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Medlemmar'),
            Text('${((members / employees) * 100).toStringAsFixed(2)}%'),
          ],
        )),
        titleStyle: const TextStyle(color: Colors.blue),
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
