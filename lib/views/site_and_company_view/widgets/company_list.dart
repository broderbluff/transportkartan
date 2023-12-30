import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/constants/colors.dart';
import 'package:transportkartan/cubit/company_firestore_cubit.dart';

import 'package:transportkartan/views/map/cubit/map_cubit.dart';
import 'package:transportkartan/views/site_and_company_view/widgets/company_list_item.dart';
import 'package:transportkartan/views/navigation_rail/views/create_company_dialog/create_company_dialog.dart';
import 'package:transportkartan/views/navigation_rail/views/create_company_dialog/cubit/create_company_cubit.dart';
import 'package:transportkartan/views/navigation_rail/views/create_site_dialog/cubit/create_site_cubit.dart';

class CompanyListWidget extends StatefulWidget {
  const CompanyListWidget(this.isAddingCompanyToSite, {super.key});

  final bool isAddingCompanyToSite;
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
        if (state is InitialState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CompanyListState) {
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
                                if (widget.isAddingCompanyToSite) {
                                  context.read<CreateSiteCubit>().addCompany(company.id);
                                  Navigator.pop(context);
                                }
                                setState(() {
                                  selectedIndex = index; // Update the selectedIndex when a ListTile is tapped
                                });
                              },
                              child: CompanyListItem(company: company, selected: selected, hover: hover),
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
        return const Text('ERRROR');
      },
    );
  }
}
