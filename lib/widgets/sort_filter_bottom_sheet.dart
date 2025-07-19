import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class SortFilterBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sort & Filter',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Theme.of(context).colorScheme.onSurface),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(height: 20),
              
              // Sort Section
              Text(
                'Sort by:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 12),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return Column(
                    children: [
                      _buildSortOption(
                        context,
                        'None',
                        SortType.none,
                        productProvider.sortType == SortType.none,
                        (type) => productProvider.setSortType(type),
                      ),
                      _buildSortOption(
                        context,
                        'Price: Low to High',
                        SortType.priceLowToHigh,
                        productProvider.sortType == SortType.priceLowToHigh,
                        (type) => productProvider.setSortType(type),
                      ),
                      _buildSortOption(
                        context,
                        'Price: High to Low',
                        SortType.priceHighToLow,
                        productProvider.sortType == SortType.priceHighToLow,
                        (type) => productProvider.setSortType(type),
                      ),
                      _buildSortOption(
                        context,
                        'Rating',
                        SortType.rating,
                        productProvider.sortType == SortType.rating,
                        (type) => productProvider.setSortType(type),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 24),
              
              // Categories Section
              Text(
                'Categories:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 12),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: productProvider.categories.map((category) {
                      final isSelected = category == productProvider.selectedCategory;
                      return FilterChip(
                        label: Text(
                          category,
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        selected: isSelected,
                        onSelected: (selected) {
                          productProvider.setCategory(category);
                        },
                        elevation: isSelected ? 4 : 0,
                      );
                    }).toList(),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSortOption(
    BuildContext context,
    String title,
    SortType sortType,
    bool isSelected,
    Function(SortType) onTap,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isSelected ? Border.all(color: Theme.of(context).colorScheme.primary) : null,
      ),
      child: ListTile(
        leading: Radio<SortType>(
          value: sortType,
          groupValue: isSelected ? sortType : null,
          onChanged: (value) {
            if (value != null) {
              onTap(value);
              Navigator.pop(context);
            }
          },
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
          ),
        ),
        onTap: () {
          onTap(sortType);
          Navigator.pop(context);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
} 