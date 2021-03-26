import 'package:flutter/material.dart';
import 'pages/accout_page.dart';
import 'pages/home.dart';
import 'pages/search_page.dart';
import 'pages/upload_page.dart';
import 'pages/active_page.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == "HomePage")
      child = HomePage();
    else if (tabItem == "SearchPage")
      child = SearchPage();
    else if (tabItem == "UploadPage")
      child = UploadPage();
    else if (tabItem == "ActivePage")
      child = ActivePage();
    else if (tabItem == "AccoutPage") child = AccoutPage();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
