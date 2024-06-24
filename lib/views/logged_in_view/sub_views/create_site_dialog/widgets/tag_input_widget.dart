import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:transportkartan/constants/values.dart';
import 'package:transportkartan/helpers/letter_to_color.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/cubit/create_site_cubit.dart';

class StringMultilineTags extends StatefulWidget {
  const StringMultilineTags({Key? key}) : super(key: key);

  @override
  State<StringMultilineTags> createState() => _StringMultilineTagsState();
}

class _StringMultilineTagsState extends State<StringMultilineTags> {
  late double _distanceToField;
  late StringTagController _stringTagController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _stringTagController = StringTagController();
    _initialTags = context.read<CreateSiteCubit>().state.site.goodsOfInterest!;
  }

  @override
  void dispose() {
    super.dispose();
    _stringTagController.dispose();
  }

  static List<String> _initialTags = <String>[];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          TextFieldTags<String>(
            textfieldTagsController: _stringTagController,
            initialTags: _initialTags,
            textSeparators: const [' ', ','],
            letterCase: LetterCase.normal,
            validator: (String tag) {
              if (_stringTagController.getTags!.contains(tag)) {
                return 'Den taggen finns redan';
              }
              return null;
            },
            inputFieldBuilder: (context, inputFieldValues) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  onTap: () {
                    _stringTagController.getFocusNode?.requestFocus();
                  },
                  controller: inputFieldValues.textEditingController,
                  focusNode: inputFieldValues.focusNode,
                  decoration: InputDecoration(
                    isDense: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 74, 137, 92),
                        width: 3.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 3.0,
                      ),
                    ),
                    helperStyle: const TextStyle(
                      color: Color.fromARGB(255, 74, 137, 92),
                    ),
                    hintText: inputFieldValues.tags.isNotEmpty ? '' : "Lägg till tagg",
                    errorText: inputFieldValues.error,
                    prefixIconConstraints: BoxConstraints(maxWidth: _distanceToField * 0.8),
                    prefixIcon: inputFieldValues.tags.isNotEmpty
                        ? SingleChildScrollView(
                            controller: inputFieldValues.tagScrollController,
                            scrollDirection: Axis.vertical,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                left: 8,
                              ),
                              child: Wrap(
                                  runSpacing: 4.0,
                                  spacing: 4.0,
                                  children: inputFieldValues.tags.map((String tag) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(cornerRadius),
                                        ),
                                        color: getColorBasedOnFirstCharacter(tag),
                                      ),
                                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            child: Text(
                                              '$tag',
                                            ),
                                            onTap: () {
                                              //print("$tag selected");
                                            },
                                          ),
                                          const SizedBox(width: 4.0),
                                          InkWell(
                                            child: const Icon(Icons.cancel, size: 14.0, color: Colors.black),
                                            onTap: () {
                                              inputFieldValues.onTagRemoved(tag);
                                            },
                                          )
                                        ],
                                      ),
                                    );
                                  }).toList()),
                            ),
                          )
                        : null,
                  ),
                  onChanged: inputFieldValues.onTagChanged,
                  onSubmitted: inputFieldValues.onTagSubmitted,
                ),
              );
            },
          ),
          // SizedBox(height: 16),
          // ElevatedButton(
          //   style: ButtonStyle(
          //     backgroundColor: WidgetStateProperty.all<Color>(
          //       const Color.fromARGB(255, 74, 137, 92),
          //     ),
          //   ),
          //   onPressed: () {
          //     _stringTagController.clearTags();
          //   },
          //   child: const Text(
          //     'Rensa taggar',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
        ],
      ),
    );
  }
}
