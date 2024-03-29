import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:transportkartan/cubit/company_firestore_cubit.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/helpers/company_on_site_fetcher.dart';
import 'package:transportkartan/helpers/number_formatter.dart';
import 'package:transportkartan/views/site_and_company_view/cubit/selected_site_cubit.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/helpers/site_marker_fetcher.dart';
import 'package:transportkartan/views/map_popup/widgets/company_widget.dart';
import 'package:transportkartan/views/map_popup/widgets/loading_widget.dart';
import 'package:transportkartan/views/map_popup/widgets/title_row_widget.dart';

class MapPopup extends StatefulWidget {
  final Marker marker;
  final List<SiteMarker> listOfMarker;

  const MapPopup(this.marker, this.listOfMarker, {super.key});

  @override
  State<MapPopup> createState() => _MapPopupState();
}

class _MapPopupState extends State<MapPopup> {
  late SiteMarker? siteMarker;
  @override
  void initState() {
    siteMarker = findSiteMarkerByKey(widget.marker.key!, widget.listOfMarker);
    context.read<CompanyFirestoreCubit>().fetchAllComapnies();
    context.read<SiteListCubit>().setSelectedIndex(widget.listOfMarker.indexOf(siteMarker!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      surfaceTintColor: Colors.white,
      elevation: 25,
      child: SizedBox(
        width: 400,
        height: siteMarker!.type == SiteType.measuringPointRail || siteMarker!.type == SiteType.measuringPointRoad ? null : 600,
        child: BlocBuilder<CompanyFirestoreCubit, CompanyFirestoreState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const LoadingWidget();
            }
            if (state is AllCompaniesState) {
              var companiesOnSite = getCompaniesFromCompanyIdOnSite(siteMarker!.companies, state.companyList);
              var subContractorsOnSite = getCompaniesFromCompanyIdOnSite(siteMarker!.subContractors ?? [], state.companyList);
              var staffingCompaniesOnSite =
                  getCompaniesFromCompanyIdOnSite(siteMarker!.staffingCompanies ?? [], state.companyList);
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    PopupTitleRowWidget(siteMarker: siteMarker),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(padding: EdgeInsets.only(left: 20.0, right: 40)),
                          siteMarker!.type == SiteType.measuringPointRail || siteMarker!.type == SiteType.measuringPointRoad
                              ? const SizedBox.shrink()
                              : PopupCompanyWidget(siteMarker?.id ?? '', companiesOnSite),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              const Expanded(flex: 1, child: Text('Beskrivning:', style: TextStyle(fontWeight: FontWeight.bold))),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  siteMarker?.description ?? '',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  siteMarker!.type == SiteType.measuringPointRail ||
                                          siteMarker!.type == SiteType.measuringPointRoad
                                      ? 'Årlig trafik:'
                                      : 'Godsmängd:',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '${formatNumber(siteMarker?.unit ?? 0)} ${siteMarker?.unitType?.name ?? ''}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
            return const LoadingWidget();
          },
        ),
      ),
    );
  }
}
