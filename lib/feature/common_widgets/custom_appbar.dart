part of '../hello/hello_view.dart';

///
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  ///
  const CustomAppBar({required this.title, super.key});

  ///
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
