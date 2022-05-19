import 'package:equatable/equatable.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_details_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_images_entity.dart';

abstract class ActorDetailsBlocState extends Equatable {
  const ActorDetailsBlocState();
}


class ActorDetailsInitialState extends ActorDetailsBlocState{
  @override
  List<Object?> get props => [];
}

class ActorImagesInitialState extends ActorDetailsBlocState{
  @override
  List<Object?> get props => [];
}


class OnGetActorDetailsSuccess extends ActorDetailsBlocState{
  final ActorDetailsEntity actorDetailsEntity;

  const OnGetActorDetailsSuccess(this.actorDetailsEntity);
  @override
  List<Object?> get props => [actorDetailsEntity];
}

class OnGetActorImagesSuccess extends ActorDetailsBlocState{
  final ActorImagesEntity actorImagesEntity;

  const OnGetActorImagesSuccess(this.actorImagesEntity);
  @override
  List<Object?> get props => [actorImagesEntity];
}


class OnGetActorDetailsError extends ActorDetailsBlocState{
  final String message;

  const OnGetActorDetailsError(this.message);
  @override
  List<Object?> get props => [message];
}


class OnGetActorImagesError extends ActorDetailsBlocState{
  final String message;

  const OnGetActorImagesError(this.message);
  @override
  List<Object?> get props => [message];
}