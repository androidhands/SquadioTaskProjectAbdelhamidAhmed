import 'package:dartz/dartz.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/errors/failure.dart';

abstract class Usecases<Type,Params>{
  Future<Either<Failure,Type>> call(Params params);
}