import 'package:squadio_task_project_abdelhamid_hamed/core/errors/failure.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/usecases/GetAllPopularPeopleUseCase.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/bloc/popular_people_bloc_events.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/bloc/popular_people_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


class PopularPeopleBloc extends Bloc<PopularPeopleBlocEvent,PopularPeopleBlocState>{

  final GetPopularPeopleUseCase? getPopularPeopleUseCase;


  PopularPeopleBloc({@required this.getPopularPeopleUseCase}) : super(PopularPeopleInitialState());

  @override
  Stream<PopularPeopleBlocState> mapEventToState(PopularPeopleBlocEvent event)async* {
    if(event is GetPopularPeopleEvent){
      yield PopularPeopleInitialState();
      final failureOrPeopleList = await getPopularPeopleUseCase!(PopularPeopleParams(
        page: event.page,language: event.language
      ));
      yield failureOrPeopleList.fold((message) =>
          OnGetPopularPeopleError(_mapFailureToMessage(message)),
              (list) => OnGetPopularPeopleListSuccess(list));
    }
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return (failure as ServerFailure).message;
    case CacheFailure:
      return (failure as CacheFailure).message;
    default:
      return 'Unexpected error';
  }
}