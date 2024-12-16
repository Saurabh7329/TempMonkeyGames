import 'package:dartz/dartz.dart';
import 'package:freeplay/core/dio/app_dio.dart';
import 'package:freeplay/core/domain/betslip_change_amount_params.dart';
import 'package:freeplay/core/domain/betslip_change_type_params.dart';
import 'package:freeplay/core/domain/change_wager_params.dart';
import 'package:freeplay/core/domain/domain.dart';
import 'package:freeplay/core/error/custom_exception.dart';
import 'package:freeplay/core/error/failure.dart';
import 'package:freeplay/main.dart';
import 'package:injectable/injectable.dart';

@injectable
class BetslipRepo {
  final AppDio _dio;
  BetslipRepo(this._dio);

  Future<Either<Failure, bool>> deleteWager(int id) async {
    try {
      await _dio.deleteRequest(path: '/wagers/$id');
      return const Right(true);
    } on CustomException catch (e) {
      return Left(Failure(e.errorType, message: e.message));
    }
  }

  Future<Either<Failure, List<Betslip>>> getBetslips() async {
    try {
      final response = await _dio.getRequest(
        path: '/betslips',
        queryParameters: {
          'primary': 1,
          'timezone': timezone,
          'fields_basic': 'odds,teams',
        },
      );
      return Right((response.data['data'] as List)
          .map((e) => Betslip.fromJson(e))
          .toList());
    } on CustomException catch (e) {
      return Left(Failure(e.errorType, message: e.message));
    }
  }

  Future<Either<Failure, Betslip>> betslipChangeType(
      BetslipChangeTypeParams params) async {
    try {
      final response = await _dio.patchRequest(
        path: '/betslips/${params.id}',
        data: {'type': params.type},
        queryParameters: {
          'fields': 'teams',
          'timezone': timezone,
        },
      );
      return Right(Betslip.fromJson(response.data['data']));
    } on CustomException catch (e) {
      return Left(Failure(e.errorType, message: e.message));
    }
  }

  Future<Either<Failure, Betslip>> betslipChangeAmount(
      BetslipChangeAmountParams params) async {
    try {
      final response = await _dio.patchRequest(
        path: '/betslips/2',
        data: {'amount': params.amount},
        queryParameters: {
          'fields': 'teams',
          'timezone': timezone,
        },
      );
      return Right(Betslip.fromJson(response.data['data']));
    } on CustomException catch (e) {
      return Left(Failure(e.errorType, message: e.message));
    }
  }

  Future<Either<Failure, bool>> placeWager(int id) async {
    try {
      await _dio.patchRequest(
        path: '/betslips/$id',
        data: {'status': 'open'},
      );
      return const Right(true);
    } on CustomException catch (e) {
      return Left(Failure(e.errorType, message: e.message));
    }
  }

  Future<Either<Failure, bool>> changeWager(ChangeWagerParams params) async {
    try {
      final response = await _dio.patchRequest(
        path: '/wagers/${params.id}',
        data: {'amount': params.amount},
      );
      // return Right(Wager.fromJson(response.data['data']));
      return const Right(true);
    } on CustomException catch (e) {
      return Left(Failure(e.errorType, message: e.message));
    }
  }

  Future<Either<Failure, bool>> closeBetslip(int id) async {
    try {
      await _dio.patchRequest(path: '/betslips/$id', data: {'status': 'open'});
      return const Right(true);
    } on CustomException catch (e) {
      return Left(Failure(e.errorType, message: e.message));
    }
  }
}
