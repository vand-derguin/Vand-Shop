import 'package:go_router/go_router.dart';
import 'package:vandshop_front_app/src/core/routes/app_routes.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.homeview.route,
    routes: [],
  );
}
