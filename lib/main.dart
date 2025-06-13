import 'package:auto_animated/auto_animated.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:structur_project/helpers/helper_methods.dart';
import 'package:structur_project/loading.dart';
import '/helpers/all_routes.dart';
import 'helpers/di.dart';
import 'helpers/language.dart';
import 'helpers/navigation_service.dart';
import 'helpers/register_provider.dart';
import 'networks/dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  diSetup();
  DioSingleton.instance.create();

  runApp(
    const MyApp(),
    // DevicePreview(
    //   enabled: true, // Set to false to disable device preview
    //   builder: (context) =>
    //   const MyApp(), // Your app widget
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: AnimateIfVisibleWrapper(
        showItemInterval: const Duration(milliseconds: 150),
        child: PopScope(
          canPop: false,
          // ignore: deprecated_member_use
          onPopInvoked: (bool didPop) async {
            // You can invoke a custom method here if needed
            // You can invoke a custom method here if needed
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return const UtillScreenMobile();
            },
          ),
        ),
      ),
    );
  }
}

class UtillScreenMobile extends StatelessWidget {
  const UtillScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 827),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return PopScope(
          canPop: false,
          // ignore: deprecated_member_use
          onPopInvoked: (bool didPop) async {
            showMaterialDialog(context);
          },
          child: GetMaterialApp(
            showPerformanceOverlay: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: false,
            ),
            debugShowCheckedModeBanner: false,
            translations: LocalString(),
            builder: (context, widget) {
              return MediaQuery(data: MediaQuery.of(context), child: widget!);
            },
            navigatorKey: NavigationService.navigatorKey,
            onGenerateRoute: RouteGenerator.generateRoute,

            home: Loading(),

            //
          ),
        );
      },
    );
  }
}
