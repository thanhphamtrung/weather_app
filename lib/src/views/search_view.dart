import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/search_provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Search',
            ),
            onChanged: (query) {
              Provider.of<SearchProvider>(context, listen: false)
                  .updateSearchQuery(query);
            },
          ),
          Consumer<SearchProvider>(
            builder: (context, searchProvider, child) {
              return Text('Search query: ${searchProvider.searchQuery}');
            },
          ),
        ],
      ),
    );
  }
}
