import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:transportkartan/constants/colors.dart';
import 'package:transportkartan/cubit/company_firestore_cubit.dart';
import 'package:transportkartan/cubit/map_cubit.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/helpers/site_marker_fetcher.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';
import 'package:transportkartan/helpers/total_employees.dart';

class MapPopup extends StatelessWidget {
  final Marker marker;
  final List<SiteMarker> listOfMarker;

  const MapPopup(this.marker, this.listOfMarker, {super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Medlemmar": 40,
      "Anställda": 100,
    };
    final siteMarker = findSiteMarkerByKey(marker.key!, listOfMarker);
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
          bloc: context.read<CompanyFirestoreCubit>()..fetchCompaniesFromId(siteMarker?.companies ?? []),
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
                  ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
                    child: Container(
                      color: mainColor,
                      width: double.infinity,
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          const Spacer(),
                          SizedBox(
                              height: 25, width: 25, child: SiteTypeIcon(siteType: siteMarker?.type ?? SiteType.combiTerminal)),
                          const SizedBox(width: 8),
                          Text(
                            siteMarker?.name ?? 'Namn saknas',
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          CloseButton(
                              color: Colors.white,
                              onPressed: () {
                                context.read<MapControllerCubit>().hidePopup();
                              })
                        ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(padding: EdgeInsets.only(left: 20.0, right: 40)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Företag: '),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                for (var company in state.companyList)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      company.logoUrl == null
                                          ? const SizedBox(
                                              height: 25,
                                              width: 25,
                                            )
                                          : Image.network(
                                              company.logoUrl!,
                                              height: 25,
                                              width: 25,
                                            ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(company.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                              ],
                            )
                          ],
                        ),
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

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
          child: Container(
            color: mainColor,
            width: double.infinity,
            height: 50,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: []),
            ),
          ),
        ),
        const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
