import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: 50,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: []),
            ),
          ),
        ),
        const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
