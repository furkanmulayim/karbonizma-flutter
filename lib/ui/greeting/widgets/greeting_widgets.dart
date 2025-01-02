part of '../view/greeting_view.dart';

class _Lottie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/congrats.json',
        width: AppDimens.iconExtraLarge,
      ),
    );
  }
}

class _CongratsHeader extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimens.marginMedium),
        child: Text(
          AppTexts.congratsPageTitle,
          style: const TextStyle(
            fontSize: AppDimens.fontExtraLarge,
            fontWeight: FontWeight.bold,
            color: AppColors.accentBlue900,
          ),
        ),
      ),
    );
  }
}

class _CongratsText extends StatelessWidget {
  const _CongratsText({required this.id, required this.waste});

  final int id;
  final int waste;

  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.marginMedium),
      child: Align(
        child: Text(
          '',
          //'${RecycleRepository().recycleItems[id].name} ${'congrats_title_one'.tr()} $waste ${'congrats_title_two'.tr()} ${RecycleRepository().recycleItems[id].carbonRatio} ${'congrats_title_three'.tr()} ${RecycleRepository().recycleItems[id].persentage} ${'congrats_title_four'.tr()}',
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: AppDimens.fontMedium,
            color: AppColors.accentBlue200,
          ),
        ),
      ),
    );
  }
}
