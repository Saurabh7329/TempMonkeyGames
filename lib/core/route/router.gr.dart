// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    OnboardingBuilderRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OnboardingBuilder(),
      );
    },
    AuthPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AuthPage(),
      );
    },
    AuthBuilderRoute.name: (routeData) {
      final args = routeData.argsAs<AuthBuilderRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AuthBuilder(
          key: args.key,
          authStatus: args.authStatus,
          isGuest: args.isGuest,
        ),
      );
    },
    RecoveryPageBuilderRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RecoveryPageBuilder(),
      );
    },
    MatchDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<MatchDetailsPageRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MatchDetailsPage(
          key: args.key,
          game: args.game,
        ),
      );
    },
    HomePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    DeleteAccountPasswordPageRoute.name: (routeData) {
      final args = routeData.argsAs<DeleteAccountPasswordPageRouteArgs>(
          orElse: () => const DeleteAccountPasswordPageRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: DeleteAccountPasswordPage(key: args.key),
      );
    },
    AccountDeletedPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AccountDeletedPage(),
      );
    },
    SettingsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    ChangePasswordPageRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordPageRouteArgs>(
          orElse: () => const ChangePasswordPageRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ChangePasswordPage(key: args.key),
      );
    },
    NotificationPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const NotificationPage(),
      );
    },
    AffiliateViewRoute.name: (routeData) {
      final args = routeData.argsAs<AffiliateViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AffiliateView(
          key: args.key,
          promotion: args.promotion,
        ),
      );
    },
    SignUpViewRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpViewRouteArgs>(
          orElse: () => const SignUpViewRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SignUpView(key: args.key),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          OnboardingBuilderRoute.name,
          path: '/onboarding-builder',
        ),
        RouteConfig(
          AuthPageRoute.name,
          path: '/auth-page',
        ),
        RouteConfig(
          AuthBuilderRoute.name,
          path: '/auth-builder',
        ),
        RouteConfig(
          RecoveryPageBuilderRoute.name,
          path: '/recovery-page-builder',
        ),
        RouteConfig(
          MatchDetailsPageRoute.name,
          path: '/match-details-page',
        ),
        RouteConfig(
          HomePageRoute.name,
          path: '/home-page',
        ),
        RouteConfig(
          DeleteAccountPasswordPageRoute.name,
          path: '/delete-account-password-page',
        ),
        RouteConfig(
          AccountDeletedPageRoute.name,
          path: '/account-deleted-page',
        ),
        RouteConfig(
          SettingsPageRoute.name,
          path: '/settings-page',
        ),
        RouteConfig(
          ChangePasswordPageRoute.name,
          path: '/change-password-page',
        ),
        RouteConfig(
          NotificationPageRoute.name,
          path: '/notification-page',
        ),
        RouteConfig(
          AffiliateViewRoute.name,
          path: '/affiliate-view',
        ),
        RouteConfig(
          SignUpViewRoute.name,
          path: '/sign-up-view',
        ),
      ];
}

/// generated route for
/// [OnboardingBuilder]
class OnboardingBuilderRoute extends PageRouteInfo<void> {
  const OnboardingBuilderRoute()
      : super(
          OnboardingBuilderRoute.name,
          path: '/onboarding-builder',
        );

  static const String name = 'OnboardingBuilderRoute';
}

/// generated route for
/// [AuthPage]
class AuthPageRoute extends PageRouteInfo<void> {
  const AuthPageRoute()
      : super(
          AuthPageRoute.name,
          path: '/auth-page',
        );

  static const String name = 'AuthPageRoute';
}

/// generated route for
/// [AuthBuilder]
class AuthBuilderRoute extends PageRouteInfo<AuthBuilderRouteArgs> {
  AuthBuilderRoute({
    Key? key,
    required Auth authStatus,
    bool isGuest = false,
  }) : super(
          AuthBuilderRoute.name,
          path: '/auth-builder',
          args: AuthBuilderRouteArgs(
            key: key,
            authStatus: authStatus,
            isGuest: isGuest,
          ),
        );

  static const String name = 'AuthBuilderRoute';
}

class AuthBuilderRouteArgs {
  const AuthBuilderRouteArgs({
    this.key,
    required this.authStatus,
    this.isGuest = false,
  });

  final Key? key;

  final Auth authStatus;

  final bool isGuest;

  @override
  String toString() {
    return 'AuthBuilderRouteArgs{key: $key, authStatus: $authStatus, isGuest: $isGuest}';
  }
}

/// generated route for
/// [RecoveryPageBuilder]
class RecoveryPageBuilderRoute extends PageRouteInfo<void> {
  const RecoveryPageBuilderRoute()
      : super(
          RecoveryPageBuilderRoute.name,
          path: '/recovery-page-builder',
        );

  static const String name = 'RecoveryPageBuilderRoute';
}

/// generated route for
/// [MatchDetailsPage]
class MatchDetailsPageRoute extends PageRouteInfo<MatchDetailsPageRouteArgs> {
  MatchDetailsPageRoute({
    Key? key,
    required Game game,
  }) : super(
          MatchDetailsPageRoute.name,
          path: '/match-details-page',
          args: MatchDetailsPageRouteArgs(
            key: key,
            game: game,
          ),
        );

  static const String name = 'MatchDetailsPageRoute';
}

class MatchDetailsPageRouteArgs {
  const MatchDetailsPageRouteArgs({
    this.key,
    required this.game,
  });

  final Key? key;

  final Game game;

  @override
  String toString() {
    return 'MatchDetailsPageRouteArgs{key: $key, game: $game}';
  }
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [DeleteAccountPasswordPage]
class DeleteAccountPasswordPageRoute
    extends PageRouteInfo<DeleteAccountPasswordPageRouteArgs> {
  DeleteAccountPasswordPageRoute({Key? key})
      : super(
          DeleteAccountPasswordPageRoute.name,
          path: '/delete-account-password-page',
          args: DeleteAccountPasswordPageRouteArgs(key: key),
        );

  static const String name = 'DeleteAccountPasswordPageRoute';
}

class DeleteAccountPasswordPageRouteArgs {
  const DeleteAccountPasswordPageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'DeleteAccountPasswordPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AccountDeletedPage]
class AccountDeletedPageRoute extends PageRouteInfo<void> {
  const AccountDeletedPageRoute()
      : super(
          AccountDeletedPageRoute.name,
          path: '/account-deleted-page',
        );

  static const String name = 'AccountDeletedPageRoute';
}

/// generated route for
/// [SettingsPage]
class SettingsPageRoute extends PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(
          SettingsPageRoute.name,
          path: '/settings-page',
        );

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [ChangePasswordPage]
class ChangePasswordPageRoute
    extends PageRouteInfo<ChangePasswordPageRouteArgs> {
  ChangePasswordPageRoute({Key? key})
      : super(
          ChangePasswordPageRoute.name,
          path: '/change-password-page',
          args: ChangePasswordPageRouteArgs(key: key),
        );

  static const String name = 'ChangePasswordPageRoute';
}

class ChangePasswordPageRouteArgs {
  const ChangePasswordPageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ChangePasswordPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [NotificationPage]
class NotificationPageRoute extends PageRouteInfo<void> {
  const NotificationPageRoute()
      : super(
          NotificationPageRoute.name,
          path: '/notification-page',
        );

  static const String name = 'NotificationPageRoute';
}

/// generated route for
/// [AffiliateView]
class AffiliateViewRoute extends PageRouteInfo<AffiliateViewRouteArgs> {
  AffiliateViewRoute({
    Key? key,
    required List<Promotion> promotion,
  }) : super(
          AffiliateViewRoute.name,
          path: '/affiliate-view',
          args: AffiliateViewRouteArgs(
            key: key,
            promotion: promotion,
          ),
        );

  static const String name = 'AffiliateViewRoute';
}

class AffiliateViewRouteArgs {
  const AffiliateViewRouteArgs({
    this.key,
    required this.promotion,
  });

  final Key? key;

  final List<Promotion> promotion;

  @override
  String toString() {
    return 'AffiliateViewRouteArgs{key: $key, promotion: $promotion}';
  }
}

/// generated route for
/// [SignUpView]
class SignUpViewRoute extends PageRouteInfo<SignUpViewRouteArgs> {
  SignUpViewRoute({Key? key})
      : super(
          SignUpViewRoute.name,
          path: '/sign-up-view',
          args: SignUpViewRouteArgs(key: key),
        );

  static const String name = 'SignUpViewRoute';
}

class SignUpViewRouteArgs {
  const SignUpViewRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SignUpViewRouteArgs{key: $key}';
  }
}
