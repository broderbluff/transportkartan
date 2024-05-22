import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required int userLevel,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}


//USERLEVEL 0 = ADMIN TRANSPORT
//USERLEVEL 1 = ADMIN ITF
//USERLEVEL 2 = GUEST TRANSPORT 
//USERLEVEL 3 = GUEST ITF
