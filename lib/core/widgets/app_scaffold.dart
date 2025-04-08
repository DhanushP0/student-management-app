import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_management_app/core/widgets/custom_loader.dart';

/// App-wide scaffold that provides consistent styling and the custom loader
/// to be used across all screens in the app.
class AppScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool isLoading;
  final bool centerTitle;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool extendBody;
  final bool resizeToAvoidBottomInset;

  const AppScaffold({
    Key? key,
    required this.body,
    this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.isLoading = false,
    this.centerTitle = true,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.extendBody = false,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          title != null
              ? AppBar(
                centerTitle: centerTitle,
                title: Text(
                  title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                leading: leading,
                actions: actions,
                backgroundColor: backgroundColor ?? Colors.white,
                elevation: 0,
              )
              : null,
      backgroundColor: backgroundColor,
      body: AppLoader(isLoading: isLoading, child: body),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      extendBody: extendBody,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}

/// App-wide screen base that provides a default layout with gradient background and styling
class AppScreen extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;

  const AppScreen({
    Key? key,
    required this.child,
    this.isLoading = false,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: CupertinoColors.systemBackground,
      body: AppLoader(
        isLoading: isLoading,
        child: Stack(
          children: [
            // Background gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFF0F4FF), Color(0xFFF8F8F8)],
                ),
              ),
            ),

            // Background decorative elements
            Positioned(
              top: -120,
              right: -80,
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CupertinoColors.systemIndigo.withOpacity(0.1),
                ),
              ),
            ),

            Positioned(
              bottom: -80,
              left: -50,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CupertinoColors.systemBlue.withOpacity(0.08),
                ),
              ),
            ),

            // Main content
            SafeArea(child: child),
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
