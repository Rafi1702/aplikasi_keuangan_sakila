import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakila_store_project/bloc/barang/barang_bloc.dart';
import 'package:sakila_store_project/core/validators/validators.dart';
import 'package:sakila_store_project/model/barang_model.dart';
import 'package:sakila_store_project/core/theme/colors.dart';
import 'package:sakila_store_project/widgets/custom_button.dart';
import 'package:sakila_store_project/widgets/custom_dropdown.dart';
import 'package:sakila_store_project/widgets/custom_textfield.dart';
import 'package:sakila_store_project/widgets/loading_dialog.dart';

class TambahBarangPage extends StatefulWidget {
  const TambahBarangPage({super.key});

  @override
  State<TambahBarangPage> createState() => _TambahBarangPageState();
}

class _TambahBarangPageState extends State<TambahBarangPage> {
  final TextEditingController _namaBarangController = TextEditingController();
  final TextEditingController _hargaBarangController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();
  int quantity = 0;
  final _formKey = GlobalKey<FormState>();

  String? _selectedValue;

  void setJenisBarangValue(String value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Form(
        key: _formKey,
        child: BlocListener<BarangBloc, BarangState>(
          listenWhen: (previous, current) =>
              current.isInserting || previous.isInserting,
          listener: (context, state) {
            if (state.status == BarangStatus.error) {
              Dialogs.showErrorDialog(context, state.errorMessage);
            }
          },
          child: Column(
            children: [
              _row1(),
              _row2(),
              const SizedBox(height: 40.0),
              pictureContainer(),
              const SizedBox(height: 100.0),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  color: AppColors.secondaryColor,
                  widget: const Text("Input Barang"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final barang = DataBarang(
                          namaBarang: _namaBarangController.text,
                          hargaBarang: int.parse(_hargaBarangController.text),
                          stokBarang: int.parse(_stokController.text),
                          jenisBarang: _selectedValue!);

                      context
                          .read<BarangBloc>()
                          .add(InsertBarangEvent(barang: barang));
                    } else {
                      Dialogs.showErrorDialog(
                          context, 'Field barang masih ada yang kosong');
                    }
                  },
                  radiusValue: 10.0,
                  enableBorderSide: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget pictureContainer() {
    return Container(
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
    );
  }

  Widget _row2() {
    return SizedBox(
      height: 80.0,
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: CustomTextField(
                keyboardType: TextInputType.number,
                text: 'Harga',
                hintText: '',
                controller: _hargaBarangController,
                radiusValue: 4.0,
                validator: (val) {
                  return GlobalValidator.fieldBarang(val, 'Harga');
                },
              ),
            ),
            const SizedBox(width: 30.0),
            CustomDropDown(
              list: JenisBarang.values.map((e) => e.value).toList(),
              text: "",
              value: _selectedValue,
              onChanged: (val) {
                setJenisBarangValue(val!);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _row1() {
    return SizedBox(
      height: 80.0,
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              text: 'Nama Barang',
              controller: _namaBarangController,
              hintText: '',
              radiusValue: 4.0,
              validator: (val) {
                return GlobalValidator.fieldBarang(val, 'Nama');
              },
            ),
          ),
          const SizedBox(width: 20.0),

          CustomTextField(
            keyboardType: TextInputType.number,
            size: 80.0,
            text: 'Stok',
            controller: _stokController,
            hintText: '',
            radiusValue: 4.0,
            validator: (val) {
              return GlobalValidator.fieldBarang(val, 'Stok');
            },
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8.0),
          //     border: Border.all(width: 0.5),
          //   ),
          //   child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         IconButton(
          //           icon: const Icon(Icons.remove),
          //           onPressed: () {

          //           },
          //         ),
          //         Text(quantity.toString()),
          //         IconButton(
          //           icon: const Icon(Icons.add),
          //           onPressed: () {

          //           },
          //         ),
          //       ]),
          // ),
        ],
      ),
    );
  }

  // Widget _quantityWidget() {
  //   return SizedBox(
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Container(
  //           decoration: const BoxDecoration(
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(10.0),
  //               bottomLeft: Radius.circular(10.0),
  //             ),
  //             color: AppColors.secondaryColor,
  //           ),
  //           child: const Icon(Icons.remove),
  //         ),
  //         const Expanded(
  //           child: Card(
  //             shape: RoundedRectangleBorder(),
  //             color: Colors.white,
  //             child: Text(
  //               "Halo",
  //               style: TextStyle(fontSize: 16.0),
  //               textAlign: TextAlign.center,
  //             ),
  //           ),
  //         ),
  //         Container(
  //           decoration: const BoxDecoration(
  //             borderRadius: BorderRadius.only(
  //               topRight: Radius.circular(10.0),
  //               bottomRight: Radius.circular(10.0),
  //             ),
  //             color: AppColors.secondaryColor,
  //           ),
  //           child: const Icon(Icons.add),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
