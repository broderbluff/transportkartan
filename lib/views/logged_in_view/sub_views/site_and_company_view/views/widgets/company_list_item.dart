import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.company,
  });

  final Company company;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: company.logoUrl == null || company.logoUrl!.isEmpty
          ? const Icon(Icons.business_sharp)
          : company.logoUrl!.endsWith('.svg')
              ? SvgPicture.network(
                  company.logoUrl!,
                  placeholderBuilder: (BuildContext context) => const CircularProgressIndicator(),
                )
              : Image.network(
                  company.logoUrl!,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    );
                  },
                ),
    );
  }
}
