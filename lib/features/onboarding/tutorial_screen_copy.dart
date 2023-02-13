import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

enum Direction { right, left }

enum Page { first, second, third }

class TutorialScreenTest extends StatefulWidget {
  const TutorialScreenTest({super.key});

  @override
  State<TutorialScreenTest> createState() => _TutorialScreenTestState();
}

class _TutorialScreenTestState extends State<TutorialScreenTest>
    with SingleTickerProviderStateMixin {
  Direction _direction = Direction.right;
  Page _showInPage = Page.first;
  int _page = 0;
  final int _maxPage = 3;

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showInPage = Page.second;
        if (_page == _maxPage - 1) return;
        _page += 1;
      });
    } else {
      setState(() {
        _showInPage = Page.first;
        if (_page == 0) return;
        _page -= 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: SafeArea(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: [
                Column(
                  key: ValueKey<int>(_page),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Gaps.v80,
                    Text(
                      "Watch cool videos!",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ],
                ),
                Column(
                  key: ValueKey<int>(_page),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Gaps.v80,
                    Text(
                      "Follow the rules",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ],
                ),
                Column(
                  key: ValueKey<int>(_page),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Gaps.v80,
                    Text(
                      "Good !!!!Job!!",
                      style: TextStyle(
                        fontSize: Sizes.size40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gaps.v16,
                    Text(
                      "Videos are personalized for you based on what you watch, like, and share.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    ),
                  ],
                ),
              ][_page],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size24,
              horizontal: Sizes.size24,
            ),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _showInPage == Page.first ? 0 : 1,
              child: CupertinoButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                child: const Text('Enter the app!'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
