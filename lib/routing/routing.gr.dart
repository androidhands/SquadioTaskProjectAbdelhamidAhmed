// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../features/actor_details/presentation/pages/actor_details_page.dart'
    as _i2;
import '../features/popular_people/domain/entities/popular_people_entity.dart'
    as _i5;
import '../features/popular_people/presentation/pages/popular_people_page.dart'
    as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    PopularPeopleListRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PopularPeopleListPage());
    },
    ActorDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ActorDetailsRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.ActorDetailsPage(
              key: args.key, popularPeopleEntity: args.popularPeopleEntity));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(PopularPeopleListRoute.name, path: '/'),
        _i3.RouteConfig(ActorDetailsRoute.name, path: '/actor-details-page')
      ];
}

/// generated route for
/// [_i1.PopularPeopleListPage]
class PopularPeopleListRoute extends _i3.PageRouteInfo<void> {
  const PopularPeopleListRoute()
      : super(PopularPeopleListRoute.name, path: '/');

  static const String name = 'PopularPeopleListRoute';
}

/// generated route for
/// [_i2.ActorDetailsPage]
class ActorDetailsRoute extends _i3.PageRouteInfo<ActorDetailsRouteArgs> {
  ActorDetailsRoute(
      {_i4.Key? key, required _i5.PopularPeopleEntity? popularPeopleEntity})
      : super(ActorDetailsRoute.name,
            path: '/actor-details-page',
            args: ActorDetailsRouteArgs(
                key: key, popularPeopleEntity: popularPeopleEntity));

  static const String name = 'ActorDetailsRoute';
}

class ActorDetailsRouteArgs {
  const ActorDetailsRouteArgs({this.key, required this.popularPeopleEntity});

  final _i4.Key? key;

  final _i5.PopularPeopleEntity? popularPeopleEntity;

  @override
  String toString() {
    return 'ActorDetailsRouteArgs{key: $key, popularPeopleEntity: $popularPeopleEntity}';
  }
}
