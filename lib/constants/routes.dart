import 'package:go_router/go_router.dart';
import 'package:project_kw39/components/gallery_item.dart';
import 'package:project_kw39/screens/details.dart';
import 'package:project_kw39/screens/home.dart';

class AppRouteConstants {
  static const String home = '/';
  static const String details = '/details';
  static const String about = '/about';
}

class AppRouter {
  static final _routes = [
    GoRoute(
      path: AppRouteConstants.home,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: AppRouteConstants.details,
          builder: (context, state) {
            final item = state.extra as GalleryItemCard;
            return DetailsPage(item: item);
          },
        ),
      ],
    ),
  ];

  static GoRouter get routerConfig => GoRouter(
    routes: _routes
  );
}
