import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testfokatech/common/navigation.dart';
import 'package:testfokatech/models/product.dart';
import 'package:testfokatech/presentation/screens/product_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testfokatech/presentation/themes/themes.dart';

class ProductSectionView extends StatelessWidget {
  late Product data;

  ProductSectionView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("cekDataItem $data");
    return GestureDetector(
      onTap: () {
        log("cekTapDataItem $data");
        Navigation.intentWithData(
            ProductDetailScreen.routeName, data); //pindah ke halaman detail
      },
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width *
              0.35, //width based on 35 percent from size device / phone
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  // fit: StackFit.expand,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          child: (data.cover != null)
                              ? CachedNetworkImage(
                                  imageUrl: data.cover!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      // shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) {
                                    log(url.toString());
                                    return Icon(Icons.error);
                                  },
                                )
                              : Container(),
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 164,
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(14.0),
                      bottomRight: Radius.circular(14.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data.name}",
                        style: GoogleFonts.poppins(
                          textStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12,
                                color: greyFontColorDark,
                                fontWeight: FontWeight.normal,
                                letterSpacing: .5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "${data.price}",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: blackFontColorDark),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildTambahButton() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber[800]!,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Icon(
        Icons.add,
        color: Colors.white,
        size: 30.0,
      ),
    );
  }
}
