import 'package:flutter/material.dart';
import 'package:sakila_store_project/view/laporan_page.dart';
import 'package:sakila_store_project/view/list_barang_page.dart';
import 'package:sakila_store_project/view/tambah_barang_page.dart';
import 'package:sakila_store_project/view/transaksi_harian_page.dart';
import 'package:sakila_store_project/view/transaksi_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _bodyWidgets = const [
    TransaksiHarianPage(),
    TambahBarangPage(),
    ListBarangPage(),
    TransaksiPage(),
    LaporanPage(),
  ];

  void onItemTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _bodyWidgets[_selectedIndex]),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
        backgroundColor: Colors.pink,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/transaksi-harian-nav.png'),
            label: '',
            activeIcon: Image.asset('assets/transaksi-harian-nav.png',
                color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/tambah-barang-nav.png'),
            label: '',
            activeIcon: Image.asset('assets/tambah-barang-nav.png',
                color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/list-barang-nav.png'),
            label: '',
            activeIcon:
                Image.asset('assets/list-barang-nav.png', color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/transaction-nav.png'),
            label: '',
            activeIcon:
                Image.asset('assets/transaction-nav.png', color: Colors.white),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/report-nav.png'),
            label: '',
            activeIcon:
                Image.asset('assets/report-nav.png', color: Colors.white),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTap);
  }
}
