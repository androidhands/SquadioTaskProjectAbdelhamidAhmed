import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squadio_task_project_abdelhamid_hamed/app_injection_container.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/utils/app_constants.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/data/models/known_for_model.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/known_for_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/bloc/actor_details_bloc.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/bloc/actor_details_bloc_events.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/bloc/actor_details_bloc_state.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/widgets/actor_details_widget.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/widgets/actor_error_widget.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/entities/popular_people_entity.dart';

class ActorDetailsPage extends StatelessWidget {
  final PopularPeopleEntity? popularPeopleEntity;

  const ActorDetailsPage({Key? key, required this.popularPeopleEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<KnownForEntity> knownFor = List<KnownForEntity>.from(
        popularPeopleEntity!.knownFor.map((model) =>
            KnownForModel.fromJson(model)));
    return BlocProvider(
      create: (context) => sl<ActorDetailsBloc>(),
      child: Builder(
        builder: (context) {
          BlocProvider.of<ActorDetailsBloc>(context).add(GetActorDetailsEvent(popularPeopleEntity!.id.toString(), AppConstants.language));
          return Scaffold(
            appBar: AppBar(
              title: Text(popularPeopleEntity!.name!, style: GoogleFonts.reemKufi(
                  color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            body: Container(
              padding: const EdgeInsets.all(5),
              color: Colors.deepPurple,
              child: BlocBuilder<ActorDetailsBloc,ActorDetailsBlocState>(
                builder: (context,state){
                  if(state is ActorDetailsInitialState){
                    return const Center(child: CircularProgressIndicator(color: Colors.white,),);
                  }else if(state is OnGetActorDetailsSuccess){
                    return ActorDetailsWidget(actorDetailsEntity: state.actorDetailsEntity,);
                  }else if(state is OnGetActorDetailsError){
                    return Center(child: ActorDetailsErrorWidget(message: state.message,),);
                  }else{
                    return  const Center(child: ActorDetailsErrorWidget(message: 'State Error'),);
                  }
                },
              ),
            ),
          );
        }
      ),
    );
  }

}