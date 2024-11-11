import 'package:befocus/core/core.dart';
import 'package:flutter/material.dart';

class TemplateUI extends StatelessWidget {
  const TemplateUI({
    required this.body,
    super.key,
    this.appBar,
    this.bottomNavigationBar,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: appBar ?? const DefaultAppBarUI(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  body,
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar != null
          ? Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: bottomNavigationBar,
            )
          : const SizedBox.shrink(),
    );
  }
}
