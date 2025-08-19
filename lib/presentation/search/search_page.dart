import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Search Page",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}