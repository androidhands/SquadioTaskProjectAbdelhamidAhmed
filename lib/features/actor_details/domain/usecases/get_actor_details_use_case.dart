import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/errors/failure.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/usecases/usecases.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_details_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_images_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/repositories/actor_details_repository.dart';
class ActorDetailsParams extends Equatable {
  final String? id;
  final String? language;

  const ActorDetailsParams({@required this.id,@required  this.language});

  @override
  List<Object?> get props => [id,language];
}


class GetActorDetailUseCase extends Usecases<ActorDetailsEntity,ActorDetailsParams>{
  final ActorDetailsRepository? actorDetailsRepository;

  GetActorDetailUseCase(this.actorDetailsRepository);
  @override
  Future<Either<Failure, ActorDetailsEntity>> call(ActorDetailsParams params){
    return actorDetailsRepository!.getActorDetailsFromRemoteDataSource(params.id!, params.language!);
  }

}


class ActorImagesParams extends Equatable {
  final String? id;

  const ActorImagesParams({@required this.id});

  @override
  List<Object?> get props => [id];
}

class GetActorImagesUseCase extends Usecases<ActorImagesEntity,ActorImagesParams>{
  final ActorDetailsRepository? actorDetailsRepository;

  GetActorImagesUseCase(this.actorDetailsRepository);
  @override
  Future<Either<Failure, ActorImagesEntity>> call(ActorImagesParams params){
    return actorDetailsRepository!.getActorImagesFromRemoteDataSource(params.id!);
  }

}