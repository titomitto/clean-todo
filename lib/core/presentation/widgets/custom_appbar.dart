import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final IconData? trailingIcon;
  final VoidCallback onTap;

  const CustomAppBar(
      {super.key, this.title, this.trailingIcon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: onTap,
              child: Icon(FeatherIcons.chevronLeft,
                  color: Theme.of(context).primaryColor)),
          const SizedBox(width: 10),
          Expanded(
              child: Text(title ?? "",
                  style: Theme.of(context).textTheme.headline6)),
          if (trailingIcon != null)
            Icon(trailingIcon, color: Theme.of(context).primaryColor)
        ],
      ),
    );
  }
}
