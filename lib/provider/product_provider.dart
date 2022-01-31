import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:testfokatech/data/api_service.dart';
import 'package:testfokatech/models/product.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum ResultState { hasData, Loading, hasError, NoData }

class ProductProvider extends ChangeNotifier {
  final ApiService apiService;
  late RefreshController refreshController;

  ProductProvider({required this.apiService}) {
    fetchAllProduct();
    refreshController = RefreshController(initialRefresh: false);
  }

  late ResultState _resultState;
  late List<Product> products;

  String _message = "";

  List<Product> get dataRestaurants => products;

  ResultState get state => _resultState;

  String get message => _message;

  Future<dynamic> fetchAllProduct() async {
    try {
      _resultState = ResultState.Loading;
      notifyListeners();

      final listProduct = await apiService.listProduct();

      if (listProduct.isNotEmpty) {
        _resultState = ResultState.hasData;
        notifyListeners();

        return products = listProduct; //mengembalikan list produk dari server

      } else {
        _resultState = ResultState.NoData;
        notifyListeners();
        return _message = "Empty Data";
      }
    } catch (e) {
      _resultState = ResultState.hasError;
      notifyListeners();

      if (e is SocketException) {
        print("Socket exception: ${e.toString()}");
        return _message = 'Check your internet connection';
      } else if (e is TimeoutException) {
        print("Timeout exception: ${e.toString()}");
      } else
        print("Unhandled exception: ${e.toString()}");
      return _message = 'Unknwon Error Occured';
    }
  }

  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    fetchAllProduct();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    fetchAllProduct();
    notifyListeners();
  }
}
