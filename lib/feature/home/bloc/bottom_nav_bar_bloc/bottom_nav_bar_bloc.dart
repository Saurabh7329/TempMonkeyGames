import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'bottom_nav_bar_bloc.freezed.dart';

@injectable
class BottomNavBarBloc extends Bloc<BottomNavBarEvent, int> {
  BottomNavBarBloc() : super(0) {
    on<BottomNavBarEvent>((event, emit) {
      log('message');
      emit(event.index);
    });
  }
}

@freezed
class BottomNavBarEvent with _$BottomNavBarEvent {
  const factory BottomNavBarEvent.onTap(int index) = _OnTap;
}
