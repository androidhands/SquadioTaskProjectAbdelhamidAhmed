import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/entities/actor_details_entity.dart';
import 'package:meta/meta.dart';

class ActorDetailsModel extends ActorDetailsEntity {
  const ActorDetailsModel({@required bool? adult,
    @required List<String>? alsoKnownAs,
    @required String? biography,
    @required String? birthday,
    @required int? gender,
    @required String? homepage,
    @required int? id,
    @required int? imdbId,
    @required String? knownForDepartment,
    @required String? name,
    @required String? placeOfBirth,
    @required String? popularity,
    @required String? profilePath})
      : super(
      adult,
      alsoKnownAs,
      biography,
      birthday,
      gender,
      homepage,
      id,
      imdbId,
      knownForDepartment,
      name,
      placeOfBirth,
      popularity,
      profilePath);

  factory ActorDetailsModel.fromJson(Map<String, dynamic> json) {
    return ActorDetailsModel(adult: json['adult'],
        alsoKnownAs: json['also_known_as'],
        biography: json['biography'],
        birthday:json ['birthday'],
        gender: json['gender'],
        homepage: json['homepage'],
        id: json['id'],
        imdbId: json['imdb_id'],
        knownForDepartment: json['known_for_department'],
        name: json['name'],
        placeOfBirth: json['place_of_birth'],
        popularity:json ['popularity'],
        profilePath: json['profile_path']);
  }


  Map<String,dynamic> toJson(){
    var map = {
      'adult':adult,
      'also_known_as':alsoKnownAs,
      'biography':biography,
      'birthday':birthday,
      'gender':gender,
      'homepage':homepage,
      'id':id,
      'imdb_id':imdbId,
      'known_for_department':knownForDepartment,
      'name':name,
      'place_of_birth':placeOfBirth,
      'popularity':popularity,
      'profile_path':profilePath,
    };
    return map;
  }
}
