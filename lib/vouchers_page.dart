// Lines 2-29 were taken and adjusted from a ChatGPT conversation
import 'package:flutter/material.dart';
import 'api_service.dart';

class VouchersPage extends StatefulWidget {
  final String shopName;
  final int userId;

  const VouchersPage({
    super.key,
    required this.shopName,
    required this.userId,
  });


  @override
  VouchersPageState createState() => VouchersPageState();
}

class VouchersPageState extends State<VouchersPage> {
  late Future<List<dynamic>> voucher;

  @override
  void initState() {
    super.initState();
    voucher = ApiService.getVouchers(widget.userId); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.shopName} Vouchers')),
      body: FutureBuilder<List<dynamic>>(
        future: voucher,
        builder: (context, snapshot) {
          // Lines 30-34 were taken and adjusted from a different ChatGPT conversation
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var voucher = snapshot.data![index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent[700],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        voucher['voucher_code'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        voucher['expiry_date'],
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
            // Lines 68-72 were taken and adjusted from a ChatGPT conversation
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
