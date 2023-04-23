import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _data = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grape',
    'Lemon',
    'Mango',
    'Orange',
    'Papaya',
    'Peach',
    'Plum',
    'Raspberry',
    'Strawberry',
    'Watermelon',
  ];
  List<String> _filteredData = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _filteredData = _data;
    _searchController.addListener(_performSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    //Simulates waiting for an API call
    await Future.delayed(const Duration(milliseconds: 1000));

    setState(() {
      _filteredData = _data
          .where((element) => element
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
      _isLoading = false;
    });
  }

  @override

   @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purple.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: TextField(
            controller: _searchController,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.white54),
              border: InputBorder.none,
            ),
          ),
        ),
      body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : ListView.builder(
                itemCount: _filteredData.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    _filteredData[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
        backgroundColor: Colors.deepPurple.shade900,
      );
}