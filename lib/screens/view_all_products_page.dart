import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../widgets/product_card.dart';
import 'product_detail_page.dart';
import '../models/product.dart';

class ViewAllProductsPage extends StatefulWidget {
  const ViewAllProductsPage({super.key});
  @override
  State<ViewAllProductsPage> createState() => _ViewAllProductsPageState();
}

class _ViewAllProductsPageState extends State<ViewAllProductsPage> {
  String selectedFilter = 'All Products';
  List<Product> filteredProducts = [];
  final searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = List.from(allproducts);
  }

  void applyFilter(String filter) {
    setState(() {
      selectedFilter = filter;
      if (filter == 'Low to High') {
        filteredProducts.sort((a, b) => a.price.compareTo(b.price));
      } else if (filter == 'High to Low') {
        filteredProducts.sort((a, b) => b.price.compareTo(a.price));
      } else {
        filteredProducts = List.from(allproducts);
      }
      _applySearch(searchCtrl.text);
    });
  }

  void _applySearch(String q) {
    final text = q.trim().toLowerCase();
    setState(() {
      if (text.isEmpty) {
        if (selectedFilter == 'Low to High') {
          filteredProducts = List.from(allproducts)..sort((a, b) => a.price.compareTo(b.price));
        } else if (selectedFilter == 'High to Low') {
          filteredProducts = List.from(allproducts)..sort((a, b) => b.price.compareTo(a.price));
        } else {
          filteredProducts = List.from(allproducts);
        }
      } else {
        filteredProducts = allproducts.where((p) => p.productName.toLowerCase().contains(text)).toList();
        if (selectedFilter == 'Low to High') filteredProducts.sort((a, b) => a.price.compareTo(b.price));
        if (selectedFilter == 'High to Low') filteredProducts.sort((a, b) => b.price.compareTo(a.price));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 46,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: searchCtrl,
                            decoration: const InputDecoration(
                              hintText: 'Search products...',
                              border: InputBorder.none,
                            ),
                            onChanged: _applySearch,
                          ),
                        ),
                        if (searchCtrl.text.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.clear, color: Colors.grey),
                            onPressed: () {
                              searchCtrl.clear();
                              _applySearch('');
                            },
                          ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: selectedFilter,
                    items: const [
                      DropdownMenuItem(value: 'All Products', child: Text('All')),
                      DropdownMenuItem(value: 'Low to High', child: Text('Low → High')),
                      DropdownMenuItem(value: 'High to Low', child: Text('High → Low')),
                    ],
                    onChanged: (v) => applyFilter(v ?? 'All Products'),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, i) {
                final p = filteredProducts[i];
                return ProductCard(
                  product: p,
                  trailing: IconButton(
                    icon: Icon(p.isFavourite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        p.isFavourite = !p.isFavourite;
                        if (p.isFavourite) {
                          if (!favouriteProducts.any((x) => x.id == p.id)) favouriteProducts.add(p);
                        } else {
                          favouriteProducts.removeWhere((x) => x.id == p.id);
                        }
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(product: p))).then((_) => setState(() {}));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
