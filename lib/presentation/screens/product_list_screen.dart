import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testfokatech/data/api_service.dart';
import 'package:testfokatech/presentation/screens/bottom_sheet_menu.dart';
import 'package:testfokatech/presentation/screens/product_section_view.dart';
import 'package:testfokatech/presentation/themes/themes.dart';
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

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      bottomSheetMenu(context);
    });
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
        body: Stack(
          children: [
            _buildContentWidget(),
            // DraggableScrollableSheet(
            //   initialChildSize: 0.3,
            //   minChildSize: 0.1,
            //   maxChildSize: 0.8,
            //   builder:
            //       (BuildContext context, ScrollController scrollController) {
            //     // return Container(
            //     //   color: Colors.white,
            //     //   child: ListView.builder(
            //     //       controller: scrollController,
            //     //       itemCount: 20,
            //     //       itemBuilder: (BuildContext context, int index) {
            //     //         return ListTile(
            //     //           title: Text('Item $index'),
            //     //         );
            //     //       }),
            //     // );
            //     return ExpandableNotifier(
            //       // <-- Provides ExpandableController to its children
            //
            //       child: Column(
            //         children: [
            //           Expandable(
            //             // <-- Driven by ExpandableController from ExpandableNotifier // <-- Expands when tapped on the cover photo
            //             expanded: Column(children: [
            //               containerRound(),
            //               containerRound(),
            //               containerRound(),
            //               containerRound(),
            //               ExpandableButton(
            //                 // <-- Collapses when tapped on
            //                 child: Text("Back"),
            //               ),
            //             ]),
            //             collapsed: ExpandableButton(
            //               theme: ExpandableThemeData(
            //                   alignment: Alignment.bottomCenter),
            //               child: Container(
            //                 child: containerRound(),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //     //
            //     //  return ExpandablePanel(
            //     //   header: Text(article.title),
            //     //   collapsed: Text(article.body, softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
            //     //   expanded: Text(article.body, softWrap: true, ),
            //     //   tapHeaderToExpand: true,
            //     //   hasIcon: true,
            //     // );
            //   },
            // )
          ],
        ));
  }

  Widget _buildContentWidget() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 24.0, top: 16, right: 24.0),
        child: ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(apiService: ApiService()),
          child: Consumer<ProductProvider>(builder: (context, state, _) {
            return state.state == ResultState.Loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildList(state)),
                    ],
                  );
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
          primary: false,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          //list dalam bentuk grid yang memiliki 2 kolom
          children: [
            for (int i = 0; i < state.products.length; i++)
              ProductSectionView(
                data: state.products[i],
              )
          ]),
    );
  }

  Widget containerRound() {
    return new Container(
      height: 50.0,
      color: Colors.transparent,
      child: new Container(
          decoration: new BoxDecoration(
              color: Colors.green,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0),
              )),
          child: new Center(
            child: new Text("Hi modal sheet"),
          )),
    );
  }
}
