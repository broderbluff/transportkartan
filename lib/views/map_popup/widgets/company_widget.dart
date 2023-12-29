import 'package:flutter/material.dart';
import 'package:transportkartan/cubit/company_firestore_cubit.dart';

class PopupCompanyWidget extends StatelessWidget {
  const PopupCompanyWidget(
    this.state, {
    super.key,
  });

  final CompanyListFetchedByIdState state;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Företag: '),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (var company in state.companyList)
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
                  Text(company.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
          ],
        )
      ],
    );
  }
}
