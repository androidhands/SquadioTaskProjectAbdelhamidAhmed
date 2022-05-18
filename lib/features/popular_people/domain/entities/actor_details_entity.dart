import 'package:equatable/equatable.dart';

class ActorDetailsEntity extends Equatable {
  final bool? adult;
  final List<String>? alsoKnownAs;
  final String? biography;
  final String? birthday;
  final int? gender;
  final String? homepage;
  final int? id;
  final int? imdbId;
  final String? knownForDepartment;
  final String? name;
  final String? placeOfBirth;
  final String? popularity;
  final String? profilePath;

  const ActorDetailsEntity(
      this.adult,
      this.alsoKnownAs,
      this.biography,
      this.birthday,
      this.gender,
      this.homepage,
      this.id,
      this.imdbId,
      this.knownForDepartment,
      this.name,
      this.placeOfBirth,
      this.popularity,
      this.profilePath);

  @override
  List<Object?> get props => [adult!,
    alsoKnownAs!,
    biography!,
    birthday!,
    gender!,
    homepage!,
    id!,
    imdbId!,
    knownForDepartment!,
    name!,
    placeOfBirth!,
    popularity!,
    profilePath!];
}
