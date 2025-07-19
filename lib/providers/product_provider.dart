import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

enum SortType { none, priceLowToHigh, priceHighToLow, rating }

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = false;
  String _error = '';
  String _selectedCategory = 'all';
  SortType _sortType = SortType.none;
  List<String> _categories = [];

  List<Product> get products => _filteredProducts;
  bool get isLoading => _isLoading;
  String get error => _error;
  String get selectedCategory => _selectedCategory;
  SortType get sortType => _sortType;
  List<String> get categories => _categories;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _products = data.map((json) => Product.fromJson(json)).toList();
        
        // Extract unique categories
        _categories = ['all', ..._products.map((p) => p.category).toSet().toList()];
        
        _applyFilters();
      } else {
        _error = 'Failed to load products';
      }
    } catch (e) {
      _error = 'Network error: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    _applyFilters();
  }

  void setSortType(SortType sortType) {
    _sortType = sortType;
    _applyFilters();
  }

  void _applyFilters() {
    _filteredProducts = List.from(_products);

    // Apply category filter
    if (_selectedCategory != 'all') {
      _filteredProducts = _filteredProducts
          .where((product) => product.category == _selectedCategory)
          .toList();
    }

    // Apply sorting
    switch (_sortType) {
      case SortType.priceLowToHigh:
        _filteredProducts.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SortType.priceHighToLow:
        _filteredProducts.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SortType.rating:
        _filteredProducts.sort((a, b) => b.rating.rate.compareTo(a.rating.rate));
        break;
      case SortType.none:
        break;
    }

    notifyListeners();
  }
} 