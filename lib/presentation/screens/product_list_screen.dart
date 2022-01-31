import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testfokatech/data/api_service.dart';
import 'package:testfokatech/presentation/screens/product_section_view.dart';
import 'package:testfokatech/presentation/themes/themes.dart';
import 'package:testfokatech/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductListScreen extends StatelessWidget {
  static const routeName = "/product";

  const ProductListScreen({Key? key}) : super(key: key);

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
        body: _buildContentWidget());
  }

  Widget _buildContentWidget() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 24.0, top: 16, right: 24.0),
        child: ChangeNotifierProvider<ProductProvider>(
          create: (_) => ProductProvider(apiService: ApiService()),
          child: Consumer<ProductProvider>(builder: (context, state, _) {
            return Column(
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
}
