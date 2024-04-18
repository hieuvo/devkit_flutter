/*
This is api provider
This page is used to get data from API
 */

import 'package:devkitflutter/config/constant.dart';
import 'package:devkitflutter/model/integration/login_model.dart';
import 'package:devkitflutter/model/integration/product_grid_model.dart';
import 'package:devkitflutter/model/integration/product_listview_model.dart';
import 'package:devkitflutter/model/integration/student_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio = Dio();
  late Response response;
  String connErr = 'Please check your internet connection and try again';

  Future<Response> getConnect(url, apiToken) async{
    // print('url : $url');
    try{
      dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
      dio.options.connectTimeout = const Duration(seconds: 30);
      dio.options.receiveTimeout = const Duration(seconds: 25);

      return await dio.post(url, cancelToken: apiToken);
    } on DioException catch (e){
      //debugPrint(e.toString()+' | '+url.toString());
      if(e.type == DioExceptionType.badResponse){
        int? statusCode = e.response!.statusCode;
        if(statusCode == statusNotFound){
          throw "Api not found";
        } else if(statusCode == statusInternalError){
          throw "Internal Server Error";
        } else {
          throw e.message.toString();
        }
      } else if(e.type == DioExceptionType.connectionTimeout){
        throw e.message.toString();
      } else if(e.type == DioExceptionType.cancel){
        throw 'cancel';
      }
      throw connErr;
    } finally{
      dio.close();
    }
  }

  Future<Response> postConnect(url, data, apiToken) async{
    // print('url : $url');
    // print('postData : $data');
    try{
      dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
      dio.options.connectTimeout = const Duration(seconds: 30);
      dio.options.receiveTimeout = const Duration(seconds: 25);

      return await dio.post(url, data: data, cancelToken: apiToken);
    } on DioException catch (e){
      //debugPrint(e.toString()+' | '+url.toString());
      if(e.type == DioExceptionType.badResponse){
        int? statusCode = e.response!.statusCode;
        if(statusCode == statusNotFound){
          throw "Api not found";
        } else if(statusCode == statusInternalError){
          throw "Internal Server Error";
        } else {
          throw e.message.toString();
        }
      } else if(e.type == DioExceptionType.connectionTimeout){
        throw e.message.toString();
      } else if(e.type == DioExceptionType.cancel){
        throw 'cancel';
      }
      throw connErr;
    } finally{
      dio.close();
    }
  }

  Future<String> getExample(apiToken) async {
    response = await getConnect('$serverUrl/example/getData', apiToken);
    // print('res : $response');
    return response.data.toString();
  }

  Future<String> postExample(String id, apiToken) async {
    var postData = {
      'id': id
    };
    response = await postConnect('$serverUrl/example/postData', postData, apiToken);
    // print('res : $response');
    return response.data.toString();
  }

  Future<List<StudentModel>> getStudent(String sessionId, apiToken) async {
    var postData = {
      'session_id': sessionId
    };
    response = await postConnect('$serverUrl/student/getStudent', postData, apiToken);
    if(response.data['status'] == statusOk){
      List responseList = response.data['data'];
      List<StudentModel> listData = responseList.map((f) => StudentModel.fromJson(f)).toList();
      return listData;
    } else {
      throw response.data['msg'];
    }
  }

  Future<List<dynamic>> addStudent(String sessionId, String studentName, String studentPhoneNumber, String studentGender, String studentAddress, apiToken) async {
    var postData = {
      'session_id': sessionId,
      'student_name': studentName,
      'student_phone_number': studentPhoneNumber,
      'student_gender': studentGender,
      'student_address': studentAddress,
    };
    response = await postConnect('$serverUrl/student/addStudent', postData, apiToken);
    if(response.data['status'] == statusOk){
      List<dynamic> respList = [];
      respList.add(response.data['msg']);
      respList.add(response.data['data']['id']);
      return respList;
    } else {
      throw response.data['msg'];
    }
  }

  Future<String> editStudent(String sessionId, int studentId, String studentName, String studentPhoneNumber, String studentGender, String studentAddress, apiToken) async {
    var postData = {
      'session_id': sessionId,
      'student_id': studentId,
      'student_name': studentName,
      'student_phone_number': studentPhoneNumber,
      'student_gender': studentGender,
      'student_address': studentAddress,
    };
    response = await postConnect('$serverUrl/student/editStudent', postData, apiToken);
    if(response.data['status'] == statusOk){
      return response.data['msg'];
    } else {
      throw response.data['msg'];
    }
  }

  Future<String> deleteStudent(String sessionId, int studentId, apiToken) async {
    var postData = {
      'session_id': sessionId,
      'student_id': studentId,
    };
    response = await postConnect('$serverUrl/student/deleteStudent', postData, apiToken);
    if(response.data['status'] == statusOk){
      return response.data['msg'];
    } else {
      throw response.data['msg'];
    }
  }

  Future<List<LoginModel>> login(String email, String password, apiToken) async {
    var postData = {
      'email': email,
      'password': password,
    };
    response = await postConnect(loginApi, postData, apiToken);
    if(response.data['status'] == statusOk){
      List responseList = response.data['data'];
      List<LoginModel> listData = responseList.map((f) => LoginModel.fromJson(f)).toList();
      return listData;
    } else {
      throw response.data['msg'];
    }
  }

  Future<List<ProductGridModel>> getProductGrid(String sessionId, String skip, String limit, apiToken) async {
    var postData = {
      'session_id': sessionId,
      'skip': skip,
      'limit': limit
    };
    response = await postConnect(productApi, postData, apiToken);
    if(response.data['status'] == statusOk){
      List responseList = response.data['data'];
      //debugPrint('data : '+responseList.toString());
      List<ProductGridModel> listData = responseList.map((f) => ProductGridModel.fromJson(f)).toList();
      return listData;
    } else {
      throw response.data['msg'];
    }
  }

  Future<List<ProductListviewModel>> getProductListview(String sessionId, String skip, String limit, apiToken) async {
    var postData = {
      'session_id': sessionId,
      'skip': skip,
      'limit': limit
    };
    response = await postConnect(productApi, postData, apiToken);
    if(response.data['status'] == statusOk){
      List responseList = response.data['data'];
      //debugPrint('data : '+responseList.toString());
      List<ProductListviewModel> listData = responseList.map((f) => ProductListviewModel.fromJson(f)).toList();
      return listData;
    } else {
      throw response.data['msg'];
    }
  }
}
