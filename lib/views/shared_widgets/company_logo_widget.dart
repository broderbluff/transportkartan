import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transportkartan/data/models/company_model.dart';

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
