import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/cubit/company_firestore_cubit.dart';
import 'package:transportkartan/views/navigation_rail/views/create_site_dialog/cubit/create_site_cubit.dart';

class SiteCompaniesListWidget extends StatelessWidget {
  const SiteCompaniesListWidget(
    this.siteMarkerState, {
    super.key,
  });
  final List<String> siteMarkerState;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyFirestoreCubit, CompanyFirestoreState>(
      bloc: context.read<CompanyFirestoreCubit>()..fetchCompaniesFromId(siteMarkerState),
      builder: (context, companyData) {
        if (companyData is Failure) {
          return const Center(child: Text('Failed to load companies'));
        }
        if (companyData is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (companyData is CompanyListFetchedByIdState) {
          return SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: companyData.companyList.length,
              itemBuilder: (context, index) {
                final company = companyData.companyList[index];

                return Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: company.logoUrl!.isEmpty ? const Icon(Icons.business_sharp) : Image.network(company.logoUrl!),
                    ),
                    Text(company.name),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Anställda',
                        constraints: BoxConstraints(maxWidth: 100, minWidth: 100),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Medlemmar',
                        constraints: BoxConstraints(maxWidth: 100, minWidth: 100),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Förtroendevalda',
                        constraints: BoxConstraints(maxWidth: 100, minWidth: 100),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<CreateSiteCubit>().removeCompany(company.id);
                      },
                    ),
                  ],
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
