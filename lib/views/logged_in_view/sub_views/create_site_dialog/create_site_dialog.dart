import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/cubit/create_site_cubit.dart';

import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/widgets/save_button_row_widget.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/widgets/site_input_widget.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/widgets/title_row_widget.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/cubit/navigation_rail_cubit.dart';

class CreateSiteDialog extends StatelessWidget {
  const CreateSiteDialog(
    this.isNew, {
    super.key,
  });

  final bool isNew;

  @override
  Widget build(BuildContext context) {
    var windowSize = MediaQuery.of(context).size;

    return Dialog(
      elevation: 24,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              height: windowSize.height * 0.8,
              width: windowSize.width * 0.6,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CreateSiteTitleRowWidget(isNew),
                      const SiteInputWidget(),
                      ButtonRowWidget(isNew),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: CloseButton(
                onPressed: () {
                  context.read<NavigationRailCubit>().changeIndex(0);
                  context.read<CreateSiteCubit>().resetState();
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
