import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class LoginResponse {
  @JsonKey(defaultValue: null)
  late bool? result;

  @JsonKey(defaultValue: null)
  late String? message;

  @JsonKey(defaultValue: null)
  late String? access_token;

  @JsonKey(defaultValue: null)
  late String? token_type;

  @JsonKey(defaultValue: null)
  late DateTime? expires_at;

  LoginResponse();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
