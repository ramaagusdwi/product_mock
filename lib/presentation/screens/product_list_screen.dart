import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testfokatech/common/navigation.dart';
import 'package:testfokatech/data/api_service.dart';
import 'package:testfokatech/models/custom_icon.dart';
import 'package:testfokatech/presentation/my_icon_icons.dart';
import 'package:testfokatech/presentation/screens/bottom_sheet_menu.dart';
import 'package:testfokatech/presentation/screens/menu_screen.dart';
import 'package:testfokatech/presentation/screens/product_section_view.dart';
import 'package:testfokatech/presentation/themes/themes.dart';
import 'package:testfokatech/presentation/themes/v_color.dart';
import 'package:testfokatech/presentation/widgets/icon_circle.dart';
import 'package:testfokatech/presentation/widgets/popover.dart';
import 'package:testfokatech/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:expandable/expandable.dart';

class ProductListScreen extends StatefulWidget {
  static const routeName = "/product";

  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late List<CustomIcon> listIcon;

  @override
  void initState() {
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   bottomSheetMenu(context);
    // });
    listIcon = [
      CustomIcon(iconData: MyIcon.live_tv, title: 'Live Show'),
      CustomIcon(iconData: MyIcon.cast_connected, title: 'Live Class'),
      CustomIcon(iconData: MyIcon.book_open, title: 'E-Course'),
      CustomIcon(iconData: MyIcon.settings_input_svideo, title: 'Community')
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColorDark,
          title: Center(
            child: Text(
              "List Product",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: .5),
              ),
            ),
          ),
        ),
        // body: _buildBottomNavBar(),
        body: Stack(
          children: [
            _buildContentWidget(),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildBottomNavBar(),
            )
          ],
        ));
  }

  Widget _buildBottomNavBar() {
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
  }

  Widget _buildContentWidget() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 24.0, top: 16, right: 24.0),
        child: ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(apiService: ApiService()),
          child: Consumer<ProductProvider>(builder: (context, state, _) {
            return state.state == ResultState.Loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.state == ResultState.hasError
                    ? Center(
                        child: Text(
                          state.message,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    : _buildList(state);
          }),
        ),
      ),
    );
  }

  Widget _buildList(ProductProvider state) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: const WaterDropHeader(
        waterDropColor: Colors.redAccent,
      ),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget? body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("release to load more");
          } else {
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: state.refreshController,
      onRefresh: state.onRefresh,
      onLoading: state.onLoading,
      child: GridView.count(
          primary: true,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          shrinkWrap: true,
          //list dalam bentuk grid yang memiliki 2 kolom
          children: [
            for (int i = 0; i < state.products.length; i++)
              InkWell(
                onTap: () => print("Tapped"),
                child: ProductSectionView(
                  data: state.products[i],
                ),
              )
          ]),
    );
  }
}
