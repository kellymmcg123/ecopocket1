// this page of code was taken and adjusted from a ChatGPT conversation
import 'package:flutter/material.dart';
import 'vouchers_page.dart';

class DashboardPage extends StatelessWidget {
  final int userId;
  final String name;

  DashboardPage({
    super.key,
    required this.userId,
    required this.name,
  });


  final List<String> shops = [
    "Dunnes",
    "Aldi",
    "Lidl",
    "Tesco",
    "Spar",
    "SuperValu Carrigaline",
    "Centra Victoria Cross",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, $name"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(18),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
        ),
        itemCount: shops.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VouchersPage(
                    shopName: shops[index],
                    userId: 1,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  shops[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ), 
    );       
  }
}
