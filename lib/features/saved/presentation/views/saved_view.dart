import 'package:flutter/material.dart';
import 'package:movies_app/features/saved/presentation/views/widgets/saved_view_body.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SavedViewBody(),
    );
  }
}
