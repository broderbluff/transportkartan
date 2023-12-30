import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:transportkartan/cubit/company_firestore_cubit.dart';
import 'package:transportkartan/views/site_and_company_view/cubit/selected_site_cubit.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/helpers/site_marker_fetcher.dart';
import 'package:transportkartan/helpers/total_employees.dart';
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
    context.read<CompanyFirestoreCubit>().fetchCompaniesFromId(siteMarker?.companies ?? []);
    context.read<SiteListCubit>().setSelectedIndex(widget.listOfMarker.indexOf(siteMarker!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Medlemmar": 40,
      "Anställda": 100,
    };

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      surfaceTintColor: Colors.white,
      elevation: 25,
      child: SizedBox(
        width: 400,
        height: 600,
        child: BlocBuilder<CompanyFirestoreCubit, CompanyFirestoreState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const LoadingWidget();
            }
            if (state is CompanyListFetchedByIdState) {
              int totalEmployees = calculateTotalEmployees(state.companyList);
              return Column(
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
                        PopupCompanyWidget(state),
                        const SizedBox(
                          height: 16,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Beskrivning: '),
                            // Text(siteMarker.description),
                          ],
                        ),
                        const Text(
                            'Mertz ansvarar för kombiterminalen tillsammans med åkeri som ligger i anslutning till terminalen',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Anställda: '),

                            //  Text(siteMarker.members.toString()),
                            Text('$totalEmployees', style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Medlemmar: '),
                            //  Text(siteMarker.members.toString()),
                            Text('40', style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Företroendevalda: '),
                            //Text(siteMarker.electedOfficials.toString()),
                            Text('2', style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Underenterprenörer: '),
                            //Text(siteMarker.staffingCompanies.toString()),
                            Text('Inga', style: TextStyle(fontWeight: FontWeight.bold))
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: PieChart(
                            dataMap: dataMap,
                            colorList: const [Colors.green, Colors.red],
                            animationDuration: const Duration(milliseconds: 800),
                            chartLegendSpacing: 32,
                            initialAngleInDegree: 0,
                            chartType: ChartType.disc,
                            ringStrokeWidth: 32,
                            centerText: "Anslutningsgrad",
                            legendOptions: const LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.right,
                              showLegends: true,
                              legendTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            chartValuesOptions: const ChartValuesOptions(
                              chartValueStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              showChartValueBackground: true,
                              showChartValues: true,
                              showChartValuesInPercentage: true,
                              showChartValuesOutside: false,
                              decimalPlaces: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
            return const LoadingWidget();
          },
        ),
      ),
    );
  }
}
