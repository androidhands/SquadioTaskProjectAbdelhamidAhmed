import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class ActorDetailsBlocEvent extends Equatable {
  const ActorDetailsBlocEvent([List props = const[]]):super();
}

class GetActorDetailsEvent extends ActorDetailsBlocEvent{
  final String? id;
  final String? language;
  const GetActorDetailsEvent(this.id, this.language);
  @override
  List<Object?> get props =>[id,language];

}


class GetActorImagesEvent extends ActorDetailsBlocEvent{
  final String? id;
  const GetActorImagesEvent(this.id);
  @override
  List<Object?> get props =>[id];

}