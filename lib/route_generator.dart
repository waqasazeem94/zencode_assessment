import 'package:flutter/material.dart';
import 'package:zencode_assessment/all_utils.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      // case '/Debug':
      //   return MaterialPageRoute(
      //       builder: (_) => DebugWidget(routeArgument: args as RouteArgument));

      case '/Home':
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: SafeArea(child: Center(child: Text('Route Error')))));
    }
  }
}