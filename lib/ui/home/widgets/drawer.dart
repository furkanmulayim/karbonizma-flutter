part of '../view/home_view.dart';

class _Drawer extends StatelessWidget {
  final String versData;

  const _Drawer({required this.versData});

  @override
  Widget build(Object context) {
    return ListView(
      padding: EdgeInsets.only(top: AppDimens.drawerTopHeight),
      children: [
        listTiling(AppTexts.settings, Icons.settings, () {}),
        listTiling(AppTexts.rewards, Icons.solar_power, () {}),
        listTiling(AppTexts.howToUse, Icons.how_to_reg, () {}),
        listTiling(AppTexts.quit, Icons.back_hand, () {}),
        listTiling(AppTexts.privacyPolicy, Icons.privacy_tip, () {}),
      ],
    );
  }

  Widget listTiling(String text, IconData icon, func) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: func,
      iconColor: AppColors.accentGreen100,
      textColor: AppColors.accentGreen1000,
    );
  }
}
