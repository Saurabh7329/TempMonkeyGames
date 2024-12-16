part of 'edit_wager_bloc.dart';

@freezed
class EditWagerState with _$EditWagerState {
  const factory EditWagerState.initial({required String value}) = _Initial;
  const factory EditWagerState.loading() = _Loading;
  const factory EditWagerState.success() = _Success;
  const factory EditWagerState.error({required String message}) = _Error;
}
