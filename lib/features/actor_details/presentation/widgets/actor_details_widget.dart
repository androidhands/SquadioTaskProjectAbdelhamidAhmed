import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_details_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/widgets/actor_image_widget.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/widgets/actor_images_grid_widget.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/widgets/single_detail_item.dart';

class ActorDetailsWidget extends StatelessWidget{
  final ActorDetailsEntity? actorDetailsEntity;

  const ActorDetailsWidget({Key? key,required this.actorDetailsEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
     padding: const EdgeInsets.all(6),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         ActorImageWidget(actorDetailsEntity: actorDetailsEntity,),
         const SizedBox(height: 10,),
         ActorImagesWidget(actorDetailsEntity: actorDetailsEntity,),
         const SizedBox(height: 5,),
         Text('Personal Info',style: GoogleFonts.reemKufi(fontSize: 18,color: Colors.white),),
         const SizedBox(height: 10,),
         SingleDetailItem(detailKey: 'Known For',detailValue: actorDetailsEntity!.knownForDepartment,),
         const SizedBox(height: 5,),
         SingleDetailItem(detailKey: 'Gender',detailValue: actorDetailsEntity!.gender==1?"Male":"Female",),
         const SizedBox(height: 5,),
         SingleDetailItem(detailKey: 'Birthday',detailValue: actorDetailsEntity!.birthday,),
         const SizedBox(height: 5,),
         SingleDetailItem(detailKey: 'Place of Birth',detailValue: actorDetailsEntity!.placeOfBirth,),
         const SizedBox(height: 5,),
         SingleDetailItem(detailKey: 'Biography',detailValue: actorDetailsEntity!.biography,),




       ],
     ),
   );
  }

}