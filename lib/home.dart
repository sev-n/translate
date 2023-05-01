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
        title: const Text('Translate'),
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
              leading: Icon(
                Icons.home,
                color: selectedPage == 0 ? Colors.black : null,
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
              //selectedColor: Colors.black,
              selectedTileColor: Colors.grey[400],
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(
                Icons.three_p_rounded,
                color: selectedPage == 1 ? Colors.black : null,
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
              selectedTileColor: Colors.grey[400],
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: Icon(
                Icons.security,
                color: selectedPage == 2 ? Colors.black : null,
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
              selectedTileColor: Colors.grey[400],
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
        child: ExampleDropdownButton(),
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
final dropdownFocusNode = FocusNode();

class ExampleDropdownButton extends StatefulWidget {
  const ExampleDropdownButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExampleDropdownButtonState createState() => _ExampleDropdownButtonState();
}

class _ExampleDropdownButtonState extends State<ExampleDropdownButton> {
  String selectedValue = 'en';

  final languages = {'English': 'en', 'Filipino': 'tagalog'};

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      focusNode: dropdownFocusNode,
      value: selectedValue,
      onChanged: (newValue) {
        setState(() {
          selectedValue = newValue!;
          debugPrint(selectedValue);
        });
      },
      focusColor: Colors.white,
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.pushNamed(context, '/languages');
        
      },
      items: languages.entries.map((entry) {
        return DropdownMenuItem<String>(
          value: entry.value,
          child: Text(entry.key),
        );
      }).toList(),
      underline: const SizedBox.shrink(),
    );
  }
}
