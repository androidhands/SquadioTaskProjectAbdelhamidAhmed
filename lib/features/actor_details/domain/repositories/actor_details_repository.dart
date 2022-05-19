import 'package:dartz/dartz.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/errors/failure.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_details_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_images_entity.dart';

abstract class ActorDetailsRepository{
   Future<Either<Failure,ActorDetailsEntity>> getActorDetailsFromRemoteDataSource(String id,String language);
   Future<Either<Failure,ActorImagesEntity>> getActorImagesFromRemoteDataSource(String id);
}