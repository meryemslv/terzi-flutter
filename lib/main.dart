
import 'package:flutter/material.dart';
import 'screens/urunler_detay_screen.dart';
import 'screens/sepet_screen.dart';

final List<Map<String, dynamic>> products =[
   {
    'name':'Yandan bağlamalı etek' ,
    'price': 199.90,
  },
   {
    'name': 'Salaş gömlek',
    'price': 899.90,
  },
   {
    'name':'Kot ceket' ,
    'price': 459.90,
  },
   {
    'name':'Kaşe kaban' ,
    'price': 359.90,
  },
];

void main() {
  runApp(const MiniShopApp());
}

class MiniShopApp extends StatelessWidget {
  const MiniShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Terzim',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF795548),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
 State<HomeScreen> createState() => _HomeScreenState();}
 
 class _HomeScreenState extends State<HomeScreen> {

String searchText='';

  @override
   Widget build(BuildContext context) {
final filteredProducts = products.where((product) {
  return product['name']
  .toString()
  .toLowerCase()
  .contains(searchText.toLowerCase());
}).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('MiniShop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            tooltip: 'Sepetim',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SepetScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
            'Kişisel Terzinize Hoşgeldiniz',
            style:TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            ),

            const SizedBox(height:8),
            const Text(
              'Aradığın ürünleri hemen bul',
              style: TextStyle(fontSize:16),
            ),

            const SizedBox(height:20),
            TextField(
              onChanged:(value) {
                setState(() {
                  searchText= value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Ürün ara..',
                prefixIcon: const Icon(Icons.search),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ürünler',
              style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

              
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(
                        productName: product['name'].toString(),
                        productPrice: (product['price'] as num).toDouble(),
                      ),),);
                },
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFEBE9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      size: 32,
                      color: Color(0xFF795548),
                    ),
                  ),
                  title: Text(
                    product['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '${(product['price'] as num).toStringAsFixed(2)} TL',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF795548),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                ),
              );
              }))
          ],
        )
      ),
    );
  }
}
