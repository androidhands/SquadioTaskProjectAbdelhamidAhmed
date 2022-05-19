import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/utils/app_constants.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/domain/entities/popular_people_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/bloc/popular_people_bloc.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/bloc/popular_people_bloc_events.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/bloc/popular_people_bloc_state.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/widgets/single_actor_widget.dart';

class PeopleListWidget extends StatefulWidget {
  const PeopleListWidget({Key? key}) : super(key: key);

  @override
  State<PeopleListWidget> createState() => _PeopleListWidgetState();
}

class _PeopleListWidgetState extends State<PeopleListWidget> {
  late var scrollController = ScrollController();
  int _counter = 0;

  @override
  void initState() {
    scrollController.addListener(pagination);
    super.initState();
    fetchImages();
  }

  fetchImages() {
    _counter += 1;
    BlocProvider.of<PopularPeopleBloc>(context)
        .add(GetPopularPeopleEvent(_counter, AppConstants.language));
    setState(() {
      isLoading = true;
    });
  }

  bool isLoading = false;
  bool isError = false;
  String errorMessage = "";
  List<PopularPeopleEntity> listMain = [];

  void pagination() {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        (listMain.length < 20000)) {
      fetchImages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: Colors.deepPurple,
            child: BlocListener<PopularPeopleBloc, PopularPeopleBlocState>(
              listener: (BuildContext context, state) {
                if (state is PopularPeopleInitialState) {
                  setState(() {
                    isLoading = true;
                    isError = false;
                  });
                } else if (state is OnGetPopularPeopleListSuccess) {
                  listMain.addAll(state.list);
                  setState(() {
                    isLoading = false;
                    isError = false;
                  });
                } else if (state is OnGetPopularPeopleError) {
                  setState(() {
                    isError = true;
                    errorMessage = state.message;
                    isLoading = false;
                  });
                }
              },
              child: ListViewWidget(
                  scrollController: scrollController, listMain: listMain)
              //PeopleListWidget(list: state.list,);
              ,
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
                visible: isLoading,
                child: const CircularProgressIndicator(color: Colors.white,)),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
                visible: isError,
                child: Container(
                    height: 60,
                    color: Colors.orange,
                    child: Text(
                      errorMessage,
                      style: GoogleFonts.reemKufi(fontSize: 14),
                    ))),
          ),
        ),
      ],
    );

    /*Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(3),

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ListView(
        controller: scrollController,
        children: widget.list!.map((e) =>  SingleActorWidget(popularPeopleEntity: e,)).toList(),
      )
    );*/
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    required this.scrollController,
    required this.listMain,
  }) : super(key: key);

  final ScrollController scrollController;
  final List<PopularPeopleEntity> listMain;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(3),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ListView(
          controller: scrollController,
          children: listMain
              .map((e) => SingleActorWidget(
                    popularPeopleEntity: e,
                  ))
              .toList(),
        ));
  }
}
