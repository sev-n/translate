import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final List<Widget> pages = [
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedPage = index;
      Navigator.of(context).pop(); // close the drawer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
        //elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: selectedPage == 0
                  ? Image.asset(
                      'assets/home_selected.png',
                      width: 25,
                      height: 25,
                    )
                  : Image.asset(
                      'assets/home_unselected.png',
                      width: 25,
                      height: 25,
                    ),
              title: Text(
                'Home',
                style: selectedPage == 0
                    ? const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )
                    : null,
              ),
              selected: selectedPage == 0,
              selectedColor: Colors.black,
              selectedTileColor: Colors.grey[400],
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: selectedPage == 1
                  ? Image.asset(
                      'assets/about_selected.png',
                      width: 25,
                      height: 25,
                    )
                  : Image.asset(
                      'assets/about_unselected.png',
                      width: 25,
                      height: 25,
                    ),
              title: Text(
                'About',
                style: selectedPage == 1
                    ? const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )
                    : null,
              ),
              selected: selectedPage == 1,
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: selectedPage == 2
                  ? Image.asset(
                      'assets/privacy_selected.png',
                      width: 25,
                      height: 25,
                    )
                  : Image.asset(
                      'assets/privacy_unselected.png',
                      width: 25,
                      height: 25,
                    ),
              title: Text(
                'Privacy Policy',
                style: selectedPage == 2
                    ? const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )
                    : null,
              ),
              selected: selectedPage == 2,
              onTap: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
      body: pages[selectedPage],
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Page 1'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Page 3'),
      ),
    );
  }
}
