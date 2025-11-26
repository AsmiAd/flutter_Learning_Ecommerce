import '../models/product.dart';

List<Product> allproducts = [
  Product(
    id: 1,
    productName: 'Nintendo Switch – Gray',
    price: 169.00,
    previousPrice: 199.00,
    isFavourite: false,
    rating: 4.8,
    totalLikes: 117,
    productImage:
        "https://m.media-amazon.com/images/I/61i421VnFYL._AC_SX355_.jpg",
    productCreatedAt: '2023-10-01',

    totalReviews: 117,
    monthlyPrice: 14,
    deliveryDate: '26 October',
    description:
        'The Nintendo Switch gaming console is a compact '
        'device that can be taken everywhere. This portable super '
        'device is also equipped with 2 gamepads.',

    displayImages: [
      'https://m.media-amazon.com/images/I/61yvYBqI8AL._AC_SX355_.jpg',
      'https://m.media-amazon.com/images/I/61nlNhzAZrL._AC_SX355_.jpg',
      'https://m.media-amazon.com/images/I/61WS2Fbvm5L._AC_SX355_.jpg',
      'https://m.media-amazon.com/images/I/61L7dvpqIxL._AC_SX355_.jpg',
    ],
  ),

  Product(
    id: 2,
    productName: 'Apple iPhone 15 Pro',
    price: 669.00,
    previousPrice: 739.00,
    isFavourite: false,
    rating: 4.9,
    totalLikes: 200,
    productImage:
        "https://media.itechstore.com.np/w_1024&f_webp/img/product/variants/1aaa9baf-6897-491c-91c9-cab700b146e8/iphone-15-pro-natural-titanium.jpg",
    productCreatedAt: '2023-10-02',

    totalReviews: 117,
    monthlyPrice: 14,
    deliveryDate: '26 October',
    description:
        'The Apple iPhone 15 Pro is a compact '
        'device that can be taken everywhere. This portable super ',

    displayImages: [
      'https://cdsassets.apple.com/live/7WUAS350/images/tech-specs/iphone_15_pro.png',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyrngaRvizCe6b8XQriZmLt--LmgUXwLC8XQ&s',
      'https://cdn2.blanxer.com/category_image/682feff88c633f25b4c7ce32/683022aa8c633f25b4c9a3e5.webp',
    ],
  ),

  Product(
    id: 3,
    productName: 'Samsung Galaxy Buds Pro',
    price: 69.00,
    previousPrice: 199.00,
    isFavourite: false,
    rating: 4.6,
    totalLikes: 80,
    productImage:
        "https://m.media-amazon.com/images/I/51TdsRixCUL._AC_SX355_.jpg",
    productCreatedAt: '2023-10-03',

    totalReviews: 117,
    monthlyPrice: 14,
    deliveryDate: '26 October',
    description:
        'The Samsung Galaxy Buds Pro is a compact '
        'device that can be taken everywhere. This portable super ',

    displayImages: [
      'https://m.media-amazon.com/images/I/51nQuzNdz3L._AC_SY450_.jpg',
      'https://m.media-amazon.com/images/I/717mAG4V2NL._AC_SY355_.jpg',
    ],
  ),
];

List<Product> favouriteProducts = [];
