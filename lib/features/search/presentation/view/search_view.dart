import 'package:flutter/material.dart';
import 'package:mostkdm/core/widgets/local_app_bar.dart';
import 'package:mostkdm/features/search/presentation/section/search_content_section.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          LocalAppBar(title: "البحث"),
          Expanded(child: SearchContentSection()),
        ],
      ),
    );
  }
}