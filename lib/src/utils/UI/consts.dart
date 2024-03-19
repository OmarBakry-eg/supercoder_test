// import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercoder_test/src/utils/exports.dart';

mixin Constants {
  static String? errorMessageString;
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();
  static bool demoLogin = false;
  static String devBaseURL = "https://dev.newtype-backend.zazz.buzz/";

  static bool isThereCurrentDialogShowing() =>
      ModalRoute.of(navigatorKey.currentContext!)?.isCurrent != true;

  static void closeAppFunction() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
      return;
    }
    exit(0);
  }

  static String getFileName(File file) {
    return file.path.split(Platform.pathSeparator).last;
  }

  static String getFileNameWithoutExtension(File file) {
    return file.path.split(Platform.pathSeparator).last.split('.').first;
  }

  static String getVoiceNameWithoutExtension(String? path) {
    return path?.split('/').last.split('.').first ?? "Voice_${DateTime.now()}";
  }

  static void unFocusFunc() {
    return FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<void> showLoading({
    String? title,
    String? description,
    Function? onPressed,
  }) async {
    return showDialog<void>(
      context: navigatorKey.currentContext!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  static void get hideLoadingOrNavBack => navigatorKey.currentState?.pop();
  static bool get canPop => navigatorKey.currentState!.canPop();

  static Route _createRoute(
    Widget screen, {
    Offset? beginOffset,
    Offset? endOffset,
    double? beginDouble,
    double? endDouble,
    Curve? curveElement,
    bool useSlideTransition = false,
    bool useScaleTransition = false,
    bool useRotationTransition = false,
    bool useFadeTransition = false,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        if (useSlideTransition) {
          final Offset begin = beginOffset ?? const Offset(0.0, 1.0);
          final Offset end = endOffset ?? Offset.zero;
          final Curve curve = curveElement ?? Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        }

        if (useScaleTransition) {
          final double begin = beginDouble ?? 0;
          final double end = endDouble ?? 1;
          final Curve curve = curveElement ?? Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return ScaleTransition(
            scale: animation.drive(tween),
            child: child,
          );
        }

        if (useRotationTransition) {
          final double begin = beginDouble ?? 0;
          final double end = endDouble ?? 1;
          final Curve curve = curveElement ?? Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return RotationTransition(
            turns: animation.drive(tween),
            child: child,
          );
        }

        if (useFadeTransition) {
          final double begin = beginDouble ?? 0;
          final double end = endDouble ?? 1;
          final Curve curve = curveElement ?? Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return FadeTransition(
            opacity: animation.drive(tween),
            child: child,
          );
        }

//* Default
        final Offset begin = beginOffset ?? const Offset(0.1, 0.0);
        final Offset end = endOffset ?? Offset.zero;
        final Curve curve = curveElement ?? Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Future<void> navigateTo(
    Widget screen, {
    bool pushReplacement = false,
    bool pushAndRemoveUntil = false,
    bool useCupertinoStyle = true,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    Offset? beginOffset,
    Offset? endOffset,
    double? beginDouble,
    double? endDouble,
    Curve? curveElement,
    bool useSlideTransition = false,
    bool useScaleTransition = false,
    bool useRotationTransition = false,
    bool useFadeTransition = false,
  }) async =>
      pushReplacement
          ? await Navigator.pushReplacement(
              navigatorKey.currentContext!,
              useCupertinoStyle
                  ? CupertinoPageRoute(
                      maintainState: maintainState,
                      fullscreenDialog: fullscreenDialog,
                      allowSnapshotting: allowSnapshotting,
                      builder: (c) => screen)
                  : _createRoute(
                      screen,
                      beginOffset: beginOffset,
                      endOffset: endOffset,
                      beginDouble: beginDouble,
                      endDouble: endDouble,
                      curveElement: curveElement,
                      useSlideTransition: useSlideTransition,
                      useScaleTransition: useScaleTransition,
                      useRotationTransition: useRotationTransition,
                      useFadeTransition: useFadeTransition,
                    ))
          : pushAndRemoveUntil
              ? await Navigator.pushAndRemoveUntil(
                  navigatorKey.currentContext!,
                  useCupertinoStyle
                      ? CupertinoPageRoute(
                          maintainState: maintainState,
                          fullscreenDialog: fullscreenDialog,
                          allowSnapshotting: allowSnapshotting,
                          builder: (c) => screen)
                      : _createRoute(
                          screen,
                          beginOffset: beginOffset,
                          endOffset: endOffset,
                          beginDouble: beginDouble,
                          endDouble: endDouble,
                          curveElement: curveElement,
                          useSlideTransition: useSlideTransition,
                          useScaleTransition: useScaleTransition,
                          useRotationTransition: useRotationTransition,
                          useFadeTransition: useFadeTransition,
                        ),
                  (r) => false)
              : await Navigator.push(
                  navigatorKey.currentContext!,
                  useCupertinoStyle
                      ? CupertinoPageRoute(
                          maintainState: maintainState,
                          fullscreenDialog: fullscreenDialog,
                          allowSnapshotting: allowSnapshotting,
                          builder: (c) => screen)
                      : _createRoute(
                          screen,
                          beginOffset: beginOffset,
                          endOffset: endOffset,
                          beginDouble: beginDouble,
                          endDouble: endDouble,
                          curveElement: curveElement,
                          useSlideTransition: useSlideTransition,
                          useScaleTransition: useScaleTransition,
                          useRotationTransition: useRotationTransition,
                          useFadeTransition: useFadeTransition,
                        ));

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      {required dynamic content,
      Color? backgroundColor,
      double? elevation,
      EdgeInsetsGeometry? margin,
      EdgeInsetsGeometry? padding,
      double? width,
      ShapeBorder? shape,
      SnackBarBehavior? behavior,
      SnackBarAction? action,
      bool? showCloseIcon,
      Color? closeIconColor,
      Duration duration = const Duration(seconds: 3),
      Animation<double>? animation,
      void Function()? onVisible,
      DismissDirection dismissDirection = DismissDirection.down,
      Clip clipBehavior = Clip.hardEdge,
      bool removeCurrentSnackBar = false,
      bool hideCurrentSnackBar = false}) {
    if (hideCurrentSnackBar && removeCurrentSnackBar) {
      throw Exception(
          "hideCurrentSnackBar and removeCurrentSnackBar musn't be true together");
    }
    if (hideCurrentSnackBar) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).hideCurrentSnackBar();
    }
    if (removeCurrentSnackBar) {
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .removeCurrentSnackBar();
    }
    return ScaffoldMessenger.of(navigatorKey.currentContext!)
        .showSnackBar(SnackBar(
      backgroundColor: backgroundColor,
      elevation: elevation,
      margin: margin,
      padding: padding,
      width: width,
      shape: shape,
      behavior: behavior,
      action: action,
      showCloseIcon: showCloseIcon,
      closeIconColor: closeIconColor,
      duration: duration,
      animation: animation,
      onVisible: onVisible,
      dismissDirection: dismissDirection,
      clipBehavior: clipBehavior,
      content: content.runtimeType == Widget
          ? content
          : Text(
              content,
              style: const TextStyle(color: MyColors.white),
            ),
    ));
  }

  static Future<dynamic> showModalBottomSheetFunc(
    Widget child, {
    Color? backgroundColor,
    String? barrierLabel,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = true,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = false,
    RouteSettings? routeSettings,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
    double raduis = 30,
    double initialChildSize = 0.9,
    double minChildSize = 0.5,
    double maxChildSize = 1.0,
    bool expand = false,
    bool snap = false,
  }) {
    return showModalBottomSheet(
        context: navigatorKey.currentContext!,
        isScrollControlled: isScrollControlled,
        useSafeArea: useSafeArea,
        isDismissible: isDismissible,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(raduis),
                topRight: Radius.circular(raduis),
              ),
            ),
        builder: (_) => DraggableScrollableSheet(
              initialChildSize: initialChildSize,
              minChildSize: minChildSize,
              maxChildSize: maxChildSize,
              expand: expand,
              snap: snap,
              builder: (_, controller) => child,
            ));
  }

  static String getTheNullString(Map<String, dynamic> map) {
    List<String?> res = [];
    for (var item in map.entries) {
      if (item.value == null) {
        res.add(item.key);
      }
    }
    return res.join(', ');
  }
}
