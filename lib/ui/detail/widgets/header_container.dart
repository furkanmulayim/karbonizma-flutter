part of '../view/detail_view.dart';

class _CarbonContent extends StatelessWidget {
  const _CarbonContent({required this.persentage, required this.ratio});
  final int persentage;
  final int ratio;

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
                  data: persentage,
                ),
              ),
              const SizedBox(width: AppDimens.paddingSmall),
              Expanded(
                child: _NumericBox(
                  name: AppTexts.savingPoint,
                  data: ratio,
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
  const _NumericBox({
    required this.name,
    required this.data,
  });

  final int data;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppDimens.paddingMedium),
      padding: const EdgeInsets.all(AppDimens.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.greyxLight,
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
                fontSize: AppDimens.fontMedium),
          ),
          HeightBox(),
          _GaugeIndicator(value: data),
          HeightBox(h: AppDimens.paddingXSmall),
          Text(
            data.toString(),
            style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: AppDimens.fontxMedium),
          ),
        ],
      ),
    );
  }
}

class _GaugeIndicator extends StatelessWidget {
  const _GaugeIndicator({required this.value});
  final int value;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Center(
            child: SizedBox(
              width: 200,
              height: 50,
              child: AnimatedRadialGauge(
                duration: const Duration(seconds: 3),
                curve: Curves.elasticOut,
                radius: 100,
                value: value.toDouble(),
                axis: GaugeAxis(
                  /// Provide the [min] and [max] value for the [value] argument.
                  min: 0,
                  max: 100,

                  /// Render the gauge as a 180-degree arc.
                  degrees: 200,

                  /// Set the background color and axis thickness.
                  style: const GaugeAxisStyle(
                    thickness: 15,
                    background: AppColors.textWhite,
                  ),

                  /// Define the pointer that will indicate the progress (optional).
                  pointer: GaugePointer.needle(
                    borderRadius: 12,
                    width: 13,
                    height: 17,
                    color: AppColors.accentGreen100,
                  ),

                  /// Define the progress bar (optional).
                  progressBar: const GaugeProgressBar.rounded(
                    color: AppColors.accentGreen100,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
