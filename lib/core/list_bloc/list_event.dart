part of 'list_bloc.dart';

abstract class ListEvent extends Equatable{
  const ListEvent();
}

class FetchListEvent extends ListEvent{
  const FetchListEvent();

  @override
  List<Object?> get props => [];
}

class ListSubscriptionRequested extends ListEvent {
  const ListSubscriptionRequested();

  @override
  List<Object?> get props => [];
}