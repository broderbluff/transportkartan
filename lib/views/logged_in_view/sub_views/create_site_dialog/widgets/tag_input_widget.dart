import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
    _stringTagController.dispose();
  }

  static const List<String> _initialTags = <String>[];

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
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 74, 137, 92),
                        width: 3.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 74, 137, 92),
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
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                        color: Color.fromARGB(255, 74, 137, 92),
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
                                              style: const TextStyle(color: Colors.white),
                                            ),
                                            onTap: () {
                                              //print("$tag selected");
                                            },
                                          ),
                                          const SizedBox(width: 4.0),
                                          InkWell(
                                            child: const Icon(
                                              Icons.cancel,
                                              size: 14.0,
                                              color: Color.fromARGB(255, 233, 233, 233),
                                            ),
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
          SizedBox(height: 16),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 74, 137, 92),
              ),
            ),
            onPressed: () {
              _stringTagController.clearTags();
            },
            child: const Text(
              'Rensa taggar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
