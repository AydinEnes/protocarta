part of 'list_bloc.dart';

enum ActionStatus {
  initial,
  submitting,
  success,
  failure,
}

class ListState extends Equatable {
  final Type listObjectType;
  final ActionStatus status;
  final List itemList;

  const ListState({
    this.listObjectType = Note,
    this.status = ActionStatus.initial,
    this.itemList = const [],
  });

  ListState copyWith({
    Type? listObjectType,
    ActionStatus? status,
    List? itemList,
  }) {
    return ListState(
      listObjectType: listObjectType ?? this.listObjectType,
      status: status ?? this.status,
      itemList: itemList ?? this.itemList,
    );
  }

  @override
  List<Object?> get props => [
    listObjectType,
    status,
    itemList,
  ];
}


