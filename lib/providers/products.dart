// Class to provide access to objects throughout the application
// Using providers

import 'package:flutter/material.dart';
import 'product.dart';

//ChangeNotifier is part of inheritedWidget
class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: '001',
        title: 'Beans',
        description: 'A tin of beans',
        price: 0.80,
        imageURL:
            'https://c8.alamy.com/comp/d2x60x/tin-of-heinz-baked-beans-uk-d2x60x.jpg'),
    Product(
        id: '002',
        title: 'Coffee',
        description: 'A tin of coffee',
        price: 2.90,
        imageURL:
            'https://www.simplygreatcoffee.co.uk/shop/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/n/e/nescafe_granules_1.jpg'),
    Product(
        id: '003',
        title: 'Peas',
        description: 'A tin of peas',
        price: 0.50,
        imageURL:
            'http://gdfood.vn/uploaded/product/Green_Peas_tins_15oz425grs_1300038513_green_peas1.jpg'),
    Product(
        id: '004',
        title: 'Chocolate',
        description: 'A box of chocolate',
        price: 3.80,
        imageURL:
            'https://th.bing.com/th/id/OPE.4UJzduzzbJ5FBw300C300?w=160&h=150&rs=1&dpr=2.62&pid=21.1'),
  ];
  bool _showFavoritesOnly = false;

  List<Product> get items {
    if (_showFavoritesOnly) {
      return _items.where((prodItem) => prodItem.isFavorite).toList();
    }
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void showFavoritesOnly() {
    _showFavoritesOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoritesOnly = false;
    notifyListeners();
  }

  void addproduct() {
    // _items.add(value);
    notifyListeners();
  }
}
