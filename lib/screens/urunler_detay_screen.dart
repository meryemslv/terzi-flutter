
import 'package:flutter/material.dart';
import '../sepet.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final double productPrice;

  const ProductDetailScreen({
    super.key,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ürün Detayı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.shopping_bag_outlined,
              size: 100,
              color: Color(0xFF795548),
            ),
            const SizedBox(height: 24),
            Text(
              productName,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '${productPrice.toStringAsFixed(2)} TL',
              style: const TextStyle(
                fontSize: 22,
                color: Color(0xFF795548),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Bu ürün MiniShop kataloğunda yer almaktadır.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Sepet.addProduct({
                    'name':productName,
                    'price': productPrice,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sepete Eklendi!'),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart_outlined),
                label: const Text('Sepete Ekle'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
