import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/authentication/auth_cubit.dart';
import 'package:transportkartan/authentication/auth_state.dart';
import 'package:transportkartan/constants/colors.dart';
import 'package:transportkartan/crud/company_firestore_cubit.dart';
import 'package:transportkartan/crud/workplace_firestore_cubit.dart';
import 'package:transportkartan/views/logged_in_view/logged_in_view.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/views/create_site_dialog/widgets/site_company_list_widget/cubit/company_on_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/cubit/filter_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/cubit/selected_site_cubit.dart';
import 'package:transportkartan/crud/site_firestore_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/map/cubit/map_cubit.dart';
import 'package:transportkartan/firebase_options.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/views/create_company_dialog/cubit/create_company_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/views/create_site_dialog/cubit/create_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/cubit/navigation_rail_cubit.dart';

import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/left_navigation_bar.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/site_and_company_view.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/map/map_view.dart';
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
          create: (context) => NavigationRailCubit(),
        ),
        BlocProvider(
          create: (context) => CreateSiteCubit(),
        ),
        BlocProvider(
          create: (context) => CreateCompanyCubit(),
        ),
        BlocProvider(
          create: (context) => SiteFirestoreCubit()..fetchAllSites(),
        ),
        BlocProvider(create: (context) => WorkplaceFirestoreCubit()),
        BlocProvider(
          create: (context) => CompanyFirestoreCubit()..fetchAllComapnies(),
        ),
        BlocProvider(
          create: (context) => SiteListCubit(),
        ),
        BlocProvider(
          create: (context) => FilterSiteCubit(),
        ),
        BlocProvider(
          create: (context) => CompanyOnSiteRowCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
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
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLoggedOut) {
              return const Center(
                child: Text('Du är inte inloggad'),
              );
            } else {
              return LoggedInView();
            }
          },
        ),
      ),
    );
  }
}
