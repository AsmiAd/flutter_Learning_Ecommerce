import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_detail_page.dart';

class FavouritesPage extends StatefulWidget {
  final List<Product> favouriteProducts;
  const FavouritesPage({super.key, required this.favouriteProducts});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    final favs = widget.favouriteProducts;
    return Scaffold(
      appBar: AppBar(title: const Text('Favourites'), backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 0),
      body: favs.isEmpty
          ? const Center(child: Text('No favourite products found'))
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.68, mainAxisSpacing: 12, crossAxisSpacing: 12),
              itemCount: favs.length,
              itemBuilder: (context, i) {
                final p = favs[i];
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(product: p))).then((_) => setState(() {})),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Expanded(child: Image.network(p.productImage, width: double.infinity, fit: BoxFit.cover)),
                      const SizedBox(height: 8),
                      Text(p.productName, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('£${p.price}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                    ]),
                  ),
                );
              },
            ),
    );
  }
}
