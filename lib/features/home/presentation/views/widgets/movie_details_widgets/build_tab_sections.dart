import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/views/widgets/movie_details_widgets/similar_tab.dart';

class BuildTabSections extends StatelessWidget {

  const BuildTabSections({super.key, });

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 1,
      child: Column(
        children: [
           TabBar(
            indicatorColor: Colors.redAccent,
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Similar'),

            ],
          ),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                SimilarTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
