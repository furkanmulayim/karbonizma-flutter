part of '../view/history_view.dart';

class _WasteCard extends StatelessWidget {
  const _WasteCard({required this.item});

  final HistoryModel item;
 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingMedium,
        vertical: AppDimens.paddingXSmall,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.textWhite,
          borderRadius: BorderRadius.circular(AppDimens.borderXLargeRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyxLight,
              blurRadius: AppDimens.borderRadius,
              offset: const Offset(AppDimens.zeroc, AppDimens.cardElevation),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildImageAndWeight(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextsAndMenu(),
                  HeightBox(h: AppDimens.marginSmall),
                  _buildInfoRow(),
                ],
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 22,
                  color: AppColors.greyLight,
                ),
                onPressed: () {
                  print("Silme işlemi tetiklendi");
                },
              ),
              HeightBox(h: AppDimens.iconXsXLarge),
            ]),
          ],
        ),
      ),
    );
  }
  
  Widget _buildImageAndWeight() {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.borderLargeRadius),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppDimens.borderLargeRadius),
            ),
            child: Image.network(
              item.image,
              height: AppDimens.iconXsXLarge,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: AppDimens.iconXsXLarge,
            decoration: BoxDecoration(
              color: AppColors.accentGreen100,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(AppDimens.borderLargeRadius),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                '${item.kg} KG',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: AppDimens.fontSmall,
                  color: AppColors.textWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextsAndMenu() {
    return Padding(
      padding: const EdgeInsets.only(right: AppDimens.marginSmall),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.date,
            style: const TextStyle(
              fontSize: AppDimens.fontsMedium,
              color: AppColors.accentGreen300,
            ),
          ),
          Text(
            item.name,
            style: const TextStyle(
                fontSize: AppDimens.fontMedium,
                fontWeight: FontWeight.w500,
                color: AppColors.accentGreen300),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildInfoBox(Icons.attach_money, '+${item.topEcoPoints}'),
        WidthBox(w: AppDimens.paddingSmall),
        _buildInfoBox(Icons.eco, '%${item.topCo2Points.toString()}'),
      ],
    );
  }

  Widget _buildInfoBox(IconData icon, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingXSmall,
          vertical: AppDimens.paddingXXSmall),
      decoration: BoxDecoration(
        color: AppColors.accentGreenBackground,
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: AppDimens.iconMedium,
            color: AppColors.accentGreen100,
          ),
          HeightBox(h: AppDimens.marginxSmall),
          Text(
            value,
            style: const TextStyle(
              fontSize: AppDimens.fontSmall,
              fontWeight: FontWeight.bold,
              color: AppColors.accentGreen100,
            ),
          ),
        ],
      ),
    );
  }

 
}
