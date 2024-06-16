import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:transportkartan/data/models/workplace_model.dart';

class DegreeOfOrganizationPieChart extends StatelessWidget {
  final Workplace workplace;
  final bool vertical;

  const DegreeOfOrganizationPieChart({super.key, required this.workplace, required this.vertical});

  @override
  Widget build(BuildContext context) {
    double members = workplace.members.toDouble();
    double employees = workplace.employees.toDouble();
    double otherUnion = workplace.otherUnion.toDouble();
    double nonMembers = employees - members - otherUnion;

    List<PieChartSectionData> sections = [
      PieChartSectionData(
        color: Colors.grey,
        value: nonMembers,
        showTitle: false,
        badgePositionPercentageOffset: 1.2,
        badgeWidget: Chip(
          label: Text('${((nonMembers)).toStringAsFixed(0)}%'),
        ),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: members,
        showTitle: false,
        badgePositionPercentageOffset: 1.2,
        badgeWidget: Chip(
          label: Text('${((members / employees) * 100).toStringAsFixed(0)}%'),
        ),
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: members,
        showTitle: false,
        badgePositionPercentageOffset: 1.2,
        badgeWidget: Chip(
          label: Text('${((otherUnion / employees) * 100).toStringAsFixed(0)}%'),
        ),
      ),
    ];

    return SizedBox(
      height: vertical ? 300 : 200.0,
      child: vertical
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                pieChart(sections: sections, flex: 1),
                SizedBox(
                  height: 64,
                ),
                description(flex: 1),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                description(flex: 1),
                pieChart(sections: sections, flex: 4),
              ],
            ),
    );
  }

  Expanded description({required int flex}) {
    return Expanded(
      flex: flex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.orange,
              ),
              SizedBox(
                width: 4,
              ),
              Text('Annat förbund')
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green,
              ),
              SizedBox(
                width: 4,
              ),
              Text('Transport')
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.grey,
              ),
              SizedBox(
                width: 4,
              ),
              Text('Oorganiserade')
            ],
          ),
        ],
      ),
    );
  }

  Expanded pieChart({required List<PieChartSectionData> sections, required int flex}) {
    return Expanded(
      flex: flex,
      child: PieChart(
        PieChartData(
          titleSunbeamLayout: false,
          sections: sections,
          sectionsSpace: 10,
          centerSpaceRadius: 40,
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}
