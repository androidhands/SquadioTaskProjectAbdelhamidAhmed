import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/errors/exceptions.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/errors/failure.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/local_database/app_database.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/network_info/network_info.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/data/data_sources/popular_people_local_data_source.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/data/data_sources/popular_people_remote_data_source.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/entities/popular_people_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/repositories/popular_people_repository.dart';
class PopularPeopleRepositoryImpl implements PopularPeopleRepository{
  final PopularPeopleLocalDataSource? peopleLocalDataSource;
  final PopularPeopleRemoteDataSource? popularPeopleRemoteDataSource;
  final NetworkInfo? platformNetworkInfo;

  PopularPeopleRepositoryImpl(
      {@required this.peopleLocalDataSource,@required this.popularPeopleRemoteDataSource,@required this.platformNetworkInfo});

  @override
  Future<Either<Failure, List<PopularPeopleEntity>>> getPopularPeopleFromLocalOrRemoteDataSource(int page, String language) async{
    try{
      bool isConnected = await platformNetworkInfo!.isConnected;
      if(isConnected){
        var popularPeopleList = await popularPeopleRemoteDataSource!.getAllPopularPeopleFromRemoteDataSource(page, language);
        List<Insertable<PopularPeopleTableData>>  list = [];

        for(var l in popularPeopleList){
          var insertable = PopularPeopleTableData(id:l.id!
              ,name: l.name,  popularity: l.popularity, profilePath: l.profilePath
              , gender: l.gender, knownForDepartment: l.knownForDepartment, adult: l.adult, knownFor: l.knownFor
          );
          list.add(insertable);
        }
        await peopleLocalDataSource!.deleteAllPopularPeople();
        await peopleLocalDataSource!.insetAllPopularPeople(list);
        return Right(popularPeopleList);
      }else{
        var popularPeopleList = await peopleLocalDataSource!.getAllPopularPeople();
        return Right(popularPeopleList);
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