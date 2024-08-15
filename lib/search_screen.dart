import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final List<String> services;

  SearchScreen({required this.services});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchText = '';
  List<String> _filteredServices = [];

  @override
  void initState() {
    super.initState();
    _filteredServices = widget.services;
  }

  void _filterServices(String searchText) {
    setState(() {
      _searchText = searchText;
      if (_searchText.isEmpty) {
        _filteredServices = widget.services;
      } else {
        _filteredServices = widget.services
            .where((service) =>
            service.toLowerCase().contains(_searchText.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          onChanged: _filterServices,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _filteredServices.isNotEmpty
          ? ListView.builder(
        itemCount: _filteredServices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_filteredServices[index]),
          );
        },
      )
          : Center(
        child: Text('No results found.'),
      ),
    );
  }
}
