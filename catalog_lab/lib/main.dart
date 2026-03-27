import 'package:flutter/material.dart';

void main() => runApp(const CatalogApp());

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Catalog',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const CatalogScreen(),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String imageUrl;
  final Color color;

  const Product({   // ← Added 'const' here
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.color,
  });
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  // Sample data - now properly constant
  static const List<Product> products = [
    Product(
      name: 'Coffee Mug',
      price: '\$12.99',
      imageUrl: 'https://picsum.photos/id/3/200/200',
      color: Colors.brown,
    ),
    Product(
      name: 'Notebook',
      price: '\$15.99',
      imageUrl: 'https://picsum.photos/id/14/200/200',
      color: Colors.blue,
    ),
    Product(
      name: 'Pen Set',
      price: '\$10.49',
      imageUrl: 'https://picsum.photos/id/29/200/200',
      color: Colors.green,
    ),
    Product(
      name: 'Backpack',
      price: '\$49.99',
      imageUrl: 'https://picsum.photos/id/30/200/200',
      color: Colors.red,
    ),
    Product(
      name: 'Headphones',
      price: '\$129.99',
      imageUrl: 'https://picsum.photos/id/201/200/200',
      color: Colors.grey,
    ),
    Product(
      name: 'Smart Watch',
      price: '\$199.99',
      imageUrl: 'https://picsum.photos/id/160/200/200',
      color: Colors.black,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.price,
                          style: TextStyle(
                            fontSize: 14,
                            color: product.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}