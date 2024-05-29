import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/constants/colors.dart';
import 'package:transportkartan/bloc/crud/company_firestore_cubit.dart';
import 'package:transportkartan/bloc/crud/workplace_firestore_cubit.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/models/state/company_firestore_state.dart';
import 'package:transportkartan/data/models/workplace_model.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/cubit/create_site_cubit.dart';

import 'package:transportkartan/views/logged_in_view/sub_views/map/cubit/map_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/views/widgets/company_list_item.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_company_dialog/create_company_dialog.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_company_dialog/cubit/create_company_cubit.dart';
import 'package:uuid/uuid.dart';

class CompanyListWidget extends StatefulWidget {
  const CompanyListWidget(this.isAddingCompanyToSite, this.companyType, {super.key});

  final bool isAddingCompanyToSite;
  final CompanyType companyType;
  @override
  State<CompanyListWidget> createState() => _CompanyListWidgetState();
}

class _CompanyListWidgetState extends State<CompanyListWidget> {
  int selectedIndex = -1; // Track the index of the selected ListTile
  int hoverIndex = -1; // Track the index of the selected ListTile

  @override
  void initState() {
    context.read<CompanyFirestoreCubit>().fetchAllComapnies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyFirestoreCubit, CompanyFirestoreState>(
      builder: (context, state) {
        if (state is CompanyInitialState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AllCompanies) {
          return SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.companyList.length,
              itemBuilder: (context, index) {
                var companyList = state.companyList;
                var company = companyList[index];
                bool selected = selectedIndex == index;
                bool hover = hoverIndex == index;

                return BlocBuilder<MapControllerCubit, MapState>(
                  builder: (context, state) {
                    return Flex(
                      direction: Axis.vertical,
                      children: [
                        MouseRegion(
                          onExit: (event) {
                            setState(() {
                              hoverIndex = -1;
                            });
                          },
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
                                if (!widget.isAddingCompanyToSite) {
                                  context.read<MapControllerCubit>().hidePopup();

                                  context.read<CreateCompanyCubit>().openCompany(company);
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const CreateCompanyDialog();
                                    },
                                  );
                                }

                                setState(() {
                                  selectedIndex = index; // Update the selectedIndex when a ListTile is tapped
                                });
                              },
                              onTap: () {
                                Workplace workplace = Workplace.empty();
                                if (widget.isAddingCompanyToSite) {
                                  context.read<WorkplaceFirestoreCubit>().createWorkplace(
                                        workplace.copyWith(
                                            companyId: company.id,
                                            siteId: context.read<CreateSiteCubit>().state.id!,
                                            id: const Uuid().v4(),
                                            companyType: widget.companyType),
                                      );

                                  // context.read<CreateSiteCubit>().addCompanyToSite(company);
                                  Navigator.pop(context);
                                }
                                setState(() {
                                  selectedIndex = index; // Update the selectedIndex when a ListTile is tapped
                                });
                              },
                              child: CompanyListItem(
                                company: company,
                                selected: selected,
                                hover: hover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
