import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:transportkartan/cubit/map_cubit.dart';
import 'package:transportkartan/cubit/marker_cubit.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';
import 'package:transportkartan/data/mockdata/mockdata.dart';

class LogisticsHubsWidget extends StatelessWidget {
  const LogisticsHubsWidget({
    super.key,
  });

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
                    child: BlocBuilder<MarkerCubit, List<Marker>>(
                      builder: (context, stateMarker) {
                        return ListView.builder(
                          itemCount: stateMarker.length,
                          itemBuilder: (context, index) {
                            var siteMarker = listOfMarker[index];
                            return BlocBuilder<MapControllerCubit, MapState>(
                              builder: (context, state) {
                                return ListTile(
                                  onTap: () {
                                    context.read<MapControllerCubit>().triggerControllers(
                                        LatLng(siteMarker.coordinates[0], siteMarker.coordinates[1]), stateMarker[index]);
                                  },
                                  hoverColor: Colors.indigo[900],
                                  leading: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: SiteTypeIcon(siteType: siteMarker.type),
                                  ),
                                  tileColor: Colors.indigo,
                                  title: Text(siteMarker.name),
                                );
                              },
                            );
                          },
                        );
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
