part of 'menu_view.dart';

class _Drawer extends StatelessWidget {
  @override
  Widget build(Object context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          child: Text(
            '',
            style: TextStyle(fontSize: AppDimens.fontLarge),
          ),
        ),
        ListTile(title: Text('settings'.tr()), onTap: () {}),
        ListTile(
          title: Text('quit'.tr()),
          onTap: () {
            exit(0);
          },
        ),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.eco,
        color: Colors.white,
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}

class _HeaderContainers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
      decoration: BoxDecoration(
        color: AppColors.accentBlue900,
        borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _NumericBox(name: 'eco_point'.tr()),
          WidthBox(),
          _NumericBox(name: 'saving_point'.tr()),
          WidthBox(),
          _NumericBox(name: 'recycle_point'.tr()),
        ],
      ),
    );
  }
}

class _NumericBox extends StatelessWidget {
  _NumericBox({required this.name});
  final String name;
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
          Text(
            name,
            style: const TextStyle(
                color: AppColors.accentBlue900, fontSize: AppDimens.fontMedium),
          ),
          const SizedBox(
            height: 3,
          ),
          const Text(
            '0',
            style: TextStyle(
              color: AppColors.accentBlue900,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconTextButton extends StatelessWidget {
  const _IconTextButton({
    required this.onPressed,
    required this.iconData,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(iconData, size: AppDimens.iconMedium),
        label: Text(
          text,
          style: const TextStyle(
            color: AppColors.textWhite,
            fontSize: AppDimens.fontMedium,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentBlue100,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDimens.borderRadius),
              topRight: Radius.circular(AppDimens.borderRadius),
              bottomLeft: Radius.circular(AppDimens.borderRadius),
              bottomRight: Radius.circular(AppDimens.borderRadius),
            ),
          ),
          minimumSize: const Size(120, 48),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.marginMedium,
            vertical: AppDimens.marginSmall,
          ),
        ),
      ),
    );
  }
}

class _DoubleButton extends StatelessWidget {
  const _DoubleButton({required this.menuBloc});
  final MenuBloc menuBloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _IconTextButton(
              onPressed: () {
                menuBloc.add(MenuRecycleButtonNavigateEvent());
              },
              iconData: Icons.recycling,
              text: 'recycle'.tr(),
            ),
          ),
          WidthBox(),
          Expanded(
            child: _IconTextButton(
              onPressed: () {
                print("History Butonu Tıklandı");
              },
              iconData: Icons.history,
              text: 'history'.tr(),
            ),
          ),
        ],
      ),
    );
  }
}

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
            backgroundColor: AppColors.accentBlue900,
            child: Text((item.id + 1).toString()),
          ),
          title: Text(item.name),
          onTap: () {
            context.go('/recycle/${item.id}');
          },
        );
      },
    );
  }
}
