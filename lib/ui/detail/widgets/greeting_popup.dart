part of '../view/detail_view.dart';

class _ShowGreetingsDialog extends StatelessWidget {
  final String waste;
  final String name;

  const _ShowGreetingsDialog({
    Key? key,
    required this.waste,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _dialogContent(context),
          _dialogImage(),
        ],
      ),
    );
  }

  Widget _dialogContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 115),
          _dialogTitle(context),
          const SizedBox(height: 10),
          _dialogDescription(),
          const SizedBox(height: 16),
          _acceptButton(context),
        ],
      ),
    );
  }

  Widget _dialogTitle(BuildContext context) {
    return Flexible(
      child: SingleChildScrollView(
        child: Text(
          AppTexts.congratsPageTitle,
          style: const TextStyle(
            fontSize: AppDimens.fontExtraLarge,
            fontWeight: FontWeight.bold,
            color: AppColors.accentGreen100,
          ),
        ),
      ),
    );
  }

  Widget _dialogDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.marginMedium),
      child: Align(
        child: Text(
          '$waste ${AppTexts.detailWeight} $name ${AppTexts.congratsEnterTitle}',
          style: TextStyle(
            fontSize: AppDimens.fontMedium,
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _acceptButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: NormalButton(
            onClick: () {
              context.go('/');
            },
            text: AppTexts.congratsButtonTitle,
          ),
        ),
      ],
    );
  }

  Widget _dialogImage() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Lottie.asset(
        'assets/lottie/congrats.json',
        width: AppDimens.iconXXXLarge,
        height: AppDimens.iconXXXLarge,
      ),
    );
  }
}

void showGreetingPopup(BuildContext context, String waste, String name) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return _ShowGreetingsDialog(
        waste: waste,
        name: name,
      );
    },
  );
}
