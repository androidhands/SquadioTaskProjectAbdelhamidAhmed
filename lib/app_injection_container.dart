import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/local_database/app_database.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/network_info/network_info.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/utils/app_constants.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/data/data_sources/actor_details_remote_data_source.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/data/repositories/actor_details_repository_impl.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/repositories/actor_details_repository.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/usecases/get_actor_details_use_case.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/bloc/actor_details_bloc.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/data/data_sources/popular_people_local_data_source.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/data/data_sources/popular_people_remote_data_source.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/data/repositories/popular_people_repository_impl.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/repositories/popular_people_repository.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/usecases/get_all_popular_people_use_case.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/bloc/popular_people_bloc.dart';

final sl = GetIt.instance;

void init() {
  //bloc
  sl.registerFactory(() => PopularPeopleBloc(getPopularPeopleUseCase: sl()));
  sl.registerFactory(() => ActorDetailsBloc(
      getActorDetailUseCase: sl(), getActorImagesUseCase: sl()));

  //usecases
  sl.registerLazySingleton(() => GetPopularPeopleUseCase(sl()));
  sl.registerLazySingleton(() => GetActorDetailUseCase(sl()));
  sl.registerLazySingleton(() => GetActorImagesUseCase(sl()));
  //repositories

  sl.registerLazySingleton<PopularPeopleRepository>(() =>
      PopularPeopleRepositoryImpl(
          popularPeopleRemoteDataSource: sl(),
          peopleLocalDataSource: sl(),
          platformNetworkInfo: sl()));
  sl.registerLazySingleton<ActorDetailsRepository>(() =>
      ActorDetailsRepositoryImpl(
          actorDetailsRemoteDataSource: sl(), platformNetworkInfo: sl()));

  //data sources

  sl.registerLazySingleton<PopularPeopleRemoteDataSource>(
      () => PopularPeopleRemoteDataSourceImpl(sl(), AppConstants.baseUrl));
  sl.registerLazySingleton<ActorDetailsRemoteDataSource>(
      () => ActorDetailsRemoteDataSourceImpl(sl(), AppConstants.baseUrl));
  sl.registerLazySingleton<PopularPeopleLocalDataSource>(
      () => PopularPeopleLocalDataSourceImpl(sl()));

  //database
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => AppDatabase());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}
