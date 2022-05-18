import 'package:drift/drift.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/errors/exceptions.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/local_database/app_database.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/data/models/popular_people_model.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/entities/popular_people_entity.dart';

abstract class PopularPeopleLocalDataSource{
  Future<List<PopularPeopleEntity>> getAllPopularPeople();
  Future insetAllPopularPeople(List<Insertable<PopularPeopleTableData>> popularPeopleList);
  Future deleteAllPopularPeople();
}

class PopularPeopleLocalDataSourceImpl implements PopularPeopleLocalDataSource{
  final AppDatabase appDatabase;

  PopularPeopleLocalDataSourceImpl(this.appDatabase);


  @override
  Future<List<PopularPeopleEntity>> getAllPopularPeople()async {
    var list =await appDatabase.getAllPopularPeople();
    if(list.isNotEmpty){
      return Future.value(list.map((popularPeople) => PopularPeopleModel.fromJson(popularPeople.toJson())).toList());
    }else{
      throw CacheException('No Data Saved, Please try to connect your device with network to reload popular people');
    }
  }

  @override
  Future insetAllPopularPeople(List<Insertable<PopularPeopleTableData>> popularPeopleList) async{
    return await appDatabase.insertAllPopularPeople(popularPeopleList);
  }

  @override
  Future deleteAllPopularPeople() async{
    return await appDatabase.deleteAllPopularPeople();
  }

}