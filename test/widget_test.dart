import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mockito/mockito.dart';
import 'package:transportkartan/data/models/user_model.dart';
import 'package:transportkartan/main.dart';
import 'package:transportkartan/bloc/authentication/auth_cubit.dart';
import 'package:transportkartan/bloc/authentication/auth_state.dart';
import 'package:transportkartan/views/logged_in_view/logged_in_view.dart';
import 'package:transportkartan/views/login_view/login_view.dart';
import 'package:bloc_test/bloc_test.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  group('MyApp Widget Tests', () {
    testWidgets('renders SplashScreen for AuthStateInitial', (WidgetTester tester) async {
      final mockAuthCubit = MockAuthCubit();
      when(mockAuthCubit.state).thenReturn(AuthStateInitial());

      await tester.pumpWidget(
        BlocProvider<AuthCubit>(
          create: (context) => mockAuthCubit,
          child: const MyApp(),
        ),
      );

      expect(find.text('SPLASHSCREEN'), findsOneWidget);
    });

    testWidgets('renders LoggedInView for AuthStateLoggedIn', (WidgetTester tester) async {
      final mockAuthCubit = MockAuthCubit();
      when(mockAuthCubit.state).thenReturn(AuthStateLoggedIn(UserModel(id: '', name: '', userLevel: 0)));

      await tester.pumpWidget(
        BlocProvider<AuthCubit>(
          create: (context) => mockAuthCubit,
          child: const MyApp(),
        ),
      );

      expect(find.byType(LoggedInView), findsOneWidget);
    });

    testWidgets('renders LoginView for AuthStateLoggedOut', (WidgetTester tester) async {
      final mockAuthCubit = MockAuthCubit();
      when(mockAuthCubit.state).thenReturn(AuthStateLoggedOut());

      await tester.pumpWidget(
        BlocProvider<AuthCubit>(
          create: (context) => mockAuthCubit,
          child: const MyApp(),
        ),
      );

      expect(find.byType(LoginView), findsOneWidget);
    });

    testWidgets('renders Error message for AuthStateFailure', (WidgetTester tester) async {
      final mockAuthCubit = MockAuthCubit();
      when(mockAuthCubit.state).thenReturn(AuthStateFailure(Error()));

      await tester.pumpWidget(
        BlocProvider<AuthCubit>(
          create: (context) => mockAuthCubit,
          child: const MyApp(),
        ),
      );

      expect(find.text('ERROR'), findsOneWidget);
    });
  });
}
