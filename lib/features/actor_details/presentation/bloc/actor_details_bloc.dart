import 'package:squadio_task_project_abdelhamid_hamed/core/errors/failure.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/usecases/get_actor_details_use_case.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/bloc/actor_details_bloc_events.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/bloc/actor_details_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


class ActorDetailsBloc extends Bloc<ActorDetailsBlocEvent,ActorDetailsBlocState>{

  final GetActorDetailUseCase? getActorDetailUseCase;
  final GetActorImagesUseCase? getActorImagesUseCase;


  ActorDetailsBloc({@required this.getActorDetailUseCase,@required this.getActorImagesUseCase}) : super(ActorDetailsInitialState());

  @override
  Stream<ActorDetailsBlocState> mapEventToState(ActorDetailsBlocEvent event)async* {
    if(event is GetActorDetailsEvent){
      yield ActorDetailsInitialState();
      final failureOrPeopleList = await getActorDetailUseCase!(ActorDetailsParams(
        id: event.id,language: event.language
      ));
      yield failureOrPeopleList.fold((message) =>
          OnGetActorDetailsError(_mapFailureToMessage(message)),
              (actorDetails) => OnGetActorDetailsSuccess(actorDetails));
    }else if(event is GetActorImagesEvent){
      yield ActorImagesInitialState();
      final failureOrPeopleList = await getActorImagesUseCase!(ActorImagesParams(id: event.id));
      yield failureOrPeopleList.fold((message) =>
          OnGetActorImagesError(_mapFailureToMessage(message)),
              (actorImages) => OnGetActorImagesSuccess(actorImages));
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