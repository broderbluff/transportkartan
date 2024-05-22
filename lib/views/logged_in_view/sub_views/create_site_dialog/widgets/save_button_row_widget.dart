import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/crud/site_firestore_cubit.dart';
import 'package:transportkartan/data/models/state/site_firestore_state.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/cubit/create_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/cubit/navigation_rail_cubit.dart';

class ButtonRowWidget extends StatelessWidget {
  const ButtonRowWidget(
    this.isNew, {
    super.key,
  });

  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {
              context.read<CreateSiteCubit>().resetState();
            },
            child: const Text('Rensa')),
        BlocConsumer<SiteFirestoreCubit, SiteFirestoreState>(
          listener: (context, state) {
            if (state is SiteCreateSuccess) {
              context.read<CreateSiteCubit>().resetState();

              context.read<NavigationRailCubit>().changeIndex(0);
              context.read<SiteFirestoreCubit>().fetchAllSites();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    'Plats skapad!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            } else if (state is SiteFailure) {
              // Handle CreateFailure state
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    'Error: ${state.error}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            // Build your UI based on the current state
            return ElevatedButton(
              onPressed: () {
                var siteMarkerState = context.read<CreateSiteCubit>().state;

                isNew
                    ? context.read<SiteFirestoreCubit>().createSite(siteMarkerState)
                    : context.read<SiteFirestoreCubit>().updateSite(siteMarkerState);
              },
              child: Text(isNew ? 'Skapa' : 'Uppdatera'),
            );
          },
        )
      ],
    );
  }
}
