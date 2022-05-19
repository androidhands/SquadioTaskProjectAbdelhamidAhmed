import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadio_task_project_abdelhamid_hamed/app_injection_container.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/utils/app_constants.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/data/models/actor_profiles_model.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_details_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_profiles_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/bloc/actor_details_bloc.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/bloc/actor_details_bloc_events.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/bloc/actor_details_bloc_state.dart';

class ActorImagesWidget extends StatelessWidget{
  final ActorDetailsEntity? actorDetailsEntity;

  const ActorImagesWidget({Key? key,required this.actorDetailsEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => sl<ActorDetailsBloc>(),
  child: Builder(
      builder: (context) {
        BlocProvider.of<ActorDetailsBloc>(context).add(GetActorImagesEvent(actorDetailsEntity!.id!.toString()));

        return BlocBuilder<ActorDetailsBloc,ActorDetailsBlocState>(
            builder: (context,state){
              if(state is ActorImagesInitialState){
              return  const Center(child: CircularProgressIndicator(color: Colors.white,),);
              }else if(state is OnGetActorImagesSuccess){
                List<ActorProfilesEntity> actorProfiles =
                    List<ActorProfilesEntity>.from(state.actorImagesEntity.profiles!.map((model)=>
                    ActorProfilesModel.fromJson(model)));
                return GridView(
                  shrinkWrap: true,
                    primary: false,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,crossAxisSpacing: 3,mainAxisSpacing: 3),
                  children: actorProfiles.map((e) =>  GestureDetector(
                    onTap: (){

                    },
                    child: FadeInImage.assetNetwork(
                      imageErrorBuilder: (context,object,stackTrace){
                        return Image.asset('assets/squadio.jpg',width: e.width!.toDouble()
                            ,height: e.height!.toDouble(),fit: BoxFit.fill);
                      },
                      imageScale: 3,

                      placeholder: 'assets/squadio.jpg',
                      image: '${AppConstants.imageUrl}${e.filePath!}'
                      ,height: e.height!.toDouble(),fit: BoxFit.fill),
                  ),


                ).toList());
              }else if(state is OnGetActorImagesError){
                return  Center(child: Text( state.message,),);
              }else{
                return  const Center(child: Text( 'State Error'),);
              }
            }
            );
      }
    ),
);
  }

}