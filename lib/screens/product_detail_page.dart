import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/product.dart';
import '../data/product_data.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  late PageController _pageController;
  int _currentIndex = 0;
  int quantity = 1;

  final currency = NumberFormat.currency(symbol: '£');

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    setState(() {
      widget.product.isFavourite = !widget.product.isFavourite;

      if (widget.product.isFavourite) {
        if (!favouriteProducts.any((p) => p.id == widget.product.id)) {
          favouriteProducts.add(widget.product);
        }
      } else {
        favouriteProducts.removeWhere((p) => p.id == widget.product.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.product;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _circleButton(Icons.arrow_back, () {
                      Navigator.pop(context);
                    }),
                    Row(
                      children: [
                        _circleButton(
                          p.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          _toggleFavorite,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 10),
                        _circleButton(Icons.share, () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 380,
              child: PageView.builder(
                controller: _pageController,
                itemCount: p.displayImages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.network(
                    p.displayImages[index],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Icon(Icons.broken_image, size: 50));
                    },
                  );
                },
              ),
            ),

            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(p.displayImages.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentIndex == index ? 10 : 8,
                      height: _currentIndex == index ? 10 : 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  );
                }),
              ),
            ),

            Positioned(
              top: 340,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.productName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _infoChip(Icons.star, p.rating.toString()),
                          _infoChip(Icons.thumb_up, '${p.totalLikes}%'),
                          _infoChip(
                            Icons.chat_bubble_outline,
                            '${p.totalReviews}',
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              currency.format(p.price),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "from £${p.monthlyPrice} per month",
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            Icon(
                              Icons.info_outline,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        p.description,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffB8F30B),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            CartManager.addToCart(p, quantity);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Added to cart")),
                            );
                          },
                          child: const Text(
                            'Add to cart',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Center(
                        child: Text(
                          "Delivery on ${p.deliveryDate}",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),

                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(
    IconData icon,
    VoidCallback onTap, {
    Color color = Colors.black,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onTap,
      ),
    );
  }

  Widget _infoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.green),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class CartItem {
  final Product product;
  int qty;
  CartItem({required this.product, required this.qty});
}

class CartManager {
  static final List<CartItem> _items = [];

  static List<CartItem> get items => _items;

  static void addToCart(Product p, int qty) {
    final index = _items.indexWhere((c) => c.product.id == p.id);
    if (index >= 0) {
      _items[index].qty += qty;
    } else {
      _items.add(CartItem(product: p, qty: qty));
    }
  }

  static void removeFromCart(Product p) {
    _items.removeWhere((c) => c.product.id == p.id);
  }

  static double total() {
    return _items.fold(0.0, (sum, c) => sum + c.product.price * c.qty);
  }
}
