import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/helpers/site_type_icon.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/map/cubit/map_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/cubit/filter_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/views/company_list.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/views/site_list.dart';

class LogisticsHubsWidget extends StatefulWidget {
  const LogisticsHubsWidget({
    super.key,
  });

  @override
  State<LogisticsHubsWidget> createState() => _LogisticsHubsWidgetState();
}

class _LogisticsHubsWidgetState extends State<LogisticsHubsWidget> {
  HubOrCompany view = HubOrCompany.hub;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 90,
      bottom: 0,
      width: 320, // Adjust the width as needed
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
                  Text(view == HubOrCompany.hub ? 'Platser' : 'Företag', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 16),
                  BlocBuilder<FilterSiteCubit, SiteTypesState>(
                    builder: (context, state) {
                      return ExpansionTile(
                        title: const Text('Filter'),
                        initiallyExpanded: false,
                        maintainState: true,
                        // onExpansionChanged: (expanded) {
                        //   if (!expanded) {
                        //     List<SiteType> selectedTypesList = selectedSiteTypes.toList();
                        //     context.read<SiteFirestoreCubit>().fetchSites(sortByType: true, siteTypes: selectedTypesList);
                        //   }
                        // },
                        children: [
                          Wrap(
                            spacing: 8,
                            children: SiteType.values.map((siteType) {
                              return FilterChip(
                                avatar: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: SiteTypeIcon(
                                    siteType: siteType,
                                  ),
                                ),
                                label: Text(siteType.name, style: Theme.of(context).textTheme.labelSmall),
                                selected: state.selectedSiteTypes.contains(siteType),
                                onSelected: (selected) {
                                  context.read<FilterSiteCubit>().toggleSiteType(siteType);
                                },
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 8),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  view == HubOrCompany.hub
                      ? const Expanded(child: SiteListMainWidget())
                      : const Expanded(child: CompanyListWidget(false, CompanyType.mainCompany)),
                  Center(
                    child: SegmentedButton(
                      segments: const [
                        ButtonSegment(value: HubOrCompany.hub, icon: Icon(Icons.api), label: Text('Platser')),
                        ButtonSegment(value: HubOrCompany.company, icon: Icon(Icons.business), label: Text('Företag')),
                      ],
                      selected: <HubOrCompany>{view},
                      onSelectionChanged: (Set newSelection) {
                        setState(() {
                          context.read<MapControllerCubit>().hidePopup();

                          // By default there is only a single segment that can be
                          // selected at one time, so its value is always the first
                          // item in the selected set.
                          view = newSelection.first;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum HubOrCompany { hub, company }
