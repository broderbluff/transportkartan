import 'package:flutter/material.dart';
import 'package:transportkartan/data/models/company_model.dart';

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
          SizedBox(
            width: 40,
            height: 40,
            child: company.logoUrl!.isEmpty ? const Icon(Icons.business_sharp) : Image.network(company.logoUrl!),
          ),
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
