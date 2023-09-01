import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  TextEditingController searchController = TextEditingController();
  bool isSearchVisible = false;

  void toggleSearchVisibility() {
    setState(() {
      isSearchVisible = !isSearchVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              toggleSearchVisibility(); // Toggle the visibility of the search area
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Visibility(
            visible: isSearchVisible,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Shop Content'),
            ),
          ),
        ],
      ),
    );
  }
}
