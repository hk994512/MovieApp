import 'package:flutter/material.dart';

class MovieSearchBar extends StatefulWidget {
  const MovieSearchBar(
      {super.key, required this.onChanged, required this.isEmpty});
  final void Function(String) onChanged;
  final bool isEmpty;
  @override
  State<MovieSearchBar> createState() => _MovieSearchBarState();
}

class _MovieSearchBarState extends State<MovieSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(8, 0)),
          ],
        ),
        child: TextField(
          onChanged: (value) {
            widget.onChanged(value);
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              size: 24,
            ),
            hintText: "Search Movies",
            border: InputBorder.none,
            suffixIcon: widget.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      widget.onChanged('');
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
