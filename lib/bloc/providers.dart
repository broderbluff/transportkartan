import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/authentication/auth_cubit.dart';
import 'package:transportkartan/bloc/crud/company_firestore_cubit.dart';
import 'package:transportkartan/bloc/crud/company_repository.dart';
import 'package:transportkartan/bloc/crud/site_firestore_cubit.dart';
import 'package:transportkartan/bloc/crud/site_repository.dart';
import 'package:transportkartan/bloc/crud/workplace_firestore_cubit.dart';
import 'package:transportkartan/bloc/crud/workplace_repository.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_company_dialog/cubit/create_company_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/cubit/create_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/widgets/site_company_list_widget/cubit/company_on_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/map/cubit/map_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/navigation_rail/cubit/navigation_rail_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/cubit/filter_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/cubit/selected_site_cubit.dart';

List<BlocProvider> providers = [
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
    create: (context) => CompanyFirestoreCubit(context.read<AuthCubit>(), CompanyRepository()),
  ),
  BlocProvider(
    create: (context) => SiteListCubit(),
  ),
  BlocProvider(
    create: (context) => FilterSiteCubit(),
  ),
  BlocProvider(
    create: (context) => WorkplaceOnSiteCubit(),
  ),
  BlocProvider(
    create: (context) => SiteFirestoreCubit(SiteRepository(), context.read<AuthCubit>()),
  ),
  BlocProvider(
    create: (context) => CreateSiteCubit(),
  ),
];
