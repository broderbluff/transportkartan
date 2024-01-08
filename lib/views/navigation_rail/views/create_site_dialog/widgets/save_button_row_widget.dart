import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/cubit/site_firestore_cubit.dart';
import 'package:transportkartan/views/navigation_rail/views/create_site_dialog/cubit/create_site_cubit.dart';
import 'package:transportkartan/views/navigation_rail/cubit/navigation_rail_cubit.dart';

class ButtonRowWidget extends StatelessWidget {
  const ButtonRowWidget({
    super.key,
  });

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
            if (state is CreateSuccess) {
              context.read<CreateSiteCubit>().resetState();

              context.read<NavigationRailCubit>().changeIndex(0);
              context.read<SiteFirestoreCubit>().fetchSites();
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
            } else if (state is CreateFailure) {
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
                context.read<SiteFirestoreCubit>().createSite(siteMarkerState);
              },
              child: const Text('Skapa'),
            );
          },
        )
      ],
    );
  }
}
