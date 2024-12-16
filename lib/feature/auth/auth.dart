import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freeplay/core/constants/constants.dart';
import 'package:freeplay/core/di/injections.dart';
import 'package:freeplay/core/local_storage/local_storage_service.dart';
import 'package:freeplay/core/route/router.dart';
import 'package:freeplay/feature/account/bloc/account_bloc.dart';
import 'package:freeplay/feature/auth/bloc/login_bloc.dart';
import 'package:freeplay/feature/auth/view/pages/login_page.dart';
import 'package:freeplay/feature/auth/view/pages/register_page.dart';
import 'package:freeplay/feature/common/app_loading.dart';
import 'package:freeplay/feature/home/bloc/bottom_nav_bar_bloc/bottom_nav_bar_bloc.dart';
import 'package:global_snack_bar/global_snack_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../core/domain/user/user.dart';

enum Auth { login, register }

class AuthBuilder extends StatefulWidget {
  final Auth authStatus;
  final bool isGuest;
  const AuthBuilder({Key? key, required this.authStatus, this.isGuest = false})
      : super(key: key);

  @override
  State<AuthBuilder> createState() => _AuthBuilderState();
}

class _AuthBuilderState extends State<AuthBuilder> {
  @override
  void initState() {
    super.initState();
    retriveFirebaseToken();

  }
  String? _deviceToken;
  Future<void> retriveFirebaseToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('AuthBuilder token=============>$token');
    // Save the token for later use
    if (token != null) {
      setState(() {
        _deviceToken = token;
        print('AuthBuilder token=============>$_deviceToken');
      });
    }
  }

  Future<void> sendTokenToServer(String token, String loginToken) async {
    print('AuthBuilder sendTokenToServer=============> $token , $loginToken');
    final response = await http.post(
      Uri.parse('${dotenv.env['ENDPOINT']}set_firebase_token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $loginToken',
        'app-api-key': dotenv.env['APP_API_KEY']!,
      },
      body: jsonEncode(<String, String>{
        'device_token': token,
      }),
    );
    print('AuthBuilder sendTokenToServer=============> ${response.statusCode}');
    print('AuthBuilder sendTokenToServer=============> ${response.body}');
    if (response.statusCode == 200) {
      print('Token sent to server successfully');
    } else {
      throw Exception('Failed to send token to server');
    }
  }

  Future<void> callAuthApi(String loginToken) async {
    print('AuthBuilder callAuthApi=============> $loginToken');
    final response = await http.get(
      Uri.parse('${dotenv.env['ENDPOINT']}auth'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $loginToken',
        'app-api-key': dotenv.env['APP_API_KEY']!,
      },
      /*body: jsonEncode(<String, String>{
        'device_token': token,
      }),*/
    );
    print('AuthBuilder callAuthApi=============> ${response.statusCode}');
    print('AuthBuilder callAuthApi=============> ${response.body}');
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final wallet = data['data']['wallet'];
      final user = User.fromJson(jsonDecode(LocalStorage.getString(Freeplay_User)!));
      user.wallet = wallet.toString();
      await LocalStorage.setString(
          Freeplay_User, jsonEncode(user));
      print('callAuthApi successfully');
    } else {
      //throw Exception('Failed to callAuthApi');
    }
  }


  @override
  Widget build(BuildContext context) {
    return GlobalMsgWrapper(
      BlocProvider(
        create: (context) => getIt<LoginBloc>(),
        child: Builder(builder: (context) {
          return BlocConsumer<LoginBloc, LoginState> (
            listener: (context, state) async {
              print('login=============> ${state.logged}');
              if (state.logged == true) {
                if (widget.isGuest) {
                  context.router.navigateBack();
                } else {
                  if (_deviceToken != null) {
                  await retriveFirebaseToken();
                  final token = LocalStorage.getString(SHARED_PREFS_ACCESS_TOKEN);
                  print('AuthBuilder login token=============> $token');
                  await sendTokenToServer(_deviceToken!, token!);
                  print('AuthBuilder calling auth api=============> $token');
                  await callAuthApi(token);
                  }
                  print('login=============> open home screen');
                  context.router.navigate(const HomePageRoute());
                }
              }
            },
            builder: (context, state) =>
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              return state.map(idle: (state) {
                if (state.isLoading) {
                  return const AppLoading();
                }
                switch (widget.authStatus) {
                  case Auth.login:
                    return state.logged == true ? SizedBox() : LoginPage();

                  case Auth.register:
                    return state.logged == true ? SizedBox() : RegisterPage(
                      isGuest: widget.isGuest,
                    );
                }
              });
            }),
          );
        }),
      ),
    );
  }
}
