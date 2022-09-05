import 'package:flutter/material.dart';
import '../widgets/feeds_grid.dart';

import '../resources/string_manager.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.allProducts),
      ),
      body: const SingleChildScrollView(child: FeedsGrid(isInMain: false)),
    );
  }
}
