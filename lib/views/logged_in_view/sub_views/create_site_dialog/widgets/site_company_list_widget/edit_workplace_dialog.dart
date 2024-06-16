import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/crud/workplace_firestore_cubit.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/data/models/workplace_model.dart';

class EditDialogWidget extends StatefulWidget {
  final BuildContext parentContext;
  final Company company;
  final Workplace workplace;

  const EditDialogWidget({
    Key? key,
    required this.parentContext,
    required this.company,
    required this.workplace,
  }) : super(key: key);

  @override
  _EditDialogWidgetState createState() => _EditDialogWidgetState();
}

class _EditDialogWidgetState extends State<EditDialogWidget> {
  late TextEditingController _employeesController;
  late TextEditingController _membersController;
  late TextEditingController _otherUnionController;
  late TextEditingController _electedOfficialsController;

  @override
  void initState() {
    super.initState();
    _employeesController = TextEditingController(text: '${widget.workplace.employees}');
    _membersController = TextEditingController(text: '${widget.workplace.members}');
    _electedOfficialsController = TextEditingController(text: '${widget.workplace.electedOfficials}');
    _otherUnionController = TextEditingController(text: '${widget.workplace.otherUnion}');
  }

  @override
  void dispose() {
    _employeesController.dispose();
    _membersController.dispose();
    _electedOfficialsController.dispose();
    _otherUnionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(32),
      title: Text('Ändra arbetsplatsuppgifter för ${widget.company.name}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Lokalt anställda',
            ),
            controller: _employeesController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Medlemmar',
            ),
            controller: _membersController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Annat förbund',
            ),
            controller: _otherUnionController,
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Förtroendevalda',
            ),
            controller: _electedOfficialsController,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Avbryt'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Spara'),
          onPressed: () async {
            // Assuming your Cubit and state management logic remains the same
            // You might need to adjust this part according to your actual state management
            var updatedWorkplace = widget.workplace.copyWith(
              employees: int.tryParse(_employeesController.text) ?? widget.workplace.employees,
              members: int.tryParse(_membersController.text) ?? widget.workplace.members,
              electedOfficials: int.tryParse(_electedOfficialsController.text) ?? widget.workplace.electedOfficials,
              otherUnion: int.tryParse(_otherUnionController.text) ?? widget.workplace.otherUnion,
            );

            BlocProvider.of<WorkplaceFirestoreCubit>(widget.parentContext).updateWorkplace(updatedWorkplace);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
