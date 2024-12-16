part of 'edit_wager_bloc.dart';

@freezed
class EditWagerEvent with _$EditWagerEvent {
  const factory EditWagerEvent.edit({
    required int wagerID,
    required int amount,
  }) = _Edit;
  const factory EditWagerEvent.onChange(String value) = _OnChange;
  const factory EditWagerEvent.start() = _Start;
}
