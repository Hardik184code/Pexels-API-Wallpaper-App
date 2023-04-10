import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
  ));

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WallpaperBloc(),
      child: BlocProvider(
        create: (context) => SearchWallpaperBloc(),
        child: BlocProvider(
          create: (context) => CategoryWallpaperBloc(),
          child: MaterialApp(
            title: 'H Pexels',
            theme: ThemeData(
              brightness: Brightness.light,
              cardColor: Colors.white38,
              primaryColor: Colors.black,
              dialogBackgroundColor: Colors.white,
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: Colors.black,
              ),
            ),
            home: HomePage('H Pexels'),
          ),
        ),
      ),
    );
  }
}
