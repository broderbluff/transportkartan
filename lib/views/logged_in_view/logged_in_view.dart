import 'package:flutter/material.dart';
import 'package:transportkartan/constants/colors.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/map/map_view.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/left_navigation_bar.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/site_and_company_view.dart';

class LoggedInView extends StatelessWidget {
  const LoggedInView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const LeftNavigationBar(),
            Container(width: 140, height: double.infinity, color: mainColor),
            const Expanded(
              child: MapWidget(),
            ),
          ],
        ),
        const LogisticsHubsWidget(),
      ],
    );
  }
}
