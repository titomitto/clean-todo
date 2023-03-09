import 'package:flutter/material.dart';
import '../theme.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class GridViewSwitch extends StatelessWidget {
  final String? title;
  final bool isGridView;
  final VoidCallback onTapGrid, onTapList;
  const GridViewSwitch(
      {super.key,
      required this.isGridView,
      this.title,
      required this.onTapGrid,
      required this.onTapList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          title == null
              ? const SizedBox()
              : Text(title!, style: Theme.of(context).textTheme.labelLarge),
          const Spacer(),
          GestureDetector(
            onTap: onTapList,
            child: Container(
                width: 40,
                height: 40,
                alignment: AlignmentDirectional.center,
                decoration: !isGridView
                    ? kOutlinedContainerDecoration
                    : kPlainContainerDecoration,
                child: Icon(FeatherIcons.list,
                    size: 20, color: Theme.of(context).primaryColor)),
          ),
          GestureDetector(
            onTap: onTapGrid,
            child: Container(
                width: 40,
                height: 40,
                alignment: AlignmentDirectional.center,
                decoration: isGridView
                    ? kOutlinedContainerDecoration
                    : kPlainContainerDecoration,
                child: Icon(FeatherIcons.grid,
                    size: 18, color: Theme.of(context).primaryColor)),
          ),
        ],
      ),
    );
  }
}
