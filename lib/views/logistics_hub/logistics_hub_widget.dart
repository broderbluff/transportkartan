import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:transportkartan/constants/colors.dart';
import 'package:transportkartan/cubit/create_site_cubit.dart';
import 'package:transportkartan/cubit/firestore_cubit.dart';
import 'package:transportkartan/cubit/map_cubit.dart';
import 'package:transportkartan/cubit/marker_cubit.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';
import 'package:transportkartan/data/mockdata/mockdata.dart';
import 'package:transportkartan/views/navigation_rail/create_site_dialog/create_site_dialog.dart';

class LogisticsHubsWidget extends StatefulWidget {
  const LogisticsHubsWidget({
    super.key,
  });

  @override
  State<LogisticsHubsWidget> createState() => _LogisticsHubsWidgetState();
}

class _LogisticsHubsWidgetState extends State<LogisticsHubsWidget> {
  int selectedIndex = -1; // Track the index of the selected ListTile
  int hoverIndex = -1; // Track the index of the selected ListTile

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 90,
      bottom: 0,
      width: 300, // Adjust the width as needed
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4), // Customize the shadow color and opacity
              blurRadius: 10, // Adjust the blur radius as needed
              spreadRadius: 2, // Adjust the spread radius as needed
              offset: const Offset(0, 4), // Adjust the offset as needed
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          child: AnimatedContainer(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            duration: const Duration(milliseconds: 300),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 32, right: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Logistikhubbar', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Chip(
                        avatar: CircleAvatar(
                          backgroundColor: Colors.red.shade500,
                          child: const Text('H'),
                        ),
                        label: const Text('Hubbar'),
                      ),
                      Chip(
                        avatar: CircleAvatar(
                          backgroundColor: Colors.grey.shade800,
                          child: const Text('F'),
                        ),
                        label: const Text('Företag'),
                      )
                    ],
                  ),
                  Expanded(
                    child: BlocBuilder<FireStoreCubit, FirestoreState>(
                      bloc: context.watch<FireStoreCubit>()..fetchSites(),
                      builder: (context, state) {
                        if (state is InitialState) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (state is SitesList) {
                          return ListView.builder(
                            itemCount: state.markersList.length,
                            itemBuilder: (context, index) {
                              var siteMarker = state.markersList[index];
                              bool selected = selectedIndex == index;
                              bool hover = hoverIndex == index;

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
                                              return const CreateSiteDialog();
                                            },
                                          );
                                          setState(() {
                                            selectedIndex = index; // Update the selectedIndex when a ListTile is tapped
                                          });
                                        },
                                        onTap: () {
                                          // context.read<MapControllerCubit>().triggerControllers(
                                          //       LatLng(siteMarker.coordinates[0], siteMarker.coordinates[1]),
                                          //       stateMarker[index],
                                          //     );
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
                        return Text('ERRROR');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
