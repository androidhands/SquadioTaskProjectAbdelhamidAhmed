// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../features/actor_details/domain/entities/actor_details_entity.dart'
    as _i8;
import '../features/actor_details/domain/entities/actor_profiles_entity.dart'
    as _i7;
import '../features/actor_details/presentation/pages/actor_details_page.dart'
    as _i2;
import '../features/actor_details/presentation/pages/actor_full_image_page.dart'
    as _i3;
import '../features/popular_people/domain/entities/popular_people_entity.dart'
    as _i6;
import '../features/popular_people/presentation/pages/popular_people_page.dart'
    as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    PopularPeopleListRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PopularPeopleListPage());
    },
    ActorDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ActorDetailsRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.ActorDetailsPage(
              key: args.key, popularPeopleEntity: args.popularPeopleEntity));
    },
    ActorFullImageRoute.name: (routeData) {
      final args = routeData.argsAs<ActorFullImageRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.ActorFullImagePage(
              key: args.key,
              actorProfilesEntity: args.actorProfilesEntity,
              actorDetailsEntity: args.actorDetailsEntity));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(PopularPeopleListRoute.name, path: '/'),
        _i4.RouteConfig(ActorDetailsRoute.name, path: '/actor-details-page'),
        _i4.RouteConfig(ActorFullImageRoute.name,
            path: '/actor-full-image-page')
      ];
}

/// generated route for
/// [_i1.PopularPeopleListPage]
class PopularPeopleListRoute extends _i4.PageRouteInfo<void> {
  const PopularPeopleListRoute()
      : super(PopularPeopleListRoute.name, path: '/');

  static const String name = 'PopularPeopleListRoute';
}

/// generated route for
/// [_i2.ActorDetailsPage]
class ActorDetailsRoute extends _i4.PageRouteInfo<ActorDetailsRouteArgs> {
  ActorDetailsRoute(
      {_i5.Key? key, required _i6.PopularPeopleEntity? popularPeopleEntity})
      : super(ActorDetailsRoute.name,
            path: '/actor-details-page',
            args: ActorDetailsRouteArgs(
                key: key, popularPeopleEntity: popularPeopleEntity));

  static const String name = 'ActorDetailsRoute';
}

class ActorDetailsRouteArgs {
  const ActorDetailsRouteArgs({this.key, required this.popularPeopleEntity});

  final _i5.Key? key;

  final _i6.PopularPeopleEntity? popularPeopleEntity;

  @override
  String toString() {
    return 'ActorDetailsRouteArgs{key: $key, popularPeopleEntity: $popularPeopleEntity}';
  }
}

/// generated route for
/// [_i3.ActorFullImagePage]
class ActorFullImageRoute extends _i4.PageRouteInfo<ActorFullImageRouteArgs> {
  ActorFullImageRoute(
      {_i5.Key? key,
      required _i7.ActorProfilesEntity? actorProfilesEntity,
      required _i8.ActorDetailsEntity? actorDetailsEntity})
      : super(ActorFullImageRoute.name,
            path: '/actor-full-image-page',
            args: ActorFullImageRouteArgs(
                key: key,
                actorProfilesEntity: actorProfilesEntity,
                actorDetailsEntity: actorDetailsEntity));

  static const String name = 'ActorFullImageRoute';
}

class ActorFullImageRouteArgs {
  const ActorFullImageRouteArgs(
      {this.key,
      required this.actorProfilesEntity,
      required this.actorDetailsEntity});

  final _i5.Key? key;

  final _i7.ActorProfilesEntity? actorProfilesEntity;

  final _i8.ActorDetailsEntity? actorDetailsEntity;

  @override
  String toString() {
    return 'ActorFullImageRouteArgs{key: $key, actorProfilesEntity: $actorProfilesEntity, actorDetailsEntity: $actorDetailsEntity}';
  }
}
