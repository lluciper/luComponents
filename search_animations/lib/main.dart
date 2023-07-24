import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedSearchBar(),
        ),
      ),
    );
  }
}

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({super.key});

  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _isSearchActive = false;
  final _focusNode = FocusNode();

  void _toggleSearch() {
    setState(() {
      _isSearchActive = !_isSearchActive;
    });
    if (!_isSearchActive) {
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: _toggleSearch,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: _isSearchActive ? 200 : 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade800,
                  offset: const Offset(1.5, 1.5),
                  blurRadius: 3.0,
                ),
                BoxShadow(
                  color: Colors.grey.shade600,
                  offset: const Offset(-1.5, -1.5),
                  blurRadius: 3.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: _isSearchActive ? 10 : 10),
                  child: const Icon(Icons.search, color: Colors.white),
                ),
                _isSearchActive
                    ? Expanded(
                        child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextField(
                          autofocus: true,
                          focusNode: _focusNode,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type to search...",
                            hintStyle: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ))
                    : Container(),
              ],
            ),
          ),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
