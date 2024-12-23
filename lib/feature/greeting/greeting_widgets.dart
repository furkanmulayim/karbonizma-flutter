part of 'greeting_view.dart';

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
          'congrats'.tr(),
          style: const TextStyle(
            fontSize: AppDimens.fontExtraLarge,
            fontWeight: FontWeight.bold,
            color: AppColors.textWhite,
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
          '${RecycleRepository().recycleItems[id].name} ${'congrats_title_one'.tr()} $waste ${'congrats_title_two'.tr()} ${RecycleRepository().recycleItems[id].carbonRatio} ${'congrats_title_three'.tr()} ${RecycleRepository().recycleItems[id].persentage} ${'congrats_title_four'.tr()}',
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: AppDimens.fontLarge,
            color: AppColors.textWhite,
          ),
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            context.go('/menu');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accentBlue100,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimens.borderRadius),
                topRight: Radius.circular(AppDimens.borderRadius),
                bottomLeft: Radius.circular(AppDimens.borderRadius),
                bottomRight: Radius.circular(AppDimens.borderRadius),
              ),
            ),
          ),
          child: Text(
            'home_button'.tr(),
            style: const TextStyle(
              color: AppColors.textWhite,
              fontWeight: FontWeight.bold,
              fontSize: AppDimens.fontMedium,
            ),
          ),
        ),
      ),
    );
  }
}
