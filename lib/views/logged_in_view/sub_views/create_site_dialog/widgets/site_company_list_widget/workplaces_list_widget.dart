import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/cubit/create_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/widgets/site_company_list_widget/workplace_list_item.dart';

class WorkplacesMainListWidget extends StatelessWidget {
  const WorkplacesMainListWidget(
    this.siteId,
    this.companyType, {
    super.key,
  });
  final String siteId;
  final CompanyType companyType;
  @override
  Widget build(BuildContext context) {
    var companiesOnSite = context.watch<CreateSiteCubit>().state.workplaces;

    companiesOnSite = companiesOnSite.where((company) => company.companyType == companyType).toList();

    return WorkplaceListItem(
      siteId: siteId,
      companyList: companiesOnSite,
      companyType: companyType,
    );
  }
}
