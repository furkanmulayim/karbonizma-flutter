part of '../view/detail_view.dart';

class _WasteWeight extends StatelessWidget {
  const _WasteWeight({
    required this.stater,
    required this.increaseWasteGram,
    required this.decreaseWasteGram,
  });

  final VoidCallback decreaseWasteGram;
  final VoidCallback increaseWasteGram;
  final String stater;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppDimens.paddingXLarge,
          horizontal: AppDimens.paddingMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _RoundedButtton(
            icom: Icons.remove,
            onClick: decreaseWasteGram,
          ),
          Row(
            children: [
              _WeightText(text: stater),
              _WeightText(text: AppTexts.detailWeight),
            ],
          ),
          _RoundedButtton(
            icom: Icons.add,
            onClick: increaseWasteGram,
          ),
        ],
      ),
    );
  }
}

class _WeightText extends StatelessWidget {
  const _WeightText({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontSize: AppDimens.fontExtraLarge,
            fontWeight: FontWeight.bold,
            color: AppColors.accentGreen900));
  }
}

class _RoundedButtton extends StatelessWidget {
  const _RoundedButtton({
    required this.icom,
    required this.onClick,
  });

  final IconData icom;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: FloatingActionButton(
        onPressed: onClick,
        backgroundColor: AppColors.accentGreen100,
        shape: CircleBorder(),
        child: Icon(icom, color: AppColors.textWhite),
      ),
    );
  }
}
