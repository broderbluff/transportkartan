import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/cubit/local_cubits/create_site_cubit.dart';
import 'package:transportkartan/cubit/local_cubits/navigation_rail_cubit.dart';

class TitleRowWidget extends StatelessWidget {
  const TitleRowWidget(
    this.isNew, {
    super.key,
  });

  final bool isNew;
  @override
  Widget build(BuildContext context) {
    var siteCubit = context.read<CreateSiteCubit>();
    return Row(
      children: [
        Text(
          isNew ? 'Ny plats' : 'Redigera plats',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        CloseButton(
          onPressed: () {
            context.read<NavigationRailCubit>().changeIndex(0);
            siteCubit.resetState();
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
