import 'package:equatable/equatable.dart';

class ActorDetailsEntity extends Equatable {
  final bool? adult;
  final List<dynamic>? alsoKnownAs;
  final String? biography;
  final String? birthday;
  final int? gender;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? knownForDepartment;
  final String? name;
  final String? placeOfBirth;
  final double? popularity;
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
