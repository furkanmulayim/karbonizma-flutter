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
                  height: AppDimens.iconXXXLarge,
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
