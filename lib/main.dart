import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    dynamic appTitle = "Weather Dating App";
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      // home: const Profile(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

BottomNavigationBar navBar(int index) {
  return BottomNavigationBar(
    currentIndex: index,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Matches',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.cloud),
        label: 'Profile',
      ),
    ],
    onTap: (value) => {},
  );
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  int _currentIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BackButton(
            onPressed: () => {
              Navigator.pop(context)
            },
          )
        ],
      ),
      body: Column(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Profile',
          ),
        ],
        onTap: (value) => {
          // MaterialPageRoute placeToGo;
          // switch(value){
          // }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(
                title: 'Homepage',
              ),
            ),
          ),
          setState(() => _currentIndex = value),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Container buildProfileCard(String profileType) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.all(10.0),
      color: Colors.purple,
      child: Column(
        children: [
          Text(profileType),
        ],
      ),
    );
  }

  bool? isChecked = true;
  int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Weather Dating app"),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            buildProfileCard("Cloud Profile"),
            buildProfileCard("Rain Profile"),
            buildProfileCard("Snow Profile"),
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value;
                });
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Profile',
          ),
        ],
        onTap: (value) => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(
                title: 'Homepage',
              ),
            ),
          ),
          setState(() => _currentIndex = value),
        },
      ),
    );
  }
}
