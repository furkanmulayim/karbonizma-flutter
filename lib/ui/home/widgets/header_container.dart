part of '../view/home_view.dart';

class _HeaderContainers extends StatelessWidget {
  const _HeaderContainers(
      {required this.co2, required this.eco, required this.re});

  final String co2;
  final String eco;
  final String re;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimens.paddingMedium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _NumericBox(
                  name: AppTexts.ecoPoint,
                  icon: AppTexts.ecoPointIcon,
                  data: eco,
                ),
              ),
              const SizedBox(width: AppDimens.paddingSmall),
              Expanded(
                child: _NumericBox(
                  name: AppTexts.savingPoint,
                  icon: AppTexts.savingPointIcon,
                  data: co2,
                ),
              ),
              const SizedBox(width: AppDimens.paddingSmall),
              Expanded(
                child: _NumericBox(
                  name: AppTexts.rePoint,
                  icon: AppTexts.rePointIcon,
                  data: re,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NumericBox extends StatelessWidget {
  const _NumericBox(
      {required this.name, required this.data, required this.icon});

  final String data;
  final String name;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimens.paddingMedium),
      padding: const EdgeInsets.all(AppDimens.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.accentBlue200,
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            width: AppDimens.iconXLarge,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(
                color: AppColors.accentBlue900,
                fontSize: AppDimens.fontsMedium),
          ),
          const SizedBox(height: 5),
          Text(
            data,
            style: const TextStyle(
              color: AppColors.accentBlue900,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
