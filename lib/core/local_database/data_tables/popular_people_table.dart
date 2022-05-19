import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/data/models/known_for_model.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/known_for_entity.dart';

class PopularPeopleTable extends Table{
  IntColumn get id=> integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  IntColumn get gender => integer().nullable()();
  BoolColumn get adult => boolean().nullable()();
  TextColumn get knownFor => text().map(const CustomConverter()).nullable()();
  TextColumn get knownForDepartment => text().nullable()();
  RealColumn get popularity => real().nullable()();
  TextColumn get profilePath => text().nullable()();
}

class CustomConverter extends TypeConverter<dynamic, String> {
  const CustomConverter();

  @override
  dynamic mapToDart(String? fromDb) {
    var m = jsonDecode(fromDb!);
    dynamic posts = List<KnownForEntity>.from(m.map((model)=> KnownForModel.fromJson(model)));
    return posts;
  }

  @override
  String? mapToSql(dynamic value) {
    return jsonEncode(value);
  }



}