import 'package:flutter/material.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/views/site_and_company_view/views/company_list.dart';

class AddCompanyButton extends StatelessWidget {
  const AddCompanyButton({
    super.key,
    required this.windowSize,
    required this.companyType,
  });

  final Size windowSize;
  final CompanyType companyType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  elevation: 24,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      height: windowSize.height * 0.8,
                      width: windowSize.width * 0.6,
                      child: Column(
                        children: [
                          Expanded(flex: 1, child: CompanyListWidget(true, companyType)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          icon: const Icon(Icons.add),
          label: Text('Lägg till ${companyType.name}'),
        ),
      ],
    );
  }
}
