import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:squadio_task_project_abdelhamid_hamed/core/local_database/data_tables/popular_people_table.dart';

part 'app_database.g.dart';
LazyDatabase _connectDatabase(){
  return LazyDatabase(()async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path,'popular_people.sqlite'));
    return NativeDatabase(file);
  }
  );

}
@DriftDatabase(tables: [PopularPeopleTable])
class AppDatabase extends _$AppDatabase{
  AppDatabase():super(_connectDatabase());

  @override
  int get schemaVersion => 1;

  Future<List<PopularPeopleTableData>> getAllPopularPeople()async{
    return await select(popularPeopleTable).get();
  }

  Future insertAllPopularPeople(List<Insertable<PopularPeopleTableData>> list)async{
     await batch((batch)=>batch.insertAll(popularPeopleTable,list));
  }

  Future deleteAllPopularPeople()async{
    await delete(popularPeopleTable).go();
  }
}
