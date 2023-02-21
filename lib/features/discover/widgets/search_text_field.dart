import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _textEditingController = TextEditingController();

  bool _hasText = false;

  void _onXmarkTap() {
    _textEditingController.clear();
    setState(() {
      _hasText = false;
    });
  }

  void _onChanged(String value) {
    if (value.isNotEmpty) {
      setState(() {
        _hasText = true;
      });
    } else {
      setState(() {
        _hasText = false;
      });
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.size44,
      child: TextField(
        controller: _textEditingController,
        onChanged: _onChanged,
        decoration: InputDecoration(
          hintText: "Search",
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              Sizes.size12,
            ),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size10,
              horizontal: Sizes.size10,
            ),
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.grey.shade800,
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size10,
              horizontal: Sizes.size10,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_hasText)
                  GestureDetector(
                    onTap: _onXmarkTap,
                    child: FaIcon(
                      FontAwesomeIcons.circleXmark,
                      color: Colors.grey.shade800,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
