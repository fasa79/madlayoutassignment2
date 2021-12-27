import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Switch',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
      ),
      home: const MyTabbedPage(title: 'Smart Switch'),
    );
  }
}

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({ Key? key, required this.title }) : super(key: key);

  final String title;
  
  @override
  State<MyTabbedPage> createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> _items = [
    {
      'tab': 'Hall',
      'item': [
        {
          'name': 'Lamp 1',
          'isOn': false,
          'icon': Icons.lightbulb_outlined,
        },
        {
          'name': 'Aircond',
          'isOn': false,
          'icon': Icons.ac_unit,
        },
        {
          'name': 'Window',
          'isOn': false,
          'icon': Icons.window_outlined,
        },
        {
          'name': 'Lamp 2',
          'isOn': false,
          'icon': Icons.lightbulb_outlined,
        },
        {
          'name': 'TV',
          'isOn': false,
          'icon': Icons.tv_outlined,
        },
      ],
    },
    {
      'tab': 'Room',
      'item': [
        {
          'name': 'Lamp 1',
          'isOn': false,
          'icon': Icons.lightbulb_outlined,
        },
        {
          'name': 'Aircond',
          'isOn': false,
          'icon': Icons.ac_unit,
        },
        {
          'name': 'Window',
          'isOn': false,
          'icon': Icons.window_outlined,
        },
        {
          'name': 'Lamp 2',
          'isOn': false,
          'icon': Icons.lightbulb_outlined,
        },
        {
          'name': 'TV',
          'isOn': false,
          'icon': Icons.tv_outlined,
        },
      ],
    },
    {
      'tab': 'Toilet',
      'item': [
        {
          'name': 'Lamp 1',
          'isOn': false,
          'icon': Icons.lightbulb_outlined,
        },
        {
          'name': 'Aircond',
          'isOn': false,
          'icon': Icons.ac_unit,
        },
        {
          'name': 'Window',
          'isOn': false,
          'icon': Icons.window_outlined,
        },
        {
          'name': 'Lamp 2',
          'isOn': false,
          'icon': Icons.lightbulb_outlined,
        },
        {
          'name': 'TV',
          'isOn': false,
          'icon': Icons.tv_outlined,
        },
      ],
    },
  ];
  
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _items.length);
  }

 @override
 void dispose() {
   _tabController.dispose();
   super.dispose();
 }

  void _tapContainer(int index, int tab_index){
    setState(() {
      _items[tab_index]['item'][index]['isOn'] = !_items[tab_index]['item'][index]['isOn'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: _items.map((category) => Tab(text: category['tab'])).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _items.map((category) => Tab(text: category['tab'])).toList().map((Tab tab) {
          return Center(
            child: GridView.builder(
              primary: false,
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
              itemCount: _items[_tabController.index]['item'].length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _tapContainer(index, _tabController.index),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: _items[_tabController.index]['item'][index]['isOn'] ? Colors.green : Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        Text(_items[_tabController.index]['item'][index]['name']),
                        Icon(_items[_tabController.index]['item'][index]['icon'], color: _items[_tabController.index]['item'][index]['isOn'] ? Colors.yellow : Colors.grey, size: 50.0),
                        Text(_items[_tabController.index]['item'][index]['isOn'] ? "On" : "Off"),
                      ],
                    ),
                  ),
                );
              },
            )
          );
        }).toList(),
      ),
    );
  }
}   