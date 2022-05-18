import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/entities/popular_people_entity.dart';
import 'package:meta/meta.dart';
class PopularPeopleModel extends PopularPeopleEntity {
  const PopularPeopleModel(
      {
        @required int? id,
        @required  String? name,
        @required int? gender,
        @required bool? adult,
        @required knownFor,
        @required String? knownForDepartment,
        @required double? popularity,
        @required String? profilePath})
      : super(id, name, gender, adult, knownFor, knownForDepartment, popularity,
            profilePath);

  factory PopularPeopleModel.fromJson(Map<String,dynamic> json){
        return PopularPeopleModel(
              id:json['id'],
              name:json['name'],
              gender:json['gender'],
              adult:json['adult'],
              knownFor: json['known_for'],
              knownForDepartment:json['known_for_department'],
              popularity:json['popularity'],
              profilePath:json['profile_path'],

        );
  }

  Map<String,dynamic> toJson(){
        var map = {
              'id':id,
              'name':name,
              'gender':gender,
              'adult':adult,
              'known_for':knownFor,
              'known_for_department':knownForDepartment,
              'popularity':popularity,
              'profile_path':profilePath,
        };
        return map;
  }
}
