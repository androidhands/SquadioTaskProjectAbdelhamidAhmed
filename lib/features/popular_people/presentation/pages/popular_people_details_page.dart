import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/data/models/known_for_model.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/entities/popular_people_entity.dart';

class PopularPeopleDetailsPage extends StatelessWidget{
  final PopularPeopleEntity? popularPeopleEntity;

  const PopularPeopleDetailsPage({Key? key,required this.popularPeopleEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var knownFor = KnownForModel.fromJson(popularPeopleEntity!.knownFor);
    return Scaffold(
      appBar: AppBar(
        title: Text(popularPeopleEntity!.name!,style: GoogleFonts.reemKufi(color: Colors.white,fontWeight: FontWeight.bold)),
      ),
      body: Container(
        color: Colors.deepPurple,
      ),
    );
  }

}