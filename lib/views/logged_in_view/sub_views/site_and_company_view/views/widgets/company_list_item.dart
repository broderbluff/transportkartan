import 'package:flutter/material.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/views/shared_widgets/company_logo_widget.dart';

class CompanyListItem extends StatelessWidget {
  const CompanyListItem({
    super.key,
    required this.company,
    required this.selected,
    required this.hover,
  });

  final Company company;
  final bool selected;
  final bool hover;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const SizedBox(
            width: 8,
          ),
          LogoWidget(company: company),
          const SizedBox(width: 8),
          Text(
            company.name,
            style: TextStyle(
              color: selected || hover ? Colors.white : Colors.black,
              fontWeight: selected || hover ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
