// ignore_for_file: unused_element

part of 'recycle_view.dart';

class _LottieRecycle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/lottie/recycle.json',
        width: AppDimens.iconXXLarge,
      ),
    );
  }
}

class _CustomText extends StatelessWidget {
  const _CustomText({required this.id});

  final int id; // 1: Büyük, 2: Orta, 3: Küçük

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.paddingMedium),
      child: Text(
        RecycleRepository().recycleItems[id].explain,
        textAlign: TextAlign.justify,
        style: const TextStyle(fontSize: AppDimens.fontMedium),
      ),
    );
  }
}

class _PersentageText extends StatelessWidget {
  const _PersentageText({required this.tittle, required this.ratio});

  final String ratio;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: AppDimens.squareSmall,
        margin: const EdgeInsets.symmetric(horizontal: AppDimens.marginSmall),
        decoration: BoxDecoration(
          color: AppColors.accentBlue200,
          borderRadius: BorderRadius.circular(AppDimens.borderRadius),
        ),
        child: Center(
          child: Text(
            '$tittle $ratio',
            style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.accentBlue900),
          ),
        ),
      ),
    );
  }
}

class _PersentageTextRow extends StatelessWidget {
  const _PersentageTextRow({required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: _PersentageText(
            ratio: RecycleRepository().recycleItems[id].persentage,
            tittle: 'percentage'.tr(),
          ),
        ),
        Expanded(
          child: _PersentageText(
            ratio: RecycleRepository().recycleItems[id].carbonRatio.toString(),
            tittle: 'ratio'.tr(),
          ),
        ),
      ],
    );
  }
}

class _RoundedButtton extends StatelessWidget {
  const _RoundedButtton({
    Key? key,
    required this.icom,
    required this.onClick,
    this.backgroundColor = AppColors.greyLight,
    this.iconColor = AppColors.accentBlue100,
  }) : super(key: key);

  final Color backgroundColor;
  final IconData icom;
  final Color iconColor;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onClick,
      backgroundColor: backgroundColor,
      child: Icon(icom, color: iconColor),
    );
  }
}

class _WasteSize extends StatelessWidget {
  const _WasteSize({
    required this.stater,
    required this.increaseWasteGram,
    required this.decreaseWasteGram,
  });

  final VoidCallback decreaseWasteGram;
  final VoidCallback increaseWasteGram;
  final String stater;

  @override
  Widget build(Object context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _RoundedButtton(
          icom: Icons.remove,
          onClick: decreaseWasteGram,
        ),
        Row(
          children: [Text(stater), const Text(' KG')],
        ),
        _RoundedButtton(
          icom: Icons.add,
          onClick: increaseWasteGram,
        ),
      ],
    );
  }
}

class _RecycleButton extends StatelessWidget {
  const _RecycleButton({required this.id, required this.waste});

  final int id;
  final int waste;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            context.go('/greeting/$id/$waste');
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
            'recycle'.tr(),
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
