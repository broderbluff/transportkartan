import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_company_dialog/cubit/create_company_cubit.dart';

import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/cubit/navigation_rail_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/views/company_stat_view/widgets/company_info_widget.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/views/company_stat_view/widgets/company_workplace_widget.dart';
import 'package:transportkartan/views/shared_widgets/company_logo_widget.dart';

class CompanyStatsDialog extends StatelessWidget {
  const CompanyStatsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var windowSize = MediaQuery.of(context).size;

    return Dialog(
      elevation: 24,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          height: windowSize.height * 0.7,
          width: windowSize.width * 0.6,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    LogoWidget(company: context.read<CreateCompanyCubit>().state),
                    SizedBox(width: 8),
                    Text(
                      context.read<CreateCompanyCubit>().state.name,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    CloseButton(
                      onPressed: () {
                        context.read<NavigationRailCubit>().changeIndex(0);
                        context.read<CreateCompanyCubit>().resetState();

                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
                const SizedBox(height: 32),
                const CompanyInfoWidget(),
                const SizedBox(height: 32),
                CompanyWorkplaceWidget(
                  companyId: context.read<CreateCompanyCubit>().state.id,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
