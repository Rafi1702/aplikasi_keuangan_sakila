import 'package:flutter/material.dart';
import 'package:sakila_store_project/model/barang_model.dart';
import 'package:sakila_store_project/theme/colors.dart';
import 'package:sakila_store_project/widgets/custom_button.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  List<Barang> barang = [
    const Barang(namaBarang: "Haloww", hargaBarang: 300, stokBarang: 10),
    const Barang(namaBarang: "Haloww", hargaBarang: 300, stokBarang: 10),
    const Barang(namaBarang: "Haloww", hargaBarang: 300, stokBarang: 10),
    const Barang(namaBarang: "Haloww", hargaBarang: 300, stokBarang: 10),
    const Barang(namaBarang: "Haloww", hargaBarang: 300, stokBarang: 10),
    const Barang(namaBarang: "Haloww", hargaBarang: 300, stokBarang: 10),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(clipBehavior: Clip.none, child: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: CustomButton(
                  widget: const Text(
                    "Pemasukan",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                  radiusValue: 6.0,
                  enableBorderSide: false,
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: CustomButton(
                  widget: const Text(
                    "Pengeluaran",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {},
                  radiusValue: 6.0,
                  enableBorderSide: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          SizedBox(
            child: barang.isEmpty
                ? const Center(
                    child: Text(
                      'List Kosong',
                      style: TextStyle(),
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of items in each row
                      mainAxisSpacing: 20.0, // spacing between rows
                      crossAxisSpacing: 20.0, // spacing between columns
                      mainAxisExtent: 200.0, // height of container
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 100.0,
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
                              height: 8.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  child: const Icon(Icons.remove, size: 20.0),
                                ),
                                const Text("0"),
                                GestureDetector(
                                  child: const Icon(Icons.add, size: 20.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 16.0),
          Container(
            width: 180.0,
            height: 40.0,
            padding: const EdgeInsets.only(left: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Row(children: [
              Image.asset('assets/calendar.png'),
              const SizedBox(width: 4.0),
              const Text("Pilih Tanggal"),
            ]),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Center(
            child: SizedBox(
              width: 240.0,
              child: CustomButton(
                widget: const Text(
                  "Simpan Transaksi",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
                radiusValue: 30.0,
                enableBorderSide: false,
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("Transaksi Baru"),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
