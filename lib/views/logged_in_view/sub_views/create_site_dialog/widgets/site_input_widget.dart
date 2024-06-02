import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/cubit/create_site_state.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/widgets/add_company_button.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/cubit/create_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/widgets/site_company_list_widget/workplaces_list_widget.dart';

class SiteInputWidget extends StatefulWidget {
  const SiteInputWidget({
    super.key,
  });

  @override
  State<SiteInputWidget> createState() => _SiteInputWidgetState();
}

class _SiteInputWidgetState extends State<SiteInputWidget> {
  MapController mapController = MapController();

  bool positionSelected = false;

  TextEditingController siteNameController = TextEditingController();
  TextEditingController siteDescriptionController = TextEditingController();
  TextEditingController siteUnitController = TextEditingController();
  SiteType? siteType;
  LatLng position = const LatLng(62.3875, 16.325556);

  @override
  void initState() {
    super.initState();

    siteNameController.addListener(_updateSiteName);
    siteDescriptionController.addListener(_updateSiteDescription);
    siteUnitController.addListener(_updateSiteUnit);
  }

  @override
  void dispose() {
    siteNameController.dispose();
    siteDescriptionController.dispose();
    siteUnitController.dispose();

    super.dispose();
  }

  void _updateSiteName() {
    context.read<CreateSiteCubit>().updateSiteBName(siteNameController.text);
  }

  void _updateSiteDescription() {
    // Update your state with the new site description here.
  }

  void _updateSiteUnit() {
    // Update your state with the new site unit here.
  }

  @override
  Widget build(BuildContext context) {
    var windowSize = MediaQuery.of(context).size;

    return BlocBuilder<CreateSiteCubit, CreateSiteState>(
      builder: (context, siteMarkerState) {
        siteNameController.text = siteMarkerState.site.name;
        siteDescriptionController.text = siteMarkerState.site.description;
        siteUnitController.text = siteMarkerState.site.unit.toString();

        siteType = siteMarkerState.site.type;
        if (siteMarkerState.site.coordinates.isNotEmpty) {
          position = LatLng(siteMarkerState.site.coordinates[0], siteMarkerState.site.coordinates[1]);
          positionSelected = true;
        }

        return Column(
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
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<SiteType>(
                    borderRadius: BorderRadius.circular(16),
                    value: siteType,
                    onChanged: (SiteType? newValue) {
                      setState(() {
                        siteType = newValue;
                      });
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
                height: 400,
                width: double.infinity,
                child: FlutterLocationPicker(
                  selectLocationButtonText: 'Bekräfta plats',
                  initZoom: 5,
                  minZoomLevel: 5,
                  showSearchBar: true,
                  initPosition: LatLong(position.latitude, position.longitude),
                  maxZoomLevel: 13,
                  countryFilter: 'SE',
                  trackMyPosition: false,
                  markerIconOffset: !positionSelected ? 50 : 50,
                  markerIcon: Icon(
                    !positionSelected ? Icons.location_on : Icons.location_on,
                    size: 50,
                    color: !positionSelected ? Colors.blue : Colors.green,
                  ),
                  urlTemplate:
                      'https://maps.geoapify.com/v1/tile/osm-bright-smooth/{z}/{x}/{y}.png?apiKey=fb622ee8c7a048f1b766548572313f5a',
                  searchBarBackgroundColor: Colors.white,
                  showSelectLocationButton: true,
                  selectedLocationButtonTextstyle: const TextStyle(fontSize: 16),
                  mapLanguage: 'sv',
                  searchBarHintText: 'Sök plats',
                  onError: (e) => print(e),
                  selectLocationButtonLeadingIcon: const Icon(Icons.check),
                  onPicked: (pickedData) {
                    setState(() {
                      positionSelected = true;
                      position = LatLng(pickedData.latLong.latitude, pickedData.latLong.longitude);
                    });
                  },
                  onChanged: (pickedData) {
                    setState(() {
                      positionSelected = false;
                    });
                  },
                  showContributorBadgeForOSM: false,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Row(
            //   children: [
            //     Expanded(
            //       child: TextField(
            //         controller: siteUnitController,
            //         decoration: const InputDecoration(
            //           labelText: 'Antal',
            //         ),
            //         onTapOutside: (value) => context.read<CreateSiteCubit>().updateSiteUnit(siteUnitController.text),
            //       ),
            //     ),
            //     const SizedBox(width: 16),
            //     Expanded(
            //       child: DropdownButtonFormField<UnitType>(
            //         borderRadius: BorderRadius.circular(16),
            //         value: siteMarkerState.unitType,
            //         hint: const Text('Enhetstyp'),
            //         onChanged: (UnitType? newValue) {
            //           context.read<CreateSiteCubit>().updateSiteUnitType(newValue!);
            //         },
            //         items: UnitType.values.map((UnitType unitType) {
            //           return DropdownMenuItem<UnitType>(
            //             value: unitType,
            //             child: Row(
            //               mainAxisSize: MainAxisSize.min,
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(unitType.name),
            //               ],
            //             ),
            //           );
            //         }).toList(),
            //       ),
            //     )
            //   ],
            // ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: siteDescriptionController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Beskrivning',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            AddCompanyButton(windowSize: windowSize, companyType: CompanyType.mainCompany),
            const SizedBox(height: 16),
            WorkplacesMainListWidget(siteMarkerState.site.id!, CompanyType.mainCompany),
            const SizedBox(
              height: 16,
            ),
            AddCompanyButton(windowSize: windowSize, companyType: CompanyType.subContractor),
            const SizedBox(height: 16),
            WorkplacesMainListWidget(siteMarkerState.site.id!, CompanyType.subContractor),
            const SizedBox(
              height: 16,
            ),
          ],
        );
      },
    );
  }
}
