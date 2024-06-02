import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/authentication/auth_cubit.dart';
import 'package:transportkartan/bloc/authentication/auth_state.dart';
import 'package:transportkartan/bloc/crud/site_repository.dart';
import 'package:transportkartan/bloc/crud/workplace_repository.dart';
import 'package:transportkartan/constants/colors.dart';
import 'package:transportkartan/bloc/crud/company_firestore_cubit.dart';
import 'package:transportkartan/bloc/crud/workplace_firestore_cubit.dart';
import 'package:transportkartan/views/logged_in_view/logged_in_view.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/widgets/site_company_list_widget/cubit/company_on_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/cubit/filter_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/cubit/selected_site_cubit.dart';
import 'package:transportkartan/bloc/crud/site_firestore_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/map/cubit/map_cubit.dart';
import 'package:transportkartan/firebase_options.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_company_dialog/cubit/create_company_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/cubit/create_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/cubit/navigation_rail_cubit.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:transportkartan/views/login_view/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => MapControllerCubit(),
        ),
        BlocProvider(
          create: (context) => NavigationRailCubit(),
        ),
        BlocProvider(
          create: (context) => CreateCompanyCubit(),
        ),
        BlocProvider(create: (context) => WorkplaceFirestoreCubit(WorkplaceRepository())),
        BlocProvider(
          create: (context) => CompanyFirestoreCubit(context.read<AuthCubit>()),
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
          create: (context) => SiteFirestoreCubit(SiteRepository(), context.read<AuthCubit>()),
        ),
        BlocProvider(
          create: (context) => CreateSiteCubit(),
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
            if (state is AuthStateInitial) {
              return const Center(
                child: Text('SPLASHSCREEN'),
              );
            } else if (state is AuthStateLoggedIn) {
              return const LoggedInView();
            } else if (state is AuthStateLoggedOut) {
              return LoginView();
            } else if (state is AuthStateFailure) {
              return const Center(
                child: Text('ERROR'),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
