import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/cubit/create_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/cubit/navigation_rail_cubit.dart';

class TitleRowWidget extends StatelessWidget {
  const TitleRowWidget(
    this.isNew, {
    super.key,
  });

  final bool isNew;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          isNew ? 'Ny plats' : 'Redigera plats',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
      ],
    );
  }
}
