import 'package:eduba_test_app/core/service_locator/sl.dart';
import 'package:eduba_test_app/features/videos/presentation/bloc/videos_bloc_bloc.dart';
import 'package:eduba_test_app/static_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/strings/strings.dart';
import 'core/themes/light_theme.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<VideosBlocBloc>(),
            ),
          ],
          child: MaterialApp(
            title: appName,
            debugShowCheckedModeBanner: false,
            theme: LightTheme().getLightTheme,
            home: const SplashScreen(),
          ),
        );
      },
    );
  }
}
