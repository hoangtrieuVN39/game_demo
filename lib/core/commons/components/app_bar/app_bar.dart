import 'dart:io' show Platform;
import 'package:app/core/constants.dart';
import 'package:app/core/utils.dart';
import 'package:flutter/material.dart';

import '../../../commons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.rightImage,
    this.isIconBack = true,
    this.textLeft,
    this.textRight,
    this.iconColor,
    this.textLeftColor,
    this.textRightColor,
    this.titleColor,
    this.onTapTextLeftPressed,
    this.onTapTextRightPressed,
    this.navigation,
    this.backgroundColor,
  }) : super(key: key);

  final String? title;
  final Icon? rightImage;
  final bool isIconBack;
  final String? textLeft;
  final String? textRight;
  final Color? iconColor;
  final Color? textLeftColor;
  final Color? textRightColor;
  final Color? titleColor;
  final VoidCallback? onTapTextLeftPressed;
  final VoidCallback? onTapTextRightPressed;
  final AppNavigation? navigation;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            //Icon left app bar
            if (isIconBack)
              SizedBox(
                width: 18,
                height: 24,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Icon(
                    Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                    color: iconColor ??
                        Theme.of(context).colorScheme.mainAppBarCustom,
                  ),
                  onPressed: () => navigation?.pop(),
                  padding: EdgeInsets.zero,
                  iconSize: 24,
                ),
              ),
            //Text left app bar
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: onTapTextLeftPressed,
              child: Container(
                width: 62,
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  textLeft ?? TextConstants.backButtonText,
                  style: TextStyle(
                    fontSize: 16,
                    color: textLeftColor ??
                        Theme.of(context).colorScheme.mainAppBarCustom,
                    fontWeight: FontWeight.w300,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ]),
          //Title app bar
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title ?? '',
                style: TextStyle(
                  fontSize: 17,
                  color: titleColor ?? Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
          //Title right app bar
          InkWell(
            onTap: onTapTextRightPressed,
            child: SizedBox(
              width: rightImage != null ? 16 : 80,
              child: rightImage != null
                  ? rightImage!
                  : Text(
                      textRight ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        color: textRightColor ??
                            Theme.of(context).colorScheme.mainAppBarCustom,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}