import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_data.g.dart';

@JsonSerializable()
class AuthData extends Equatable {
  const AuthData({
    required this.message,
    required this.accessToken,
    required this.tokenType,
    required this.statusCode,
  });

  final String? message;

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'token_type')
  final String? tokenType;

  @JsonKey(name: 'status_code')
  final int? statusCode;

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);

  @override
  List<Object?> get props => [message, accessToken, tokenType, statusCode];
}
