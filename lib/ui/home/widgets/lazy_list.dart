part of '../view/home_view.dart';

class _LazyList extends StatelessWidget {
  const _LazyList({required this.items});

  final List<RecycleModel> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimens.paddingMedium,
        horizontal: AppDimens.paddingMedium,
      ),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              context.go('/detail/${item.id}'); // Git yönlendirme
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.transparent, // Tıklama alanını genişletmek için
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                        Radius.circular(AppDimens.borderRadius)),
                    child: Image.network(
                      item.image,
                      height: AppDimens.iconXXLarge,
                      width: AppDimens.iconXXLarge, // Genişlik eklenebilir
                      fit: BoxFit.cover,
                    ),
                  ),
                  WidthBox(),
                  Expanded(
                    child: Text(
                      item.name,
                      style: TextStyle(
                        fontSize: AppDimens.fontMedium,
                        fontWeight: FontWeight.w500,
                        color: AppColors.accentGreen300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
