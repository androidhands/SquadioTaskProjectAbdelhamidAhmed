import 'package:equatable/equatable.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/entities/popular_people_entity.dart';

abstract class PopularPeopleBlocState extends Equatable {
  const PopularPeopleBlocState();
}


class PopularPeopleInitialState extends PopularPeopleBlocState{
  @override
  List<Object?> get props => [];
}


class OnGetPopularPeopleListSuccess extends PopularPeopleBlocState{
  final List<PopularPeopleEntity> list;

  const OnGetPopularPeopleListSuccess(this.list);
  @override
  List<Object?> get props => [list];
}


class OnGetPopularPeopleError extends PopularPeopleBlocState{
  final String message;

  const OnGetPopularPeopleError(this.message);
  @override
  List<Object?> get props => [message];
}
