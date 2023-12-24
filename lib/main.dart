import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/constants/colors.dart';
import 'package:transportkartan/cubit/create_company_cubit.dart';
import 'package:transportkartan/cubit/create_site_cubit.dart';
import 'package:transportkartan/cubit/firestore_cubit.dart';
import 'package:transportkartan/cubit/map_cubit.dart';
import 'package:transportkartan/cubit/marker_cubit.dart';
import 'package:transportkartan/cubit/navigation_rail_cubit.dart';
import 'package:transportkartan/firebase_options.dart';

import 'package:transportkartan/views/navigation_rail/left_navigation_bar.dart';
import 'package:transportkartan/views/logistics_hub/logistics_hub_widget.dart';
import 'package:transportkartan/views/map/map_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MapControllerCubit(),
        ),
        BlocProvider(
          create: (context) => MarkerCubit(),
        ),
        BlocProvider(
          create: (context) => NavigationRailCubit(),
        ),
        BlocProvider(
          create: (context) => CreateSiteCubit(),
        ),
        BlocProvider(
          create: (context) => CreateCompanyCubit(),
        ),
        BlocProvider(
          create: (context) => FireStoreCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transportkartan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('sv'),
      ],
      home: Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                const LeftNavigationBar(),
                Container(width: 140, height: double.infinity, color: mainColor),
                const Expanded(
                  child: MapWidget(),
                ),
              ],
            ),
            const LogisticsHubsWidget(),
          ],
        ),
      ),
    );
  }
}
