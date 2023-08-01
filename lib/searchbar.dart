import 'package:flutter/material.dart';
import 'custom_delegate.dart';

// ignore: must_be_immutable
class SearchBar extends StatefulWidget {
  List<String> searchTerms;
  SearchBar({super.key, required this.searchTerms});

  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 30,
      width: currentWidth - 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextButton(
        onPressed: () {
          showSearch(
              context: context,
              delegate: CustomSearchDelegate(searchTerms: widget.searchTerms));
        },
        child: const Text(
          "Search",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
