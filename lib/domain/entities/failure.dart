import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

enum FailureType { api, network, unauthorised, database, response, unknown }

@freezed
class Failure with _$Failure {
  const factory Failure(FailureType failureType) = _Failure;
}
