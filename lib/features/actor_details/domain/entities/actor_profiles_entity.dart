import 'package:equatable/equatable.dart';

class ActorProfilesEntity extends Equatable {
  final double? aspectRatio;
  final String? filePath;
  final int? height;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  const ActorProfilesEntity(this.aspectRatio, this.filePath, this.height,
      this.voteAverage, this.voteCount, this.width);

  @override
  List<Object?> get props => [aspectRatio!, filePath!, height!,
    voteAverage!, voteCount!, width!];
}
