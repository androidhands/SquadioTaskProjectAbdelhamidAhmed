import 'package:auto_route/auto_route.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/presentation/pages/actor_details_page.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/pages/popular_people_page.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute> [
      AutoRoute(page: PopularPeopleListPage,initial: true),
      AutoRoute(page: ActorDetailsPage),

    ])
class $AppRouter {}