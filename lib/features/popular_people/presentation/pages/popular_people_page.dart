import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/bloc/popular_people_bloc.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/widgets/people_list_widget.dart';
import '../../../../app_injection_container.dart';

class PopularPeopleListPage extends StatefulWidget {

  const PopularPeopleListPage({Key? key}) : super(key: key);


  @override
  State<PopularPeopleListPage> createState() => _PopularPeopleListPageState();
}

class _PopularPeopleListPageState extends State<PopularPeopleListPage> {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PopularPeopleBloc>(),
      child: Builder(
          builder: (context) {
           return Scaffold(
              appBar: AppBar(
                title: const Text('Squadio'),
              ),
              body: const PeopleListWidget()


            );
          }
      ),
    );
  }
}
