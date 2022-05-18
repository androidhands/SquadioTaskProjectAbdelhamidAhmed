import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/bloc/popular_people_bloc.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/bloc/popular_people_bloc_events.dart';

class DisplayErrorWidget extends StatelessWidget{
  final String? message;


  const DisplayErrorWidget({Key? key,required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(message!,style: GoogleFonts.reemKufi(fontSize: 16),),
          MaterialButton(onPressed: (){
            BlocProvider.of<PopularPeopleBloc>(context).add(const GetPopularPeopleEvent(1, "en-US"));
          },
          child:  Text('Try Again',style: GoogleFonts.reemKufi(fontSize: 12),),
          color: Colors.orange,)
        ],
      ),
    );
  }

}