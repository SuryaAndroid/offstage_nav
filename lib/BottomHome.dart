import 'package:flutter/material.dart';
import 'package:offstage_nav/About.dart';
import 'package:offstage_nav/Home.dart';
import 'package:offstage_nav/Setting.dart';

class BottomHome extends StatefulWidget {
  const BottomHome({Key? key}) : super(key: key);

  @override
  State<BottomHome> createState() => _BottomHomeState();
}

class _BottomHomeState extends State<BottomHome> {

  var currentIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          Home(),
          Setting(),
          About(),
        ].elementAt(index);
      },
    };
  }

  Widget StageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);
    return Offstage(
      offstage: currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[currentIndex].currentState!.maybePop();

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home, color: Colors.green,)
            ),
            BottomNavigationBarItem(
                label: "Setting",
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings, color: Colors.green,)
            ),
            BottomNavigationBarItem(
                label: "About",
                icon: Icon(Icons.account_circle_outlined),
                activeIcon: Icon(Icons.account_circle, color: Colors.green,)
            ),
          ],
          onTap: (index){
              setState((){
                currentIndex = index;
              });
          },
        ),
        body: Stack(
          children: [
            StageNavigator(0),
            StageNavigator(1),
            StageNavigator(2),
          ],
        ),
      ),
    );
  }
}


