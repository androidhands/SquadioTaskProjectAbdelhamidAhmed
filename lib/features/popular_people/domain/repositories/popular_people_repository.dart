import 'package:dartz/dartz.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/errors/failure.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/entities/popular_people_entity.dart';

abstract class PopularPeopleRepository{
  Future<Either<Failure,List<PopularPeopleEntity>>> getPopularPeopleFromLocalOrRemoteDataSource(int page,String language);
}