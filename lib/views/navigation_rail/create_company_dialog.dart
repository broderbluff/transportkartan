import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/cubit/create_company_cubit.dart';
import 'package:transportkartan/cubit/firestore_cubit.dart';
import 'package:transportkartan/cubit/navigation_rail_cubit.dart';
import 'package:transportkartan/data/enums/union.dart';
import 'package:transportkartan/data/models/company_model.dart';

class CreateCompanyDialog extends StatelessWidget {
  const CreateCompanyDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var windowSize = MediaQuery.of(context).size;

    return BlocBuilder<CreateCompanyCubit, Company>(
      builder: (context, state) {
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
                  Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Företagsnamn',
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Org. nummer',
                          ),
                          onChanged: (value) => context.read<CreateCompanyCubit>().updateOrgNumber(value),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Antal anställda',
                          ),
                          onChanged: (value) => context.read<CreateCompanyCubit>().updateTotalEmployees(value),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Beskrivning',
                          ),
                          onChanged: (value) => context.read<CreateCompanyCubit>().updateCompanyDescription(value),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<UnionType>(
                          borderRadius: BorderRadius.circular(16),
                          value: state.union,
                          hint: const Text('Fackförening'),
                          onChanged: (UnionType? newValue) {
                            context.read<CreateCompanyCubit>().updateUnionType(newValue!);
                          },
                          items: UnionType.values.map((UnionType unionType) {
                            return DropdownMenuItem<UnionType>(
                              value: unionType,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(unionType.name),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Rensa')),
                      BlocConsumer<FireStoreCubit, FirestoreState>(
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
                          } else if (state is CreateFailure) {
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
                              context.read<FireStoreCubit>().createCompany(company);
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
      },
    );
  }
}
