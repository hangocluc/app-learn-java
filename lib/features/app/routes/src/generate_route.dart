import 'package:flutter/material.dart';

import '../../../../common/widget/app_only_text_page.dart/app_only_text_param.dart';
import '../../../../common/widget/app_web_view/app_web_view.dart';
import '../../../presentation/pages/demo_page/compoment/demo_page.dart';
import 'not_found_page.dart';
import 'routes_name.dart';

class GenerateRoute {
  static Route<dynamic> getPageRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.root:
        return getPageRoute(const DemoPage(), settings);
      // case RouteName.home:
      //   return getPageRoute(const HomePage(), settings);
      // case RouteName.registerVerificationEmail:
      //   final args = settings.arguments as RegisterVerificationEmailPageParams;
      //   return getPageRoute(
      //       RegisterVerificationEmailPage(args: args), settings);

      default:
        return getPageRoute(const NotFoundPage(), settings);
    }
  }
}
