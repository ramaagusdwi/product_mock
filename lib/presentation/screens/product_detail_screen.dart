import 'package:flutter/material.dart';
import 'package:testfokatech/common/currency_format.dart';
import 'package:testfokatech/models/product.dart';
import 'package:testfokatech/presentation/themes/themes.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product_detail";

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product data = ModalRoute.of(context)?.settings.arguments
        as Product; // menerima argument/data yang dikirim dari product section view

    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: buildImageCover(data)),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      data.name,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 14,
                            color: greyFontColorDark,
                            fontWeight: FontWeight.w500,
                            letterSpacing: .5),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(data.price, 2),
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: blackFontColorDark)),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Divider(
                      height: 5,
                      thickness: 1,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    Text(
                      "Description",
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: blackFontColorDark)),
                    ),
                    Flexible(
                      child: Text(
                        data.desc,
                        overflow: TextOverflow.visible,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: greyFontColor)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildImageCover(Product data) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: DecorationImage(
          image: NetworkImage(data.cover!),
          fit: BoxFit.fill,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(0.0)),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: primaryColorDark,
      title: Center(
        child: Text(
          "Detail Product",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: .5),
          ),
        ),
      ),
    );
  }
}
