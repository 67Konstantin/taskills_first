import 'package:auto_route/auto_route.dart';
import 'package:taskills_first/features/account/view/view.dart';

import '../features/account/view/account_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignInRoute.page,
          path: '/sign_in',
        ),
        AutoRoute(
          page: AccountRoute.page,
          path: '/account',
        ),
        AutoRoute(
          page: SignUpRoute.page,
          path: '/sign_up',
          initial: true,
        ),
      ];
}
