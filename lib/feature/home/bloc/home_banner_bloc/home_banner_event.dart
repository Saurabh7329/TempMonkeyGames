import 'package:equatable/equatable.dart';

abstract class HomeBannerEvent extends Equatable {
  const HomeBannerEvent();

  @override
  List<Object> get props => [];
}

class FetchDataEvent extends HomeBannerEvent {
  final String query;

  const FetchDataEvent(this.query);

  @override
  List<Object> get props => [query];

  @override
  String toString() => 'FetchDataEvent { query: $query }';
}
