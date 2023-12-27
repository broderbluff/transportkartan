import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/cubit/company_firestore_cubit.dart';
import 'package:transportkartan/cubit/local_cubits/create_site_cubit.dart';

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

                return ListTile(
                  leading: SizedBox(
                    width: 40,
                    height: 40,
                    child: company.logoUrl!.isEmpty ? const Icon(Icons.business_sharp) : Image.network(company.logoUrl!),
                  ),
                  title: Text(company.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<CreateSiteCubit>().removeCompany(company.id);
                    },
                  ),
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
