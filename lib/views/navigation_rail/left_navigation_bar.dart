import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/views/navigation_rail/create_company_dialog/create_company_dialog.dart';
import 'package:transportkartan/views/navigation_rail/create_site_dialog/create_site_dialog.dart';
import 'package:transportkartan/views/navigation_rail/cubit/navigation_rail_cubit.dart';

class LeftNavigationBar extends StatelessWidget {
  const LeftNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationRailCubit, int>(
      builder: (context, state) {
        final navigationRailCubit = context.watch<NavigationRailCubit>();

        return NavigationRail(
          elevation: 25,
          extended: false,
          selectedLabelTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          labelType: NavigationRailLabelType.selected,
          backgroundColor: const Color(0xFF122850),
          unselectedIconTheme: const IconThemeData(color: Colors.white70),
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Hem'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.business),
              label: Text('Nytt företag'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.add_location),
              label: Text('Ny plats'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              label: Text('Inställningar'),
            ),
          ],
          selectedIndex: state,
          onDestinationSelected: (int index) {
            navigationRailCubit.changeIndex(index);

            if (index == 1) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return const CreateCompanyDialog();
                },
              );
            }

            if (index == 2) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return const CreateSiteDialog(true);
                },
              );
            }
          },
        );
      },
    );
  }
}
