import 'package:flutter/material.dart';
import '../../utils/size_util.dart';
import 'boldtext.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final String? title;
  final bool? centerTitle;
  final Color? titleColor;
  final double? titleSize;
  final Widget? leading;
  final double? height;
  final double? elevation;
  final double? leadingWidth;
  final List<Widget>? actions;

  CustomAppBar(
      {Key? key,
      this.actions,
      this.titleColor,
      this.backgroundColor = Colors.white,
      this.title,
      this.centerTitle = true,
      this.leading,
      this.height,
      this.titleSize = 15,
      this.elevation = 0,
      this.leadingWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      leadingWidth: leadingWidth ?? 50,
      actions: actions,
      toolbarHeight: height ?? getHorizontalSize(56),
      backgroundColor: backgroundColor,
      title: BoldText(
          text: title ?? '',
          size: getFontSize(titleSize!),
          color: titleColor,
          lines: 1),
      elevation: elevation,
      centerTitle: centerTitle,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => Size(
        const MediaQueryData().size.width,
        height ?? getHorizontalSize(56),
      );
}
