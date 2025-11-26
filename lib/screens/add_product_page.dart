import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/product_data.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final prevPriceCtrl = TextEditingController();
  final mainImgCtrl = TextEditingController();
  final addImgCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();

  List<String> displayImgs = [];

  void addImage() {
    final v = addImgCtrl.text.trim();
    if (v.isEmpty) return;
    setState(() {
      displayImgs.add(v);
      addImgCtrl.clear();
    });
  }

  void submit() {
    if (!_formKey.currentState!.validate()) return;
    final newId =
        (allproducts.isEmpty
            ? 0
            : allproducts.map((p) => p.id).reduce((a, b) => a > b ? a : b)) +
        1;
    final p = Product(
      id: newId,
      productName: nameCtrl.text.trim(),
      price: double.tryParse(priceCtrl.text.trim()) ?? 0.0,
      previousPrice: double.tryParse(prevPriceCtrl.text.trim()) ?? 0.0,

      isFavourite: false,
      rating: 4.5,
      totalLikes: 0,
      totalReviews: 0,
      monthlyPrice: (double.tryParse(priceCtrl.text.trim()) ?? 0.0) / 12,
      deliveryDate: 'Within 3 days',

      description: descriptionCtrl.text.trim(),

      productImage: mainImgCtrl.text.trim().isEmpty
          ? 'https://picsum.photos/200'
          : mainImgCtrl.text.trim(),

      productCreatedAt: DateTime.now().toIso8601String(),

      displayImages: displayImgs.isEmpty
          ? [
              mainImgCtrl.text.trim().isEmpty
                  ? 'https://picsum.photos/200'
                  : mainImgCtrl.text.trim(),
            ]
          : List.from(displayImgs),
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Product added (in-memory)')));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    priceCtrl.dispose();
    prevPriceCtrl.dispose();
    mainImgCtrl.dispose();
    descriptionCtrl.dispose();

    addImgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Product name',
                        border: InputBorder.none,
                        hintText: 'e.g. Wireless Headphones',
                      ),
                      validator: (v) => v == null || v.trim().isEmpty
                          ? 'Enter product name'
                          : null,
                    ),
                    const Divider(),
                    TextFormField(
                      controller: priceCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Price',
                        border: InputBorder.none,
                        hintText: 'e.g. 49.99',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (v) =>
                          v == null || v.trim().isEmpty ? 'Enter price' : null,
                    ),
                    const Divider(),
                    TextFormField(
                      controller: prevPriceCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Previous price (optional)',
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const Divider(),
                    TextFormField(
                      controller: descriptionCtrl,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        labelText: 'Product Description',
                        hintText: 'Enter full product description here...',
                        border: InputBorder.none,
                      ),
                      validator: (v) => v == null || v.trim().isEmpty
                          ? 'Enter product description'
                          : null,
                    ),

                    const Divider(),
                    TextFormField(
                      controller: mainImgCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Main image URL (optional)',
                        border: InputBorder.none,
                      ),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: addImgCtrl,
                            decoration: const InputDecoration(
                              labelText: 'Additional image URL',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: addImage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text('Add'),
                        ),
                      ],
                    ),
                    if (displayImgs.isNotEmpty) const SizedBox(height: 12),
                    if (displayImgs.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: displayImgs
                            .map(
                              (u) => ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  u,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Add Product'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
