import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const Sign1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const Sign1Widget(),
        ),
        FFRoute(
          name: 'sign1',
          path: '/sign1',
          builder: (context, params) => const Sign1Widget(),
        ),
        FFRoute(
          name: 'sign2',
          path: '/sign2',
          builder: (context, params) => const Sign2Widget(),
        ),
        FFRoute(
          name: 'sign3',
          path: '/sign3',
          builder: (context, params) => Sign3Widget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            pw: params.getParam(
              'pw',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'sign4',
          path: '/sign4',
          builder: (context, params) => Sign4Widget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            pw: params.getParam(
              'pw',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            subname: params.getParam(
              'subname',
              ParamType.String,
            ),
            birth: params.getParam(
              'birth',
              ParamType.DateTime,
            ),
            gender: params.getParam(
              'gender',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'sign5',
          path: '/sign5',
          builder: (context, params) => const Sign5Widget(),
        ),
        FFRoute(
          name: 'home1',
          path: '/home1',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'home1') : const Home1Widget(),
        ),
        FFRoute(
          name: 'stdMake1',
          path: '/stdMake1',
          builder: (context, params) => const StdMake1Widget(),
        ),
        FFRoute(
          name: 'stdMake2',
          path: '/stdMake2',
          builder: (context, params) => StdMake2Widget(
            stdName: params.getParam(
              'stdName',
              ParamType.String,
            ),
            stdPrfPicture: params.getParam(
              'stdPrfPicture',
              ParamType.String,
            ),
            stdIntro: params.getParam(
              'stdIntro',
              ParamType.String,
            ),
            stdUrl: params.getParam(
              'stdUrl',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'stdMake3',
          path: '/stdMake3',
          builder: (context, params) => const StdMake3Widget()
        ),
        FFRoute(
          name: 'stdList1',
          path: '/stdList1',
          builder: (context, params) => const StdList1Widget(),
        ),
        FFRoute(
          name: 'stdList2',
          path: '/stdList2',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'stdList2')
              : const StdList2Widget(),
        ),
        FFRoute(
          name: 'stdList3',
          path: '/stdList3',
          builder: (context, params) => const StdList3Widget(),
        ),
        FFRoute(
          name: 'prf1',
          path: '/prf1',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'prf1') : Prf1Widget(
                userUid: params.getParam(
                  'userUid',
                  ParamType.String,
                ),
              ),
        ),
        FFRoute(
          name: 'set1',
          path: '/set1',
          builder: (context, params) => const Set1Widget(),
        ),
        FFRoute(
          name: 'set2',
          path: '/set2',
          builder: (context, params) => const Set2Widget(),
        ),
        FFRoute(
          name: 'set3',
          path: '/set3',
          builder: (context, params) => const Set3Widget(),
        ),
        FFRoute(
          name: 'stdHome2',
          path: '/stdHome2',
          builder: (context, params) => StdHome2Widget(
            stdName: params.getParam(
              'stdName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'stdHome3',
          path: '/stdHome3',
          builder: (context, params) => StdHome3Widget(
            stdName: params.getParam(
              'stdName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'stdHome1',
          path: '/stdHome1',
          builder: (context, params) => StdHome1Widget(
            stdName: params.getParam(
              'stdName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'QA1',
          path: '/qa1',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'QA1') : const Qa1Widget(),
        ),
        FFRoute(
          name: 'QA2',
          path: '/qa2',
          builder: (context, params) => const Qa2Widget(),
        ),
        FFRoute(
          name: 'QA3',
          path: '/qa3',
          builder: (context, params) => Qa3Widget(
            usrInputTxt: params.getParam(
              'usr_input_txt',
              ParamType.String,
            ),
            aiOutput: params.getParam(
              'ai_output',
              ParamType.String,
            ),
            docId: params.getParam(
              'doc_id',
              ParamType.String,
            ),
            createdTime: params.getParam(
              'created_time',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'stdHome4',
          path: '/stdHome4',
          builder: (context, params) => StdHome4Widget(
            stdName: params.getParam(
              'stdName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'stdHome5',
          path: '/stdHome5',
          builder: (context, params) => StdHome5Widget(
            stdName: params.getParam(
              'stdName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'stdList4',
          path: '/stdList4',
          builder: (context, params) => const StdList4Widget(),
        ),
        FFRoute(
          name: 'contest1',
          path: '/contest1',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'contest1'): const Contest1Widget(),
        ),
        FFRoute(
          name: 'contest2',
          path: '/contest2',
          builder: (context, params) => Contest2Widget(
            contents: params.getParam(
              'contents',
              ParamType.JSON
            )
          ),
        ),
        FFRoute(
          name: 'contest3',
          path: '/contest3',
          builder: (context, params) => const Contest3Widget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed( // push to stack
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/sign1';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
