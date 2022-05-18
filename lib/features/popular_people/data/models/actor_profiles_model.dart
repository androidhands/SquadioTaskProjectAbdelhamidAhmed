import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/entities/actor_profiles_entity.dart';
import 'package:meta/meta.dart';

class ActorProfilesModel extends ActorProfilesEntity {

  const ActorProfilesModel({@required double? aspectRatio,
    @required String? filePath,
    @required int? height,
    @required double? voteAverage,
    @required int? voteCount,
    @required int? width})
      : super(aspectRatio, filePath, height, voteAverage, voteCount, width);

  factory ActorProfilesModel.fromJson(Map<String, dynamic> json){
    return ActorProfilesModel(aspectRatio: json['aspect_ratio'],
        filePath: json['file_path'],
        height: json['height'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
        width: json['width']);
  }

  Map<String,dynamic> toJson(){
    var map = {
      'aspect_ratio':aspectRatio,
      'file_path':filePath,
      'height':height,
      'vote_average':voteAverage,
      'vote_count':voteCount,
      'width':width,

    };

    return map;
  }
}
