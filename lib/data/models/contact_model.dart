import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';

@freezed
abstract class ContactModel with _$ContactModel {
  const factory ContactModel({
    String? name,
    String? email,
    String? phone,
    String? title,
    List<String>? workplaces,
  }) = _ContactModel;
}
