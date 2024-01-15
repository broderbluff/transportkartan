import 'package:flutter/material.dart';

import 'package:transportkartan/views/navigation_rail/views/create_site_dialog/widgets/save_button_row_widget.dart';
import 'package:transportkartan/views/navigation_rail/views/create_site_dialog/widgets/site_input_widget.dart';
import 'package:transportkartan/views/navigation_rail/views/create_site_dialog/widgets/title_row_widget.dart';

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
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          height: windowSize.height * 0.8,
          width: windowSize.width * 0.6,
          child: Column(
            children: [
              TitleRowWidget(isNew),
              const Expanded(child: SiteInputWidget()),
              const ButtonRowWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
