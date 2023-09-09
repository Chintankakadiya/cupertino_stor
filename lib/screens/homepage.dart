import 'package:cupertino_stor/screens/cart_page.dart';
import 'package:cupertino_stor/screens/product_page.dart';
import 'package:cupertino_stor/screens/screen_page.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _tabs = [
    const ProductsPage(),
    const ScreenPage(),
    const CartPage()
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'Products'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart), label: 'Cart'),
          ],
        ),
        tabBuilder: (BuildContext context, index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return _tabs[index];
            },
          );
        },
      ),
    );
  }
}
