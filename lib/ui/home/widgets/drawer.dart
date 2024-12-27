part of '../view/home_view.dart';

class _Drawer extends StatelessWidget {
  @override
  Widget build(Object context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          child: Text(
            '',
            style: TextStyle(fontSize: AppDimens.fontLarge),
          ),
        ),
        ListTile(title: Text('settings'), onTap: () {}),
        ListTile(
          title: Text('quit'),
          onTap: () {},
        ),
      ],
    );
  }
}