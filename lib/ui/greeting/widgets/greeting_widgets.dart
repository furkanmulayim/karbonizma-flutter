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
            color: AppColors.accentBlue100,
          ),
        ),
      ),
    );
  }
}

class _CongratsText extends StatelessWidget {
  const _CongratsText({required this.name, required this.waste});

  final String name;
  final int waste;

  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.marginMedium),
      child: Align(
        child: Text(
          '${waste.toString()}${AppTexts.detailWeight} ${name} ${AppTexts.congratsEnterTitle}',
          style: TextStyle(
            fontSize: AppDimens.fontMedium,
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
