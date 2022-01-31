import 'package:flutter/material.dart';
import 'package:testfokatech/models/custom_icon.dart';
import 'package:testfokatech/presentation/my_icon_icons.dart';
import 'package:testfokatech/presentation/themes/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testfokatech/presentation/themes/v_color.dart';
import 'package:testfokatech/presentation/widgets/icon_circle.dart';

import '../my_flutter_app_icons.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = "/menu";

  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late List<CustomIcon> listIcon;

  @override
  void initState() {
    super.initState();
    listIcon = [
      CustomIcon(
          iconData: MyIcon.live_tv,
          title: 'Live Show',
          bgColor: primaryColorDark),
      CustomIcon(
          iconData: MyIcon.cast_connected,
          title: 'Live Class',
          bgColor: primaryColorDark),
      CustomIcon(
          iconData: MyIcon.book_open,
          title: 'E-Course',
          bgColor: primaryColorDark),
      CustomIcon(
          iconData: MyIcon.settings_input_svideo,
          title: 'Community',
          bgColor: primaryColorDark),
      CustomIcon(
          iconData: MyIcon.user, title: 'Live Show', bgColor: VColor.blueh),
      CustomIcon(
          iconData: MyIcon.save, title: 'Live Class', bgColor: VColor.blueh),
      CustomIcon(
          iconData: MyIcon.play_circle2,
          title: 'E-Course',
          bgColor: VColor.blueh),
      CustomIcon(
          iconData: MyIcon.th_list, title: 'Community', bgColor: VColor.blueh),
      CustomIcon(
          iconData: MyIcon.shopping_cart,
          title: 'Live Class',
          bgColor: VColor.yellowGreen),
      CustomIcon(
          iconData: MyIcon.history,
          title: 'E-Course',
          bgColor: VColor.yellowGreen),
      CustomIcon(
          iconData: MyIcon.store, title: 'Community', bgColor: VColor.grey5)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PreferredSize(
            preferredSize: const Size.fromHeight(120.0),
            // here the desired height
            child: AppBar(
              centerTitle: false, // this is all you need
              automaticallyImplyLeading: true,
              backgroundColor: primaryColorDark,
              title: Text(
                "Back",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.85,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    height: MediaQuery.of(context).size.height * 0.9,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Features",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          ),
                        ),
                        Expanded(
                          child: GridView.count(
                              primary: false,
                              crossAxisSpacing: 0,
                              //memberi spasi vetikal
                              mainAxisSpacing: 0,
                              //memberi spasi horizontal
                              crossAxisCount: 4,
                              //list dalam bentuk grid yang memiliki 4 kolom
                              children: [
                                for (int i = 0; i < listIcon.length; i++)
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconBackgroundCircle(
                                        circleColor: listIcon[i].bgColor,
                                        iconColor: VColor.white,
                                        iconData: listIcon[i].iconData,
                                        dx: 14.0, //peletakan posisi berdasarkan sumbu x
                                        dy: 12.0,//peletakan posisi berdasarkan sumbu y
                                        size: 24,
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
                              ]),
                        ),
                      ],
                    ));
              },
            ),
          ),
        ],
      ),
    );
    // );
  }
}
