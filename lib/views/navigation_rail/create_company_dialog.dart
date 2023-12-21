import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/cubit/navigation_rail_cubit.dart';

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
              const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Företagsnamn',
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Org. nummer',
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Antal anställda',
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Org. nummer',
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Antal anställda',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Dropdown',
                      ),
                      borderRadius: BorderRadius.circular(16),
                      items: const [
                        DropdownMenuItem(
                          value: 'Option 1',
                          child: Text('Option 1'),
                        ),
                        DropdownMenuItem(
                          value: 'Option 2',
                          child: Text('Option 2'),
                        ),
                        DropdownMenuItem(
                          value: 'Option 3',
                          child: Text('Option 3'),
                        ),
                      ],
                      onChanged: (value) {
                        // Handle dropdown value change
                      },
                    ),
                  )
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () {}, child: const Text('Rensa')),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Skapa',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
