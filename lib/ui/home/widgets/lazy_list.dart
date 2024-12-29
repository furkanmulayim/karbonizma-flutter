part of '../view/home_view.dart';

class _LazyList extends StatelessWidget {
  const _LazyList({required this.items});

  final List<RecycleModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.accentBlue100,
            child: Text(
              (item.id + 1).toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppDimens.fontLarge,
                color: AppColors.textWhite,
              ),
            ),
          ),
          title: Text(
            item.name,
            style: TextStyle(
              fontSize: AppDimens.fontMedium,
              color: AppColors.accentBlue1000,
            ),
          ),
          onTap: () {
            context.go('/detail/${item.id}');
          },
        );
      },
    );
  }
}
