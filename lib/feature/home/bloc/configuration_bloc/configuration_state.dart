part of 'configuration_bloc.dart';

@freezed
class ConfigurationState with _$ConfigurationState {
  const factory ConfigurationState.initial(bool isLoading) = _Initial;
  const factory ConfigurationState.error({
    required String message,
    required bool isLoading,
  }) = _Error;
  const factory ConfigurationState.success({
    required Configuration configuration,
    required bool isLoading,
  }) = _Success;
}
