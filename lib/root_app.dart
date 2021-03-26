// import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/constant/story_json.dart';
import 'package:instagram_app/tap_navigator.dart';
import 'theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  selectedTab(index) {
    this.setState(() {
      pageIndex = index;
    });
  }

  String _currentPage = "HomePage";
  List<String> pageKeys = [
    "HomePage",
    "SearchPage",
    "UploadPage",
    "ActivePage",
    "AccoutPage"
  ];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "HomePage": GlobalKey<NavigatorState>(),
    "SearchPage": GlobalKey<NavigatorState>(),
    "UploadPage": GlobalKey<NavigatorState>(),
    "ActivePage": GlobalKey<NavigatorState>(),
    "AccoutPage": GlobalKey<NavigatorState>(),
  };

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "HomePage") {
            _selectTab("HomePage", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
          backgroundColor: black,
          body: Stack(children: <Widget>[
            _buildOffstageNavigator("HomePage"),
            _buildOffstageNavigator("SearchPage"),
            _buildOffstageNavigator("UploadPage"),
            _buildOffstageNavigator("ActivePage"),
            _buildOffstageNavigator("AccoutPage"),
          ]),
          bottomNavigationBar: getFooter()),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }

  Widget getFooter() {
    List bottomTapBar = [
      pageIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      pageIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_icon.svg",
      pageIndex == 2
          ? "assets/images/upload_active_icon.svg"
          : "assets/images/upload_icon.svg",
      pageIndex == 3
          ? "assets/images/love_active_icon.svg"
          : "assets/images/love_icon.svg",
      // pageIndex == 4
      //     ? "assets/images/account_active_icon.svg"
      //     : "assets/images/account_icon.svg",
      "$profile"
    ];
    return Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(color: appBarColor),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(bottomTapBar.length, (index) {
                return InkWell(
                  onTap: () {
                    selectedTab(index);
                    _selectTab(pageKeys[index], index);
                  },
                  //         onTap: ( index) {
                  //   _selectTab(pageKeys[index], index);
                  // },
                  child: index == 4
                      ? Container(
                          width: 33,
                          height: 33,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: pageIndex == 4
                                    ? storyBorderColor
                                    : [Colors.black, Colors.black]),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: storyBorderColor),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(bottomTapBar[index]),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        )
                      : SvgPicture.asset(
                          bottomTapBar[index],
                          width: 27,
                        ),
                );
              })),
        ));
  }
}
