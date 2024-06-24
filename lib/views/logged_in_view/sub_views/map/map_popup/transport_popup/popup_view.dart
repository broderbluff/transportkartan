import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:transportkartan/constants/values.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/helpers/letter_to_color.dart';
import 'package:transportkartan/helpers/number_formatter.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/cubit/selected_site_cubit.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/helpers/site_marker_fetcher.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/map/map_popup/transport_popup/widgets/workplace_widget.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/map/map_popup/transport_popup/widgets/title_row_widget.dart';

class TransportPopup extends StatefulWidget {
  final Marker marker;
  final List<Site> listOfMarker;

  const TransportPopup(this.marker, this.listOfMarker, {super.key});

  @override
  State<TransportPopup> createState() => _TransportPopupState();
}

class _TransportPopupState extends State<TransportPopup> {
  late Site? siteMarker;

  @override
  void initState() {
    siteMarker = findSiteMarkerByKey(widget.marker.key!, widget.listOfMarker);
    context.read<SiteListCubit>().setSelectedIndex(widget.listOfMarker.indexOf(siteMarker!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      surfaceTintColor: Colors.white,
      elevation: 25,
      child: SizedBox(
        width: 400,
        height: siteMarker!.type == SiteType.measuringPointRail || siteMarker!.type == SiteType.measuringPointRoad ? null : 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            PopupTitleRowWidget(siteMarker: siteMarker),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 20.0, right: 40)),
                      siteMarker!.type == SiteType.measuringPointRail || siteMarker!.type == SiteType.measuringPointRoad
                          ? const SizedBox.shrink()
                          : PopupCompanyWidget(
                              siteId: siteMarker?.id ?? '',
                              title: 'Operatör:',
                              type: CompanyType.mainCompany,
                            ),
                      const SizedBox(
                        height: 16,
                      ),
                      siteMarker!.type == SiteType.measuringPointRail || siteMarker!.type == SiteType.measuringPointRoad
                          ? PopupCompanyWidget(
                              siteId: siteMarker?.id ?? '',
                              title: 'Underleverantör:',
                              type: CompanyType.subContractor,
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 16,
                      ),
                      siteMarker!.type == SiteType.measuringPointRail || siteMarker!.type == SiteType.measuringPointRoad
                          ? PopupCompanyWidget(
                              siteId: siteMarker?.id ?? '',
                              type: CompanyType.securityCompany,
                              title: 'Säkerhetsbolag:',
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 16,
                      ),
                      siteMarker!.type == SiteType.measuringPointRail || siteMarker!.type == SiteType.measuringPointRoad
                          ? PopupCompanyWidget(
                              siteId: siteMarker?.id ?? '',
                              type: CompanyType.staffingCompany,
                              title: 'Bemanningsbolag:',
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(flex: 1, child: Text('Lastägare:', style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                            flex: 2,
                            child: Wrap(
                              spacing: 4.0, // gap between adjacent chips
                              runSpacing: 4.0, // gap between lines
                              children: siteMarker?.handleGoods
                                      ?.map((good) => Chip(
                                            label: Text(good),
                                            backgroundColor: getColorBasedOnFirstCharacter(good),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(cornerRadius),
                                            ),
                                            visualDensity: VisualDensity.compact,
                                            labelPadding: const EdgeInsets.all(1.0), // Reduced padding
                                          ))
                                      .toList() ??
                                  [],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(flex: 1, child: Text('Stridbart gods:', style: TextStyle(fontWeight: FontWeight.bold))),
                          Expanded(
                            flex: 2,
                            child: Wrap(
                              spacing: 4.0, // gap between adjacent chips
                              runSpacing: 4.0, // gap between lines
                              children: siteMarker?.goodsOfInterest
                                      ?.map((good) => Chip(
                                            label: Text(good),
                                            backgroundColor: getColorBasedOnFirstCharacter(good),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(cornerRadius),
                                            ),
                                            visualDensity: VisualDensity.compact,
                                            labelPadding: const EdgeInsets.all(1.0), // Reduced padding
                                          ))
                                      .toList() ??
                                  [],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       flex: 1,
                      //       child: Text(
                      //         siteMarker!.type == SiteType.measuringPointRail || siteMarker!.type == SiteType.measuringPointRoad
                      //             ? 'Årlig trafik:'
                      //             : 'Godsmängd:',
                      //         style: const TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       flex: 2,
                      //       child: Text(
                      //         '${formatNumber(siteMarker?.unit ?? 0)} ${siteMarker?.unitType?.name ?? ''}',
                      //         style: const TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
