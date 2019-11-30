import 'package:flutter/material.dart';
import 'package:flutter_tabbar_demo/HomePage.dart';
import 'package:flutter_tabbar_demo/SearchPage.dart';
import 'package:flutter_tabbar_demo/SettingsPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TabBar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter TabBar Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter TabBar Demo'),
        elevation: 4.0, //影
      ),
      body: new PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          new HomePage(),
          new SearchPage(),
          new SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: onTapBottomNavigation,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: Text('Home')),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('検索'),
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.settings),
                title: Text('設定')),
          ]),
    );
  }

  void onTapBottomNavigation(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}