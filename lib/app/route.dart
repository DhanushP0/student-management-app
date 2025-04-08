import 'package:go_router/go_router.dart';
import '../features/auth/login/login_screen.dart';
import '../features/auth/signup/signup_screen.dart';
import '../features/auth/welcome_screen.dart';
import '../features/student/student_page.dart';
import '../features/teacher/teacher_page.dart';
import '../features/admin/admin_page.dart';
import '../features/auth/login/forgot_password_view.dart';
import 'package:student_management_app/features/auth/login/reset_password_screen.dart';
import 'package:student_management_app/app/app_config.dart';

final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const WelcomeView()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
    GoRoute(path: '/student', builder: (context, state) => const StudentPage()),
    GoRoute(path: '/teacher', builder: (context, state) => const TeacherPage()),
    GoRoute(path: '/admin', builder: (context, state) => const AdminPage()),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordView(),
    ),
    GoRoute(
      path: '/reset-password',
      builder: (context, state) {
        final token = state.uri.queryParameters['refresh_token'];
        return ResetPasswordPage(
          refreshToken: token!,
        ); // make sure token isn't null
      },
    ),
  ],
);
