part of '../view/detail_view.dart';

class HeaderContent extends StatelessWidget {
  const HeaderContent({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.explain,
  });

  final String explain;
  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          HeightBox(),
          HeightBox(),
          Row(
            children: [
              WidthBox(),
              // Fotoğraf
              Image.network(
                imageUrl,
                width: AppDimens.iconXXXLarge,
                height: AppDimens.iconXXXLarge,
                fit: BoxFit.cover,
              ),
              WidthBox(),

              // Metin
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // İsim
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: AppDimens.fontExtraLarge,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    HeightBox(),
                    // Açıklama
                    Text(
                      explain,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
