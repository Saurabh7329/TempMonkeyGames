import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freeplay/feature/account/view/pages/delete_account/account_deleted_page.dart';
import 'package:freeplay/feature/account/view/pages/delete_account/delete_account_password_page.dart';
import 'package:freeplay/core/domain/domain.dart';
import 'package:freeplay/feature/account/view/pages/settings/change_password_page.dart';
import 'package:freeplay/feature/account/view/pages/settings/settings_page.dart';
import 'package:freeplay/feature/affiliate/affiliate_view.dart';
import 'package:freeplay/feature/auth/auth.dart';
import 'package:freeplay/feature/auth/view/pages/auth_page.dart';
import 'package:freeplay/feature/auth/view/pages/onboarding.dart';
import 'package:freeplay/feature/auth/view/pages/recovery_password_page.dart';
import 'package:freeplay/feature/home/view/pages/home_page.dart';
import 'package:freeplay/feature/home/view/pages/notification_page.dart';
import 'package:freeplay/feature/home/view/pages/match_details_page/match_details_page.dart';
import 'package:freeplay/feature/signup/signupview.dart';
import '../domain/configuration.dart';
part 'router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: OnboardingBuilder),
    AutoRoute(page: AuthPage),
    AutoRoute(page: AuthBuilder),
    AutoRoute(page: RecoveryPageBuilder),
    AutoRoute(page: MatchDetailsPage),
    AutoRoute(page: HomePage),
    AutoRoute(page: DeleteAccountPasswordPage),
    AutoRoute(page: AccountDeletedPage),
    AutoRoute(page: SettingsPage),
    AutoRoute(page: ChangePasswordPage),
    AutoRoute(page: NotificationPage),
    AutoRoute(page: AffiliateView),
    AutoRoute(page: SignUpView)
  ],
)
class AppRouter extends _$AppRouter {}
