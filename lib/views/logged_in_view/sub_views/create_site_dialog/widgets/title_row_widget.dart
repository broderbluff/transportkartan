import 'package:flutter/material.dart';

class CreateSiteTitleRowWidget extends StatelessWidget {
  const CreateSiteTitleRowWidget(
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
