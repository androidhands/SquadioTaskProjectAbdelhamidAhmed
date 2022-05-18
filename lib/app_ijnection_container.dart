
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:squadio_task_project_abdelhamid_hamed/core/local_database/app_database.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/network_info/network_info.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/utils/app_constants.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/data/data_sources/popular_people_local_data_source.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/data/data_sources/popular_people_remote_data_source.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/data/repositories/popular_people_repository_impl.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/repositories/popular_people_repository.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/usecases/GetAllPopularPeopleUseCase.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/bloc/popular_people_bloc.dart';
final sl = GetIt.instance;


void init(){
  
  


  //bloc
  sl.registerFactory(() => PopularPeopleBloc(getPopularPeopleUseCase: sl()));
  //usecases
  sl.registerLazySingleton(() => GetPopularPeopleUseCase(sl()));

  //repositories

  sl.registerLazySingleton<PopularPeopleRepository>(() => PopularPeopleRepositoryImpl(popularPeopleRemoteDataSource: sl()
      , popularPeopleLocalDataSource: sl(), networkInfo: sl()));

  //data sources

  sl.registerLazySingleton<PopularPeopleRemoteDataSource>(() => PopularPeopleRemoteDataSourceImpl(sl(), AppConstants.baseUrl));
  sl.registerLazySingleton<PopularPeopleLocalDataSource>(() => PopularPeopleLocalDataSourceImpl(sl()));

  //database
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => AppDatabase());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  
}