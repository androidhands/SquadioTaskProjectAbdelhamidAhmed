import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/utils/app_constants.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/entities/popular_people_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/routing/routing.gr.dart';

class SingleActorWidget extends StatelessWidget{
  final PopularPeopleEntity? popularPeopleEntity;

  const SingleActorWidget({Key? key,required this.popularPeopleEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(8),
      height: 400,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          color: Colors.white70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child:  GestureDetector(
              onTap: (){

              },
              child: FadeInImage.assetNetwork(
                imageErrorBuilder: (context,object,stackTrace){
                  return Image.asset('assets/squadio.jpg',scale: 3,fit: BoxFit.fill);
                },
                imageScale: 3,
                placeholder: 'assets/squadio.jpg', image: '${AppConstants.imageUrl}${popularPeopleEntity!.profilePath}'
                ,fit: BoxFit.fill,),
            ),
          ),
          /*,errorBuilder: ( context,  exception,  stackTrace){
             return Image.asset('assets/squadio.jpg',height: 300,);
           }*/
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(popularPeopleEntity!.name!,style: GoogleFonts.reemKufi(color: Colors.white,fontSize: 16
                  ,fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                  const SizedBox(height: 3,),
                  Text('Popularity ${popularPeopleEntity!.popularity!.toStringAsFixed(1)}'
                    ,style:GoogleFonts.reemKufi(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                ],
              )),
              Flexible(
                  child: ClipOval(
                    child: Material(
                      color: Colors.deepPurple,
                      child: IconButton(
                onPressed: (){
                  context.router.push(ActorDetailsRoute(popularPeopleEntity: popularPeopleEntity!));
                },
                icon: const Icon(Icons.navigate_next,color: Colors.white),
              ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}