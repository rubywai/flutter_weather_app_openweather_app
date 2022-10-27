import 'package:flutter/material.dart';

import '../../../bloc/search_bloc/search_city_bloc.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
    required TextEditingController searchController,
    required SearchCityBloc searchCityBloc,
  }) : _searchController = searchController, _searchCityBloc = searchCityBloc, super(key: key);

  final TextEditingController _searchController;
  final SearchCityBloc _searchCityBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
            hintText: 'Search City',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
                onPressed: () {
                  if (_searchController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please Enter City Name')));
                  } else {
                    _searchCityBloc
                        .add(SearchCity(_searchController.text));
                  }
                },
                icon: const Icon(Icons.search))),
      ),
    );
  }
}