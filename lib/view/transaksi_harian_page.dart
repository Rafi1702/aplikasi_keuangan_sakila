import 'package:flutter/material.dart';

class TransaksiHarianPage extends StatelessWidget {
  const TransaksiHarianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFBEBEBE),
              ),
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: const IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Rp. 0",
                        style: TextStyle(fontSize: 24.0),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "Pemasukan",
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    width: 1.0,
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      Text(
                        "Rp. 0",
                        style: TextStyle(fontSize: 24.0),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "Pengeluaran",
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50.0),
          _transaksi("Pemasukan"),
          const SizedBox(height: 100.0),
          _transaksi("Pengeluaran"),
        ],
      ),
    );
  }

  Widget _transaksi(String jenisTransaksi) {
    return Column(
      children: [Text(jenisTransaksi)],
    );
  }
}
