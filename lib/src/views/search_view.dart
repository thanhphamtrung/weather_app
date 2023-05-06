import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

import '../providers/search_provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter a city name',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Perform the search logic here using context.read
                      context.read<SearchProvider>().search(_controller.text);
                    },
                  ),
                ),
              ),
              suggestionsCallback: (query) {
                // Get the search suggestions using context.read
                context.read<SearchProvider>().getSuggestions(query);
                var x = context.read<SearchProvider>().suggestions;
                // Return the list of suggestions from the provider
                return context.read<SearchProvider>().suggestions;
              },
              itemBuilder: (context, suggestion) {
                // Find the index of the suggestion in the list of suggestions
                final index = context
                    .watch<SearchProvider>()
                    .suggestions
                    .indexOf(suggestion);
                // Return a widget for each suggestion using context.watch and the index
                return ListTile(
                  title:
                      Text(context.watch<SearchProvider>().suggestions[index]),
                );
              },
              onSuggestionSelected: (suggestion) {
                // Find the index of the suggestion in the list of suggestions
                final index = context
                    .watch<SearchProvider>()
                    .suggestions
                    .indexOf(suggestion);
                // Update the text field with the selected suggestion using context.watch and the index
                _controller.text =
                    context.watch<SearchProvider>().suggestions[index];
              },
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                // Get the list of search results using context.watch
                itemCount: context.watch<SearchProvider>().results.length,
                itemBuilder: (context, index) {
                  // Get the city name and temperature from the list
                  final city =
                      context.watch<SearchProvider>().results[index].city;
                  final temp =
                      context.watch<SearchProvider>().results[index].temp;
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.location_city),
                      title: Text(city), // The name of the city
                      subtitle: Text(
                          'Temperature $temp°C'), // The temperature of the city
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () {
                        // Navigate to the details screen here
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
