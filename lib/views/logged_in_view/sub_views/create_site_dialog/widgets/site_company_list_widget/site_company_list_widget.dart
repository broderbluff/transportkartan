import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/crud/workplace_firestore_cubit.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/models/state/workplace_firestore_state.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/widgets/site_company_list_widget/company_on_site_row_widget.dart';

class SiteCompaniesListWidget extends StatelessWidget {
  const SiteCompaniesListWidget(
    this.siteId,
    this.companyType, {
    super.key,
  });
  final String siteId;
  final CompanyType companyType;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkplaceFirestoreCubit, WorkplaceFirestoreState>(
      bloc: context.read<WorkplaceFirestoreCubit>()..fetchAllWorkplaces(),
      builder: (context, companyData) {
        const Center(child: Text('Failed to load companies'));

        if (companyData is AllWorkplaces) {
          var companiesOnSite = context.read<WorkplaceFirestoreCubit>().findWorkplacesBySiteId(siteId, companyType: companyType);
          return CompanyOnSiteListWidget(
            siteId: siteId,
            companyList: companiesOnSite,
            companyType: companyType,
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
