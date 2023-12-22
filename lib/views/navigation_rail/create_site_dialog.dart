import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:transportkartan/cubit/create_site_cubit.dart';
import 'package:transportkartan/cubit/firestore_cubit.dart';
import 'package:transportkartan/cubit/navigation_rail_cubit.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/enums/unit_type.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';

class CreateSiteDialog extends StatelessWidget {
  const CreateSiteDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var windowSize = MediaQuery.of(context).size;
    MapController mapController = MapController();
    return BlocBuilder<CreateSiteCubit, SiteMarker>(
      builder: (context, siteMarkerState) {
        return Dialog(
          elevation: 24,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              height: windowSize.height * 0.8,
              width: windowSize.width * 0.6,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Ny plats',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      CloseButton(
                        onPressed: () {
                          context.read<NavigationRailCubit>().changeIndex(0);
                          context.read<CreateSiteCubit>().resetState();
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 32),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    labelText: 'Namn',
                                  ),
                                  onChanged: (value) => context.read<CreateSiteCubit>().updateSiteName(value),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: DropdownButtonFormField<SiteType>(
                                  borderRadius: BorderRadius.circular(16),
                                  value: siteMarkerState.type,
                                  onChanged: (SiteType? newValue) {
                                    context.read<CreateSiteCubit>().updateSiteType(newValue!);
                                  },
                                  items: SiteType.values.map((SiteType siteType) {
                                    return DropdownMenuItem<SiteType>(
                                      value: siteType,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 25,
                                            height: 25,
                                            child: SiteTypeIcon(
                                              siteType: siteType,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(siteType.name),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: SizedBox(
                              height: 250,
                              width: double.infinity,
                              child: FlutterMap(
                                  key: const Key('create_site_map'),
                                  mapController: mapController,
                                  options: MapOptions(
                                    initialCenter: const LatLng(62.3875, 16.325556),
                                    initialZoom: 5,
                                    onTap: (tapPosition, point) {
                                      context.read<CreateSiteCubit>().updateSiteCoordinates([point.latitude, point.longitude]);
                                    },
                                  ),
                                  children: [
                                    TileLayer(
                                      tileProvider: CancellableNetworkTileProvider(),
                                      urlTemplate:
                                          'https://maps.geoapify.com/v1/tile/osm-bright-smooth/{z}/{x}/{y}.png?apiKey=fb622ee8c7a048f1b766548572313f5a',
                                      userAgentPackageName: 'se.transport.transportkartan',
                                    ),
                                    siteMarkerState.coordinates[0] == 0
                                        ? const SizedBox.shrink()
                                        : MarkerLayer(markers: [
                                            Marker(
                                                point: LatLng(siteMarkerState.coordinates[0], siteMarkerState.coordinates[1]),
                                                child: const Icon(Icons.location_on))
                                          ]),
                                  ]),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    labelText: 'Antal',
                                  ),
                                  onChanged: (value) => context.read<CreateSiteCubit>().updateSiteUnit(value),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: DropdownButtonFormField<UnitType>(
                                  borderRadius: BorderRadius.circular(16),
                                  value: siteMarkerState.unitType,
                                  hint: Text('Enhets typ'),
                                  onChanged: (UnitType? newValue) {
                                    context.read<CreateSiteCubit>().updateSiteUnitType(newValue!);
                                  },
                                  items: UnitType.values.map((UnitType unitType) {
                                    return DropdownMenuItem<UnitType>(
                                      value: unitType,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(unitType.name),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextField(
                            maxLines: 2,
                            decoration: const InputDecoration(
                              labelText: 'Beskrivning',
                            ),
                            onChanged: (value) => context.read<CreateSiteCubit>().updateSiteDescription(value),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            context.read<CreateSiteCubit>().resetState();
                          },
                          child: const Text('Rensa')),
                      BlocConsumer<SitesFirestoreCubit, SitesFirestoreState>(
                        listener: (context, state) {
                          if (state is CreateSuccess) {
                            context.read<CreateSiteCubit>().resetState();

                            context.read<NavigationRailCubit>().changeIndex(0);
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  'Plats skapad!',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          } else if (state is CreateFailure) {
                            // Handle CreateFailure state
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  'Error: ${state.error}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          // Build your UI based on the current state
                          return ElevatedButton(
                            onPressed: () {
                              context.read<SitesFirestoreCubit>().createSite(siteMarkerState);
                            },
                            child: const Text('Skapa'),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
