part of '../view/detail_view.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({
    super.key,
    required this.imageUrl,
    required this.explain,
  });

  final String explain;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.paddingLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeightBox(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(AppDimens.borderLargeRadius),
                child: Image.network(
                  imageUrl,
                  width: AppDimens.iconXXXLarge,
                  height: AppDimens.iconXXXLarge * 3 / 2.5,
                  fit: BoxFit.cover,
                ),
              ),
              WidthBox(),
              Expanded(
                child: Text(
                  explain,
                  style: TextStyle(
                    fontSize: AppDimens.fontMedium,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
