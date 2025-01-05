part of '../view/greeting_view.dart';

class _ButtonsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SecondaryButton(
              onClick: () {
                context.go('/history');
              },
              text: AppTexts.congrataHistoryPageButton,
            ),
          ),
          Expanded(
            child: NormalButton(
              onClick: () {
                context.go('/');
              },
              text: AppTexts.congratsButtonTitle,
            ),
          ),
        ],
      ),
    );
  }
}
