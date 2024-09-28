import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/views/widgets/search_listview.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          TextFormField(
            controller: searchText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)),
              hintText: "Search",
              suffixIcon: IconButton(
                onPressed: () {
                  context
                      .read<SearchCubit>()
                      .getSearchMovies(query: searchText.text);
                },
                icon: const Icon(Icons.search,
                    color: Colors.blue, size: 24),
              ),
            ),
          ),
          const SizedBox(height: 17),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Search Results :',
              style: Styles.textStyle18,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Search_ListView(query: searchText.text), // Pass the correct query
          ),
        ],
      ),
    );
  }
}
