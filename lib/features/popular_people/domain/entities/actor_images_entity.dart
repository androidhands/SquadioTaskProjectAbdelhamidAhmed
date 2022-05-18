import 'package:equatable/equatable.dart';

class ActorImagesEntity extends Equatable{
  final int? id;
  final dynamic profiles;

  const ActorImagesEntity(this.id, this.profiles);

  @override
  // TODO: implement props
  List<Object?> get props =>[id!,profiles];

}