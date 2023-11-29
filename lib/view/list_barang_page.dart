import 'package:flutter/material.dart';
import 'package:sakila_store_project/model/barang_model.dart';
import 'package:sakila_store_project/theme/colors.dart';

class ListBarangPage extends StatefulWidget {
  const ListBarangPage({super.key});

  @override
  State<ListBarangPage> createState() => _ListBarangPageState();
}

class _ListBarangPageState extends State<ListBarangPage> {
  List<Barang> barang = [
    const Barang(namaBarang: "Kaos Hehe", hargaBarang: 100, stokBarang: 10),
    const Barang(namaBarang: "Kaos Haha", hargaBarang: 100, stokBarang: 10),
    const Barang(namaBarang: "Kaos Hihi", hargaBarang: 100, stokBarang: 10),
    const Barang(namaBarang: "Kaos Huhu", hargaBarang: 100, stokBarang: 10),
    const Barang(namaBarang: "Kaos Haihai", hargaBarang: 100, stokBarang: 10),
    const Barang(namaBarang: "Kaos Hoho", hargaBarang: 100, stokBarang: 10),
    const Barang(namaBarang: "Waduh", hargaBarang: 100, stokBarang: 10),
    const Barang(namaBarang: "Halow", hargaBarang: 100, stokBarang: 10),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 30.0,
        ),
        child: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return GridView.builder(
      clipBehavior: Clip.none,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 24.0, // spacing between rows
        crossAxisSpacing: 30.0, // spacing between columns
        mainAxisExtent: 172.0, // height of container
      ),
      itemCount: barang.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90.0,
                height: 70.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    "https://ik.imagekit.io/mrggsfxta/default-image.jpg?updatedAt=1681846968829",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(barang[index].namaBarang),
              const SizedBox(
                height: 4.0,
              ),
              Text("Rp. ${barang[index].hargaBarang}"),
              const SizedBox(
                height: 4.0,
              ),
              Text("Stok: ${barang[index].stokBarang}")
            ],
          ),
        );
      },
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("Data Barang"),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
