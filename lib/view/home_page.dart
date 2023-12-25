import 'package:flutter/material.dart';
import 'package:sakila_store_project/theme/colors.dart';
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

  // final List<PreferredSizeWidget> _appBarList = const [
  //   TransaksiHarianAppBar(),
  //   TambahBarangAppBar(),
  //   ListBarangAppBar(),
  //   TransaksiBaruAppBar(),
  //   LaporanAppBar(),
  // ];

  final List<Widget> _appBarWidgets = const [
    TransaksiHarianLeading(),
    TambahBarangLeading(),
    ListBarangLeading(),
    TransaksiLeading(),
    LaporanLeading(),
  ];
  void onItemTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBarWidgets[_selectedIndex],
        backgroundColor: AppColors.primaryColor,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _bodyWidgets,
        ),
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: onItemTap,
      backgroundColor: AppColors.primaryColor,
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
          activeIcon:
              Image.asset('assets/tambah-barang-nav.png', color: Colors.white),
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
          activeIcon: Image.asset('assets/report-nav.png', color: Colors.white),
        ),
      ],
    );
  }
}

class TransaksiHarianLeading extends StatelessWidget {
  const TransaksiHarianLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/app-icon.png', width: 40.0, height: 40.0),
        const SizedBox(width: 20.0),
        const Text("Sakila Store")
      ],
    );
  }
}

class TambahBarangLeading extends StatelessWidget {
  const TambahBarangLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Tambah Barang");
  }
}

class ListBarangLeading extends StatelessWidget {
  const ListBarangLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Data Barang");
  }
}

class TransaksiLeading extends StatelessWidget {
  const TransaksiLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Transaksi Baru");
  }
}

class LaporanLeading extends StatelessWidget {
  const LaporanLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Laporan");
  }
}
