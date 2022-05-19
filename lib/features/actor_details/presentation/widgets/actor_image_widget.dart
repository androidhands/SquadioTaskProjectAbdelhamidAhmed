import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/utils/app_constants.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_details_entity.dart';

class ActorImageWidget extends StatelessWidget{
  final ActorDetailsEntity? actorDetailsEntity;

  const ActorImageWidget({Key? key,required this.actorDetailsEntity}) : super(key: key);

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
            child:  FadeInImage.assetNetwork(
              imageErrorBuilder: (context,object,stackTrace){
                return Image.asset('assets/squadio.jpg',scale: 3,fit: BoxFit.fill);
              },
              imageScale: 3,
              placeholder: 'assets/squadio.jpg', image: '${AppConstants.imageUrl}${actorDetailsEntity!.profilePath}'
              ,fit: BoxFit.fill,),
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
                      Text(actorDetailsEntity!.name!,style: GoogleFonts.reemKufi(color: Colors.white,fontSize: 16
                          ,fontWeight: FontWeight.bold),textAlign: TextAlign.start),
                      const SizedBox(height: 3,),
                      Text('Popularity ${actorDetailsEntity!.popularity!.toStringAsFixed(1)}'
                        ,style:GoogleFonts.reemKufi(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                    ],
                  )),

            ],
          )
        ],
      ),
    );
  }
}