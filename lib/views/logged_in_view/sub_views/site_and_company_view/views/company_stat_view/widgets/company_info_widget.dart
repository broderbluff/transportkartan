import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/union.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_company_dialog/cubit/create_company_cubit.dart';

class CompanyInfoWidget extends StatefulWidget {
  const CompanyInfoWidget({
    super.key,
  });

  @override
  State<CompanyInfoWidget> createState() => _CompanyInfoWidgetState();
}

class _CompanyInfoWidgetState extends State<CompanyInfoWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateCompanyCubit, Company>(
      builder: (context, companyState) {
        return Column(
          children: [
            Row(
              children: [
                const Text('Namn: '),
                Text(companyState.name),
              ],
            ),
            Row(
              children: [
                const Text('Organisationsnummer: '),
                Text(companyState.orgNumber),
              ],
            ),
            Row(
              children: [
                const Text('Beskrivning: '),
                Text(companyState.description),
              ],
            ),
          ],
        );
      },
    );
  }
}
