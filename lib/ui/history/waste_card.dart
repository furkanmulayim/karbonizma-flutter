part of '../history/history_view.dart';

class _WasteCard extends StatelessWidget {
  const _WasteCard({required this.item});

  final HistoryModel item;

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
              color: AppColors.accentBlue100,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(AppDimens.borderLargeRadius),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                '${item.id} KG',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: AppDimens.fontMedium,
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
            '12 Haziran 2025',
            style: const TextStyle(
              fontSize: AppDimens.fontsMedium,
              color: AppColors.accentBlue300,
            ),
          ),
          Text(
            item.name,
            style: const TextStyle(
                fontSize: AppDimens.fontLarge,
                fontWeight: FontWeight.w500,
                color: AppColors.accentBlue300),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildInfoBox(Icons.attach_money, '+${item.topCo2Points.toString()}'),
        WidthBox(w: AppDimens.paddingSmall),
        _buildInfoBox(Icons.eco, '%${item.topCo2Points.toString()}'),
      ],
    );
  }

  Widget _buildInfoBox(IconData icon, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingSmall,
          vertical: AppDimens.paddingXSmall),
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
            color: AppColors.accentBlue100,
          ),
          HeightBox(h: AppDimens.marginxSmall),
          Text(
            value,
            style: const TextStyle(
              fontSize: AppDimens.fontMedium,
              fontWeight: FontWeight.bold,
              color: AppColors.accentBlue100,
            ),
          ),
        ],
      ),
    );
  }

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
                  // Silme işlemini burada yapabilirsiniz
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
}
