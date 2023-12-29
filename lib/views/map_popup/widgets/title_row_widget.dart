import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/constants/colors.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';
import 'package:transportkartan/views/logistics_hub/cubit/selected_site_cubit.dart';
import 'package:transportkartan/views/map/cubit/map_cubit.dart';

class PopupTitleRowWidget extends StatelessWidget {
  const PopupTitleRowWidget({
    super.key,
    required this.siteMarker,
  });

  final SiteMarker? siteMarker;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      child: Container(
        color: mainColor,
        width: double.infinity,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Spacer(),
            SizedBox(height: 25, width: 25, child: SiteTypeIcon(siteType: siteMarker?.type ?? SiteType.combiTerminal)),
            const SizedBox(width: 8),
            Text(
              siteMarker?.name ?? 'Namn saknas',
              overflow: TextOverflow.fade,
              softWrap: false,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            CloseButton(
                color: Colors.white,
                onPressed: () {
                  context.read<SiteListCubit>().setSelectedIndex(-1);

                  context.read<MapControllerCubit>().hidePopup();
                })
          ]),
        ),
      ),
    );
  }
}
