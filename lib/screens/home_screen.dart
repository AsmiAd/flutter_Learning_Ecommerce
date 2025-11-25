import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 134, 175, 76),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.settings,
                        size: 30, color: Colors.white),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "Delivery address",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "92 High Street, London",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.notifications, size: 30),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(210, 247, 244, 244),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "Search the entire shop",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

            
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFB2D6D3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Text(
                      "Delivery is ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "50%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),

                    const SizedBox(width: 5),

                    const Text(
                      "cheaper",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Align(
                        
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          "assets/images/photo.png",
                          height: 150,
                          width: 70,
                          fit: BoxFit.contain,
                          color: const Color(0xFFB2D6D3),
                          colorBlendMode: BlendMode.modulate,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "See all >",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategory(Icons.phone_iphone, "Phones"),
                    _buildCategory(Icons.videogame_asset, "Consoles"),
                    _buildCategory(Icons.laptop_mac, "Laptops"),
                    _buildCategory(Icons.camera_alt, "Cameras"),
                    _buildCategory(Icons.headset, "Audio"),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  const Text(
                    "Flash Sale",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(width: 8),

                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 177, 223, 11),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "02:59:23",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  const Spacer(),

                  const Text(
                    "See all >",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),

              const SizedBox(height: 10),

              // ---------------- PRODUCT CARDS ----------------
              Row(
                children: [
                  Expanded(
                    child: ProductCard(
                      image: "assets/images/iphone.png",
                      title: "Apple iPhone 15 Pro 128GB",
                      subtitle: "Natural Titanium",
                      price: "£699.00",
                      oldPrice: "£739.00",
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ProductCard(
                      image: "assets/images/earbud.png",
                      title: "Samsung Galaxy Buds Pro",
                      subtitle: "True Wireless Black",
                      price: "£69.00",
                      oldPrice: "£85.00",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCategory(IconData icon, String title) {
  return Container(
    width: 90,
    margin: const EdgeInsets.only(right: 15),
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, size: 30, color: Colors.black),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 13)),
      ],
    ),
  );
}

class ProductCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String oldPrice;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.oldPrice,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  widget.image,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 10,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            widget.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14),
          ),

          const SizedBox(height: 3),

          Text(
            widget.subtitle,
            style:
                const TextStyle(color: Colors.grey, fontSize: 12),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Text(
                widget.price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                widget.oldPrice,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
