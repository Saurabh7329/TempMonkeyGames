part of 'configuration_bloc.dart';

@freezed
class ConfigurationEvent with _$ConfigurationEvent {
  const factory ConfigurationEvent.getConfiguration({Configuration? league}) = _GetConfiguration;
}
