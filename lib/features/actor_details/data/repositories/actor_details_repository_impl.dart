import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/errors/exceptions.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/errors/failure.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/network_info/network_info.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/data/data_sources/actor_details_remote_data_source.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_details_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_images_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/repositories/actor_details_repository.dart';
class ActorDetailsRepositoryImpl implements ActorDetailsRepository{


   final ActorDetailsRemoteDataSource? actorDetailsRemoteDataSource;
  final NetworkInfo? platformNetworkInfo;

  ActorDetailsRepositoryImpl(
      {@required this.actorDetailsRemoteDataSource,@required this.platformNetworkInfo});

  @override
  Future<Either<Failure, ActorDetailsEntity>> getActorDetailsFromRemoteDataSource(String id,String language)async {
    try{
      bool isConnected = await platformNetworkInfo!.isConnected;
     if(isConnected){
       var actorDetails = await actorDetailsRemoteDataSource!.getActorDetails(id, language);
       return Right(actorDetails);
     }else{
       return const Left(ServerFailure('No Internet Connection'));
     }
    }on  ServerException catch (e){
      return Left(ServerFailure(e.message!));
    }on CacheException catch(e){
      return Left(CacheFailure(e.message!));
    }on CheckedFromJsonException catch(e){
      return Left(CacheFailure(e.message!));
    }
  }

  @override
  Future<Either<Failure, ActorImagesEntity>> getActorImagesFromRemoteDataSource(String id)async {
    try{
      bool isConnected = await platformNetworkInfo!.isConnected;
      if(isConnected){
        var actorImages = await actorDetailsRemoteDataSource!.getActorImages(id);
        return Right(actorImages);
      }else{
        return const Left(ServerFailure('No Internet Connection'));
      }
    }on  ServerException catch (e){
      return Left(ServerFailure(e.message!));
    }on CacheException catch(e){
      return Left(CacheFailure(e.message!));
    }on CheckedFromJsonException catch(e){
      return Left(CacheFailure(e.message!));
    }
  }

}