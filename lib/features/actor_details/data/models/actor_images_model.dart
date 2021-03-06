import 'package:meta/meta.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_images_entity.dart';
class ActorImagesModel extends ActorImagesEntity{
  const ActorImagesModel({@required int? id,@required profiles}) : super(id, profiles);

  factory ActorImagesModel.fromJson(Map<String,dynamic> json){
    return ActorImagesModel(id:json ['id'], profiles:json ['profiles']);
  }

  Map<String,dynamic> toJson(){
    var map = {
      'id':id,
      'profiles':profiles
    };

    return map;
  }
}