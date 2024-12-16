// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/dio/app_dio.dart';
import 'package:freeplay/core/domain/login_params/login_params.dart';
import 'package:freeplay/core/domain/register_params/register_params.dart';
import 'package:freeplay/core/domain/reset_password_params/reset_password_params.dart';
import 'package:freeplay/core/domain/user/user.dart';
import 'package:freeplay/core/error/custom_exception.dart';
import 'package:freeplay/core/error/error_type.dart';
import 'package:freeplay/core/error/failure.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:injectable/injectable.dart';
import 'dart:io' show Platform;
import 'package:device_info_plus/device_info_plus.dart';

enum Result { failed, completed }

@injectable
class AuthRepo {
  AuthRepo(this._dio, {required this.deviceInfoPlugin});

  final AppDio _dio;

  final DevicePlugin deviceInfoPlugin;

  Future<String?> getDevice() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      return androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      return iosInfo.model;
    }
    return null;
  }

  Future<Either<Failure, bool>> login({required LoginParams params}) async {
    try {
      final device = await getDevice();
      Response response = await _dio.postRequest(
          path: 'auth/login',
          data: LoginParams(
                  device_name: device,
                  email: params.email,
                  password: params.password)
              .toJson());

      final token = response.data['access_token'];
      final user = response.data['user'];
      await LocalStorage.setString(SHARED_PREFS_ACCESS_TOKEN, token);
      await LocalStorage.setString(
          Freeplay_User, jsonEncode(User.fromJson(user)));
      return const Right(true);
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }

  Future<Either<Failure, bool>> register(
      {required RegisterParams params, required bool isGuest}) async {
    try {
      final device = await getDevice();
      Response response = await _dio.postRequest(
          path: 'auth/${isGuest ? 'convert' : 'create'}',
          data: RegisterParams(
                  device_name: device,
                  email: params.email,
                  password: params.password,
                  username: params.username)
              .toJson());
        final token = response.data['access_token'];
        final user = response.data['user'];
        await LocalStorage.setString(SHARED_PREFS_ACCESS_TOKEN, token);
        await LocalStorage.setString(
            Freeplay_User, jsonEncode(User.fromJson(user)));
      
      return const Right(true);
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }

  Future<Either<Failure, bool>> forgot({required String email}) async {
    try {
      Response response =
          await _dio.postRequest(path: 'auth/forgot?email=$email');
      if (response.data['result'] == Result.completed.name) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            ErrorType.unmodified,
          ),
        );
      }
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }

  Future<Either<Failure, bool>> resetPassword(
      {required ResetPasswordParams params}) async {
    try {
      Response response =
          await _dio.postRequest(path: 'auth/reset', data: params.toJson());
      if (response.data['result'] == Result.completed.name) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            ErrorType.unmodified,
          ),
        );
      }
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }

  Future<Either<Failure, bool>> loginAsGuest() async {
    try {
      final device = await getDevice();
      Response response = await _dio
          .postRequest(path: 'auth/guest', data: {"device_name": device});
      final token = response.data['access_token'];
      final user = response.data['user'];
      await LocalStorage.setString(SHARED_PREFS_ACCESS_TOKEN, token);
      await LocalStorage.setString(
          Freeplay_User, jsonEncode(User.fromJson(user)));
      return const Right(true);
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }
}

@injectable
class DevicePlugin extends DeviceInfoPlugin {}
