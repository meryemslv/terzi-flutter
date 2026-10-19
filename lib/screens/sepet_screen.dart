import 'package:flutter/material.dart';
import '../sepet.dart';

class SepetScreen extends StatelessWidget {
  const SepetScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    final totalPrice = Sepet.items.fold<double>(
      0,
      (total, product) =>
        total + (product['price'] as num).toDouble(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sepetim'),
      ),
      body: Sepet.items.isEmpty
      ? const Center(
        child: Text(
          'Sepetiniz henüz boş ',
          style: TextStyle(fontSize: 18)
        ),
      )
      : Column(
        children: [
          Expanded(child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: Sepet.items.length,
            itemBuilder: (context, index) {
              final product = Sepet.items[index];

              return Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Color(0xFF795548),
                  ),
                  title:Text(
                    product['name'].toString(),
                  ),
                  subtitle: Text(
                    '${(product['price'] as num).toStringAsFixed(2)} TL',
                  ),
                  trailing: IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  tooltip: 'Ürünü sil',
                  onPressed: () {
                     Sepet.items.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Ürün sepetten silindi.'),
                        ),
                      );
                  },
                ),
                ),
              );
            },
          )),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: Text('Toplam: ${totalPrice.toStringAsFixed(2)} TL',
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF795548)
              )
              )
            )
          )
        ],
      )
    );
  }
}