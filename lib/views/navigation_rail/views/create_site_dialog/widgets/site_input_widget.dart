import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/enums/unit_type.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';
import 'package:transportkartan/views/navigation_rail/views/create_site_dialog/widgets/add_company_button.dart';
import 'package:transportkartan/views/navigation_rail/views/create_site_dialog/cubit/create_site_cubit.dart';

class SiteInputWidget extends StatelessWidget {
  const SiteInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MapController mapController = MapController();
    var windowSize = MediaQuery.of(context).size;

    return BlocBuilder<CreateSiteCubit, SiteMarker>(
      builder: (context, siteMarkerState) {
        TextEditingController siteNameController = TextEditingController(text: siteMarkerState.name);
        TextEditingController siteDescriptionController = TextEditingController(text: siteMarkerState.description);
        TextEditingController siteUnitController = TextEditingController(text: siteMarkerState.unit.toString());

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: siteNameController,
                      decoration: const InputDecoration(
                        labelText: 'Namn',
                      ),
                      onTapOutside: (event) => context.read<CreateSiteCubit>().updateSiteName(siteNameController.text),
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
                        initialCenter: siteMarkerState.coordinates[0] == 0
                            ? const LatLng(62.3875, 16.325556)
                            : LatLng(siteMarkerState.coordinates[0], siteMarkerState.coordinates[1]),
                        initialZoom: siteMarkerState.coordinates[0] == 0 ? 5 : 12,
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
                      controller: siteUnitController,
                      decoration: const InputDecoration(
                        labelText: 'Antal',
                      ),
                      onTapOutside: (value) => context.read<CreateSiteCubit>().updateSiteUnit(siteUnitController.text),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<UnitType>(
                      borderRadius: BorderRadius.circular(16),
                      value: siteMarkerState.unitType,
                      hint: const Text('Enhetstyp'),
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
                controller: siteDescriptionController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Beskrivning',
                ),
                onTapOutside: (value) => context.read<CreateSiteCubit>().updateSiteDescription(siteDescriptionController.text),
              ),
              const SizedBox(
                height: 16,
              ),
              AddCompanyButton(windowSize: windowSize, companyType: CompanyType.mainCompany),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
