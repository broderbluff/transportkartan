import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:transportkartan/constants/colors.dart';
import 'package:transportkartan/cubit/site_firestore_cubit.dart';
import 'package:transportkartan/cubit/local_cubits/create_site_cubit.dart';
import 'package:transportkartan/cubit/map_cubit.dart';
import 'package:transportkartan/helpers/site_marker_to_markers.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';
import 'package:transportkartan/views/navigation_rail/create_site_dialog/create_site_dialog.dart';

class LogisticsHubListWidget extends StatefulWidget {
  const LogisticsHubListWidget({super.key});

  @override
  State<LogisticsHubListWidget> createState() => _LogisticsHubListWidgetState();
}

class _LogisticsHubListWidgetState extends State<LogisticsHubListWidget> {
  int selectedIndex = -1; // Track the index of the selected ListTile
  int hoverIndex = -1; // Track the index of the selected ListTile

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SiteFirestoreCubit, SiteFirestoreState>(
      bloc: context.watch<SiteFirestoreCubit>()..fetchSites(),
      builder: (context, state) {
        if (state is InitialState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SitesList) {
          return ListView.builder(
            itemCount: state.markersList.length,
            itemBuilder: (context, index) {
              var siteMarkers = state.markersList;
              var siteMarker = siteMarkers[index];
              bool selected = selectedIndex == index;
              bool hover = hoverIndex == index;
              List<Marker> sortedMarkers = siteMarkerToMarkers(state.markersList);

              return BlocBuilder<MapControllerCubit, MapState>(
                builder: (context, state) {
                  return MouseRegion(
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
                            setState(() {
                              hoverIndex = index; // Update the selectedIndex when a ListTile is tapped
                            });
                          }
                        },
                        onLongPress: () {
                          context.read<CreateSiteCubit>().openSite(siteMarker);
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return const CreateSiteDialog(false);
                            },
                          );
                          setState(() {
                            selectedIndex = index; // Update the selectedIndex when a ListTile is tapped
                          });
                        },
                        onTap: () {
                          context.read<MapControllerCubit>().triggerControllers(
                              LatLng(siteMarker.coordinates[0], siteMarker.coordinates[1]), sortedMarkers[index], siteMarkers);
                          setState(() {
                            selectedIndex = index; // Update the selectedIndex when a ListTile is tapped
                          });
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
  }
}
