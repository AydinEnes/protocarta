part of 'list_bloc.dart';

class ListState extends Equatable {
  final Type listObjectType;
  final ActionStatus status;
  final List<int> ids;

  const ListState({
    this.listObjectType = Note,
    this.status = ActionStatus.initial,
    this.ids = const [],
  });

  ListState copyWith({
    Type? listObjectType,
    ActionStatus? status,
    List<int>? ids,
  }) {
    return ListState(
      listObjectType: listObjectType ?? this.listObjectType,
      status: status ?? this.status,
      ids: ids ?? this.ids,
    );
  }

  @override
  List<Object?> get props => [
        listObjectType,
        status,
        ids,
      ];
}
