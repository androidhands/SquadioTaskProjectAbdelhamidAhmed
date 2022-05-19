import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/errors/exceptions.dart';
import 'package:squadio_task_project_abdelhamid_hamed/core/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/data/models/actor_details_model.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/data/models/actor_images_model.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/data/models/error_response_model.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_details_entity.dart';
import 'package:squadio_task_project_abdelhamid_hamed/features/actor_details/domain/entities/actor_images_entity.dart';
abstract class ActorDetailsRemoteDataSource{
  Future<ActorDetailsEntity> getActorDetails(String id,String language);
  Future<ActorImagesEntity> getActorImages(String id);

}

class ActorDetailsRemoteDataSourceImpl implements ActorDetailsRemoteDataSource{
  final http.Client client;
  final String baseUrl;

  ActorDetailsRemoteDataSourceImpl(this.client, this.baseUrl);


  @override
  Future<ActorDetailsEntity> getActorDetails(String id, String language)async {

    try {
      Map<String, String> params = {
        'api_key': 'cd339a9f667acb20c5f6c6efd19c35f6',
        'language': language,
      };


      final databaseResponse = await client
          .get(Uri.parse(AppConstants.actorDetailUrl(id)).replace(queryParameters: params));
      if (databaseResponse.statusCode == 200) {
        final responseJson = databaseResponse.body;
        Map<String, dynamic> map = jsonDecode(responseJson);
        var serverResponse = ActorDetailsModel.fromJson(map);


        debugPrint('result '+jsonEncode(serverResponse));
        return serverResponse;
      } else if (databaseResponse.statusCode == 401 ||
          databaseResponse.statusCode == 404 ||
          databaseResponse.statusCode == 500) {
        final responseJson = databaseResponse.body;
        Map<String, dynamic> map = jsonDecode(responseJson);
        var errorResponse = ErrorResponseModel.fromJson(map);
        throw ServerException(errorResponse.statusMessage!);
      }

      else {
        throw ServerException('Un Known Response Code');
      }
    } on http.ClientException catch (e) {
      throw ServerException(e.message);
    } on HttpException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<ActorImagesEntity> getActorImages(String id) async{
    try {
      Map<String, String> params = {
        'api_key': 'cd339a9f667acb20c5f6c6efd19c35f6',
      };


      final databaseResponse = await client
          .get(Uri.parse(AppConstants.actorImagesUrl(id)).replace(queryParameters: params));
      if (databaseResponse.statusCode == 200) {
        final responseJson = databaseResponse.body;
        Map<String, dynamic> map = jsonDecode(responseJson);
        var serverResponse = ActorImagesModel.fromJson(map);
        debugPrint('result '+jsonEncode(serverResponse));
        return serverResponse;
      } else if (databaseResponse.statusCode == 401 ||
          databaseResponse.statusCode == 404 ||
          databaseResponse.statusCode == 500) {
        final responseJson = databaseResponse.body;
        Map<String, dynamic> map = jsonDecode(responseJson);
        var errorResponse = ErrorResponseModel.fromJson(map);
        throw ServerException(errorResponse.statusMessage!);
      }

      else {
        throw ServerException('Un Known Response Code');
      }
    } on http.ClientException catch (e) {
      throw ServerException(e.message);
    } on HttpException catch (e) {
      throw ServerException(e.message);
    }
  }



}