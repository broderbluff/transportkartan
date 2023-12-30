import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/cubit/company_firestore_cubit.dart';
import 'package:transportkartan/views/navigation_rail/views/create_company_dialog/cubit/create_company_cubit.dart';

import 'package:transportkartan/views/navigation_rail/views/create_company_dialog/widgets/company_input_widget.dart';
import 'package:transportkartan/views/navigation_rail/cubit/navigation_rail_cubit.dart';

class CreateCompanyDialog extends StatelessWidget {
  const CreateCompanyDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var windowSize = MediaQuery.of(context).size;

    return Dialog(
      elevation: 24,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          height: windowSize.height * 0.6,
          width: windowSize.width * 0.6,
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Nytt företag',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  CloseButton(
                    onPressed: () {
                      context.read<NavigationRailCubit>().changeIndex(0);
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
              const SizedBox(height: 32),
              const CompanyInputWidget(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Rensa')),
                  BlocConsumer<CompanyFirestoreCubit, CompanyFirestoreState>(
                    listener: (context, state) {
                      if (state is CreateSuccess) {
                        context.read<CreateCompanyCubit>().resetState();

                        context.read<NavigationRailCubit>().changeIndex(0);
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                              'Plats skapad!',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      } else if (state is Failure) {
                        // Handle CreateFailure state
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              'Error: ${state.error}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      // Build your UI based on the current state
                      return ElevatedButton(
                        onPressed: () {
                          var company = context.read<CreateCompanyCubit>().state;
                          context.read<CompanyFirestoreCubit>().createCompany(company);
                          context.read<CreateCompanyCubit>().resetState();
                        },
                        child: const Text('Skapa'),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
