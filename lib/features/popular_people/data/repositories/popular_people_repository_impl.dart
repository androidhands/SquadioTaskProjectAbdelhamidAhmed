import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/errors/exceptions.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/errors/failure.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/local_database/app_database.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/network_info/network_info.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/data/data_sources/popular_people_local_data_source.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/data/data_sources/popular_people_remote_data_source.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/entities/popular_people_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/repositories/popular_people_repository.dart';
class PopularPeopleRepositoryImpl implements PopularPeopleRepository{
  final PopularPeopleRemoteDataSource? popularPeopleRemoteDataSource;
  final PopularPeopleLocalDataSource? popularPeopleLocalDataSource;
  final NetworkInfo? networkInfo;
  PopularPeopleRepositoryImpl(
      {@required this.popularPeopleRemoteDataSource,@required this.popularPeopleLocalDataSource,@required this.networkInfo});

  @override
  Future<Either<Failure, List<PopularPeopleEntity>>> getPopularPeopleFromLocalOrRemoteDataSource(int page, String language)async {
    try{
      bool isConnected =await networkInfo!.isConnected;
      if(isConnected){
        var popularPeopleList = await popularPeopleRemoteDataSource!.getAllPopularPeopleFromRemoteDataSource(page, language);
        List<Insertable<PopularPeopleTableData>>  list = [];

        for(var l in popularPeopleList){
          var insertable = PopularPeopleTableData(id:l.id!
              ,name: l.name!,  popularity: l.popularity!, profilePath: l.profilePath!
              , gender: l.gender!, knownForDepartment: l.knownForDepartment!, adult: l.adult!, knownFor: l.knownFor!
          );
          list.add(insertable);
        }
        await popularPeopleLocalDataSource!.deleteAllPopularPeople();
        await popularPeopleLocalDataSource!.insetAllPopularPeople(list);
        return Right(popularPeopleList);
      }else{
        var popularPeopleList = await popularPeopleLocalDataSource!.getAllPopularPeople();
        return Right(popularPeopleList);
      }
    }on  ServerException catch (e){
      return Left(ServerFailure(e.message!));
    }on CacheException catch(e){
      return Left(CacheFailure(e.message!));
    }
  }

}