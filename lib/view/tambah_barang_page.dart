import 'package:flutter/material.dart';
import 'package:sakila_store_project/theme/colors.dart';
import 'package:sakila_store_project/widgets/custom_button.dart';
import 'package:sakila_store_project/widgets/custom_dropdown.dart';
import 'package:sakila_store_project/widgets/custom_textfield.dart';

class TambahBarangPage extends StatefulWidget {
  const TambahBarangPage({super.key});

  @override
  State<TambahBarangPage> createState() => _TambahBarangPageState();
}

class _TambahBarangPageState extends State<TambahBarangPage> {
  final TextEditingController _namaBarangController = TextEditingController();
  final TextEditingController _hargaBarangController = TextEditingController();
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        children: [
          SizedBox(
            height: 84.0,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    text: 'Nama Barang',
                    controller: _namaBarangController,
                    hintText: '',
                    radiusValue: 4.0,
                  ),
                ),
                const SizedBox(width: 30.0),
                Expanded(child: _quantityWidget()),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  text: 'Harga',
                  hintText: '',
                  controller: _hargaBarangController,
                  radiusValue: 4.0,
                ),
              ),
              const SizedBox(width: 30.0),
              Expanded(
                child: CustomDropDown(
                  list: ["test", "Halo", "Aku"],
                  text: "",
                  value: _selectedValue,
                  onChanged: (val) {
                    setState(() {
                      _selectedValue = val;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 70.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/upload-gambar-barang.png"),
                  const SizedBox(height: 10.0),
                  const Text('Unggah Gambar'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 100.0),
          CustomButton(
            color: AppColors.secondaryColor,
            widget: Text("Test"),
            onPressed: () {},
            radiusValue: 10.0,
            enableBorderSide: false,
          )
        ],
      ),
    );
  }

  Widget _quantityWidget() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
              ),
              color: AppColors.secondaryColor,
            ),
            child: const Icon(Icons.remove),
          ),
          const Expanded(
            child: Card(
              shape: RoundedRectangleBorder(),
              color: Colors.white,
              child: Text(
                "Halo",
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              color: AppColors.secondaryColor,
            ),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
