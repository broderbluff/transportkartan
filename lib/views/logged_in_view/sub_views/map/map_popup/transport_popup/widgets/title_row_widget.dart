import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/authentication/auth_cubit.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/create_site_dialog.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/cubit/create_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/cubit/selected_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/map/cubit/map_cubit.dart';

class PopupTitleRowWidget extends StatelessWidget {
  const PopupTitleRowWidget({
    super.key,
    required this.siteMarker,
  });

  final Site? siteMarker;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      child: Container(
        color: siteMarker?.type.getHeaderColor(),
        width: double.infinity,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 25,
                width: 25,
                child: SiteTypeIcon(siteType: siteMarker?.type ?? SiteType.combiTerminal),
              ),
            ),
            const Spacer(),
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
            context.read<AuthCubit>().currentUser!.userLevel <= 1
                ? IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      context.read<CreateSiteCubit>().openSite(siteMarker!);
                      context.read<MapControllerCubit>().hidePopup();

                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return const CreateSiteDialog(false);
                        },
                      );
                      context.read<SiteListCubit>().setSelectedIndex(-1);
                    },
                  )
                : const SizedBox.shrink(),
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
