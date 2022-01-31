import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testfokatech/common/navigation.dart';
import 'package:testfokatech/models/custom_icon.dart';
import 'package:testfokatech/presentation/my_icon_icons.dart';
import 'package:testfokatech/presentation/screens/menu_screen.dart';
import 'package:testfokatech/presentation/themes/themes.dart';
import 'package:testfokatech/presentation/themes/v_color.dart';
import 'package:testfokatech/presentation/widgets/icon_circle.dart';
import 'package:testfokatech/presentation/widgets/popover.dart';

bottomSheetMenu(BuildContext context) {
  List<CustomIcon> listIcon = [
    CustomIcon(iconData: MyIcon.live_tv, title: 'Live Show'),
    CustomIcon(iconData: MyIcon.cast_connected, title: 'Live Class'),
    CustomIcon(iconData: MyIcon.book_open, title: 'E-Course'),
    CustomIcon(iconData: MyIcon.settings_input_svideo, title: 'Community')
  ];
  showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      barrierColor: Colors.white.withOpacity(0),
      isDismissible: false,
      builder: (context) {
        return InkWell(
          onTap: () => Navigation.intentWithData(MenuScreen.routeName, {}),
          child: Container(
            child: Popover(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 0; i < listIcon.length; i++)
                      Column(
                        children: [
                          IconBackgroundCircle(
                            circleColor: primaryColorDark,
                            iconColor: VColor.white,
                            iconData: listIcon[i].iconData,
                            dx: 15.0,
                            dy: 15.0,
                            size: 26,
                            radius: 23.0,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            listIcon[i].title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
