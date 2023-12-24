import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/cubit/create_site_cubit.dart';
import 'package:transportkartan/cubit/navigation_rail_cubit.dart';

class TitleRowWidget extends StatelessWidget {
  const TitleRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Ny plats',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        CloseButton(
          onPressed: () {
            context.read<NavigationRailCubit>().changeIndex(0);
            context.read<CreateSiteCubit>().resetState();
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
