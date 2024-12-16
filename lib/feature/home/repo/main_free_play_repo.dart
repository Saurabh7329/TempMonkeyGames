import 'package:dartz/dartz.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/dio/app_dio.dart';
import 'package:freeplay/core/domain/configuration.dart';
import 'package:freeplay/core/domain/domain.dart';
import 'package:freeplay/core/domain/notification/notification.dart';
import 'package:freeplay/core/domain/signup.dart';
import 'package:freeplay/core/error/custom_exception.dart';
import 'package:freeplay/core/error/error_type.dart';
import 'package:freeplay/core/error/failure.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/main.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@injectable
class MainFreePlayRepo {
  MainFreePlayRepo(this._dio);

  final AppDio _dio;

  Future<Either<Failure, List<Sport>>> getSports() async {
    try {
      final response = await _dio.getRequest(path: '/sports');
      return Right((response.data['data'] as List)
          .map((e) => Sport.fromJson(e))
          .toList());
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }

  Future<Either<Failure, List<League>>> getLeagues() async {
    try {
      final response = await _dio.getRequest(path: '/leagues?fields=sport');
      List<League> leagues = (response.data['data'] as List)
          .map((e) => League.fromJson(e))
          .toList();


      List<String> arrStr = ["NHL", "NBA", "NCAAF", "NCAAB", "MLB", "NFL"];
      var terms = LocalStorage.getConfiguration(CONFIGURATION);
      if (terms != null) {
        arrStr = terms.data.games;
      }

      // Sort leagues based on the order in arrStr
      leagues.sort((a, b) {
        int indexA = arrStr.indexOf(a.abbreviation);
        int indexB = arrStr.indexOf(b.abbreviation);
        return indexA.compareTo(indexB);
      });

      return Right(leagues);
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }

  Future<Either<Failure, List<Notification>>> getNotifications(
      bool isRead) async {
    try {
      final response = await _dio.getRequest(
          path: 'notifications',
          queryParameters:
              isRead == true ? {'mark_read': '1'} : {'unread': '1'});
      return Right((response.data['data'] as List)
          .map((e) => Notification.fromJson(e))
          .toList());
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }

  /// If league parameter gotten, response will be games only with this league
  Future<Either<Failure, List<Game>>> getFeaturedGames({
    League? legue,
  }) async {
    try {
      final leagueQuery =
          legue?.abbreviation == null ? '' : '/leagues/${legue?.abbreviation}';
      const fieldsBasic = 'odds,teams';
      final now = DateTime.now();

      final date = DateFormat('yyyy-MM-dd').format(now);
      final response = await _dio.getRequest(
          path:
              '$leagueQuery/games?&fields=$fieldsBasic&from_date=$date&from_date_days=15&timezone=$timezone&featured=1');
      return Right((response.data['data'] as List)
          .map((e) => Game.fromJson(e))
          .toList());
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }

  Future<Either<Failure, List<Game>>> getGames() async {
    try {
      final response = await _dio.getRequest(
        path:
            '/leagues/mlb/games?fields=odds,teams&from_date=july 23, 2021&from_date_days=0&timezone=America/Edmonton',
      );
      return Right((response.data['data'] as List)
          .map((e) => Game.fromJson(e))
          .toList());
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }

  Future<Either<Failure, Wager>> createWager(CreateWagerParams params) async {
    try {
      final response = await _dio.postRequest(
        path: '/wagers',
        data: params.toMap(),
        queryParameters: {
          'timezone': timezone,
        },
      );
      return Right(Wager.fromJson(response.data['data']));
    } on CustomException catch (e) {
      return Left(Failure(e.errorType, message: e.message));
    }
  }

  Future<Either<Failure, List<Wager>>> getWagers() async {
    try {
      final response = await _dio.getRequest(
        path: '/wagers',
        queryParameters: {
          'fields': 'teams',
          'timezone': 'America/Edmonton',
          'sort': 'asc',
          'page': 1,
        },
      );

      return Right((response.data['data'] as List)
          .map((e) => Wager.fromJson(e))
          .toList());
    } on CustomException catch (e) {
      return Left(Failure(e.errorType));
    }
  }

  Future<Either<Failure, Configuration>> getConfiguration() async {
    try {
      final response = await _dio.getRequest(
        path: '/configuration',
      );
      // Check if response data is not a Map<String, dynamic>
      if (response.data is! Map<String, dynamic>) {
        return Left(Failure(ErrorType.dio_other,
            data: "", message: 'Unexpected data format'));
      }
      final responseData = response.data as Map<String, dynamic>;
      // Check if 'promotions' key exists and its value is a List

      print('responseData=========>${responseData.toString()}');
      if (!responseData.containsKey('promotions') ||
          responseData['promotions'] is! List) {
        return Left(Failure(ErrorType.dio_other,
            data: "", message: 'Missing or invalid promotions data'));
      }
      return Right(Configuration.fromJson(response.data));
    } on CustomException catch (e) {
      return Left(Failure(e.errorType, message: e.message));
    } catch (e) {
      return Left(Failure(ErrorType.dio_other,
          data: "", message: 'Unexpected error: $e'));
    }
  }

  Future<Either<Failure, SignUp>> signUp(Map<String, String> data) async {
    try {
      final response = await _dio.postRequest(
        path: 'auth/realplay',
        data: data,
      );
      return Right(SignUp.fromJson(response.data['data']));
    } on CustomException catch (e) {
      return Left(Failure(e.errorType, message: e.message));
    }
  }
}
