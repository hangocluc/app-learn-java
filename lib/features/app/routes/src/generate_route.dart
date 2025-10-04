import 'package:flutter/material.dart';
import '../../../presentation/pages/main_page/main_page.dart';
import '../../../presentation/pages/demo_page/compoment/demo_page.dart';
import '../../../presentation/pages/login_page/login_page.dart';
import 'not_found_page.dart';
import 'routes_name.dart';

class GenerateRoute {
  static Route<dynamic> getPageRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.root:
        return getPageRoute(const LoginPage(), settings);
      case RouteName.home:
        return getPageRoute(const DemoPage(), settings);
      case RouteName.main:
        return getPageRoute(const MainPage(), settings);
      // case RouteName.registerVerificationEmail:
      //   final args = settings.arguments as RegisterVerificationEmailPageParams;
      //   return getPageRoute(
      //       RegisterVerificationEmailPage(args: args), settings);

      default:
        return getPageRoute(const NotFoundPage(), settings);
    }
  }
}
