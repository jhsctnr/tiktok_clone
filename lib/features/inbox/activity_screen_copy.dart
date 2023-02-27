import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TestActivityScreen extends StatefulWidget {
  const TestActivityScreen({super.key});

  @override
  State<TestActivityScreen> createState() => _TestActivityScreenState();
}

class _TestActivityScreenState extends State<TestActivityScreen> {
  final List<String> _notifications = List.generate(
    20,
    (index) => "${index}h",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All activity"),
        ),
        body: ListView(
          children: [
            Gaps.v14,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20,
              ),
              child: Text(
                'New',
                style: TextStyle(
                  fontSize: Sizes.size14,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            Gaps.v14,
            for (var notification in _notifications)
              MyWidget(
                child: ListTile(
                  minVerticalPadding: Sizes.size16,
                  leading: Container(
                    width: Sizes.size52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: Sizes.size1,
                      ),
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.bell,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  title: RichText(
                    text: TextSpan(
                      text: "Account updates:",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: Sizes.size16,
                      ),
                      children: [
                        const TextSpan(
                          text: " Upload longer videos",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: " $notification",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: Sizes.size16,
                  ),
                ),
              ),
          ],
        ));
  }
}

class MyWidget extends StatefulWidget {
  final Widget child;
  const MyWidget({super.key, required this.child});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  double _left = 10;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {},
      onPanUpdate: (details) {
        setState(() {
          _left -= details.delta.dx;
        });
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Container(
          padding: EdgeInsets.only(right: _left),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
          child: child!,
        ),
        child: widget.child,
      ),
    );
  }
}
