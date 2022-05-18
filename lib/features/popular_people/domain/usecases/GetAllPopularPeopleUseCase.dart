import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/errors/failure.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/usecases/usecases.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/entities/popular_people_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/repositories/popular_people_repository.dart';
class PopularPeopleParams extends Equatable {
  final int? page;
  final String? language;

  const PopularPeopleParams({@required this.page,@required  this.language});

  @override
  List<Object?> get props => [page,language];
}


class GetPopularPeopleUseCase extends Usecases<List<PopularPeopleEntity>,PopularPeopleParams>{
  final PopularPeopleRepository? popularPeopleRepository;

  GetPopularPeopleUseCase(this.popularPeopleRepository);
  @override
  Future<Either<Failure, List<PopularPeopleEntity>>> call(PopularPeopleParams params){
    return popularPeopleRepository!.getPopularPeopleFromLocalOrRemoteDataSource(params.page!, params.language!);
  }

}