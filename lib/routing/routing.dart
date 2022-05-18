import 'package:auto_route/auto_route.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/popular_people/presentation/pages/popular_people_page.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute> [
      AutoRoute(page: PopularPeopleListPage,initial: true),

    ])
class $AppRouter {}