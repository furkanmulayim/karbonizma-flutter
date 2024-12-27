part of '../view/home_view.dart';

class _LazyList extends StatelessWidget {
  //const _LazyList({required this.items});
  //final List<RecycleModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //itemCount: items.length,
      itemBuilder: (context, index) {
        //final item = items[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.accentBlue900,
            // child: Text((item.id + 1).toString()),
          ),
          // title: Text(item.name),
          onTap: () {
            //context.go('/recycle/${item.id}');
          },
        );
      },
    );
  }
}
