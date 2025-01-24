part of '../view/home_view.dart';

class _Drawer extends StatelessWidget {
  final String versData;

  const _Drawer({required this.versData});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: AppDimens.drawerTopHeight),
      children: [
        listTiling(
          text: AppTexts.privacyPolicy,
          icon: Icons.privacy_tip,
          onTap: () => context.go('/privacy'),
        ),
        listTiling(
          text: '${AppTexts.appName} ($versData)',
          icon: Icons.verified_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  Widget listTiling({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.accentGreen100,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: AppDimens.fontMedium,
          color: AppColors.accentGreen500,
        ),
      ),
      onTap: onTap,
    );
  }
}
