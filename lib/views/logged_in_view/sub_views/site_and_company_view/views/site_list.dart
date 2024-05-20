import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:transportkartan/constants/colors.dart';
import 'package:transportkartan/data/models/state/site_firestore_state.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/cubit/filter_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/cubit/selected_site_cubit.dart';
import 'package:transportkartan/crud/site_firestore_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/map/cubit/map_cubit.dart';
import 'package:transportkartan/helpers/site_marker_to_markers.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/views/create_site_dialog/create_site_dialog.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/views/create_site_dialog/cubit/create_site_cubit.dart';

class SiteListMainWidget extends StatelessWidget {
  const SiteListMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SiteListCubit, SiteSelectedState>(
      bloc: context.read<SiteListCubit>(),
      builder: (siteContext, siteState) {
        return BlocBuilder<FilterSiteCubit, SiteTypesState>(
          builder: (context, state) {
            return BlocBuilder<SiteFirestoreCubit, SiteFirestoreState>(
              bloc: context.read<SiteFirestoreCubit>()
                ..fetchAllSites(sortByType: true, siteTypes: state.selectedSiteTypes.toList()),
              builder: (context, state) {
                if (state is SiteInitialState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is AllSites) {
                  return ListView.builder(
                    itemCount: state.sitesList.length,
                    itemBuilder: (context, index) {
                      var siteMarkers = state.sitesList;
                      var siteMarker = siteMarkers[index];

                      bool selected = siteState.selectedIndex == index;
                      // if (context.read<SelectedSiteCubit>().state == siteMarker.id) {
                      //   siteContext.read<SiteListCubit>().setSelectedIndex(index);
                      // }
                      bool hover = siteState.hoverIndex == index;
                      List<Marker> sortedMarkers = siteMarkerToMarkers(state.sitesList);

                      return BlocBuilder<MapControllerCubit, MapState>(
                        builder: (context, state) {
                          return MouseRegion(
                            onExit: (event) {
                              siteContext.read<SiteListCubit>().setHoverIndex(-1);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: selected
                                    ? mainColor
                                    : hover
                                        ? Colors.blue[200]
                                        : Colors.white,
                              ),
                              child: InkWell(
                                onHover: (value) {
                                  if (value) {
                                    siteContext
                                        .read<SiteListCubit>()
                                        .setHoverIndex(index); // Update the selectedIndex when a ListTile is tapped
                                  }
                                },
                                onLongPress: () {
                                  context.read<CreateSiteCubit>().openSite(siteMarker);
                                  context.read<MapControllerCubit>().hidePopup();

                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const CreateSiteDialog(false);
                                    },
                                  );
                                  siteContext.read<SiteListCubit>().setSelectedIndex(index);
                                },
                                onTap: () {
                                  context.read<MapControllerCubit>().triggerControllers(
                                      LatLng(siteMarker.coordinates[0], siteMarker.coordinates[1]),
                                      sortedMarkers[index],
                                      siteMarkers);
                                  siteContext.read<SiteListCubit>().setSelectedIndex(index);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: SiteTypeIcon(siteType: siteMarker.type),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          siteMarker.name,
                                          style: TextStyle(
                                            color: selected || hover ? Colors.white : Colors.black,
                                            fontWeight: selected || hover ? FontWeight.bold : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
                return const Text('ERRROR');
              },
            );
          },
        );
      },
    );
  }
}
