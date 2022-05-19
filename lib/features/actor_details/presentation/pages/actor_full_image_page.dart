
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:squadio_task_project_abdelhamid_hamed/app_injection_container.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/utils/app_constants.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_details_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_profiles_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/bloc/actor_details_bloc.dart';
class ActorFullImagePage extends StatefulWidget{
  final ActorProfilesEntity? actorProfilesEntity;
  final ActorDetailsEntity? actorDetailsEntity;
  const ActorFullImagePage({Key? key,required this.actorProfilesEntity,required this.actorDetailsEntity}) : super(key: key);

  @override
  State<ActorFullImagePage> createState() => _ActorFullImagePageState();
}

class _ActorFullImagePageState extends State<ActorFullImagePage> {

  bool switchValue = false;
  bool isVisible = false;

  void _saveNetworkImage(String filePath) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage
      //add more permission to request here.
    ].request();


    if (statuses[Permission.storage]!.isGranted) {
      setState(() {
        isVisible = true;
      });
      await GallerySaver.saveImage(filePath, toDcim: true).then(( success) {
        Fluttertoast.showToast(msg: 'Image downloaded successfully',toastLength: Toast.LENGTH_LONG
        );
        setState(() {
        isVisible = false;
        });
      });

    } else {
      isVisible = false;

    }

  }

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
  create: (context) => sl<ActorDetailsBloc>(),
  child: Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        color: Colors.deepPurple,
        child:  Stack(children: <Widget>[
           Container(
            alignment: Alignment.center,
            color: Colors.redAccent,
            child:   FadeInImage.assetNetwork(
                imageErrorBuilder: (context,object,stackTrace){
                  return Image.asset('assets/squadio.jpg',width: widget.actorProfilesEntity!.width!.toDouble()
                      ,height: widget.actorProfilesEntity!.height!.toDouble(),fit: BoxFit.fill);
                },
                imageScale: 3,

                placeholder: 'assets/squadio.jpg',
                image: '${AppConstants.imageUrl}${widget.actorProfilesEntity!.filePath!}'
                ,height: widget.actorProfilesEntity!.height!.toDouble(),fit: BoxFit.fill),
          ),
           Align(alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                onPressed: (){
                  _saveNetworkImage('${AppConstants.imageUrl}${widget.actorProfilesEntity!.filePath!}');
                },
                icon: const Icon(Icons.save_alt,color: Colors.orange,size: 50,),
              ),
            ),
          ),
          Align(alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.actorDetailsEntity!.name!,style: GoogleFonts.reemKufi(color: Colors.white,fontSize: 16),
              ),
            ),
          ),

           Align(alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
               visible: isVisible,
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white,)
                ),
              ),
            ),
          ),
        ],
        ),
      ),
    ),
);
  }
}