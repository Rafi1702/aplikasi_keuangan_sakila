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
  int quantity = 0;
  final _formKey = GlobalKey<FormState>();

  String? _selectedValue;

  void increaseQuantity() {
    setState(() {
      quantity += 1;
    });
  }

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
            if (state.status == BarangStatus.loaded) {
              Dialogs.showErrorDialog(context, state.errorMessage);
            }
          },
          child: Column(
            children: [
              _row1(),
              const SizedBox(height: 20.0),
              _row2(),
              const SizedBox(height: 40.0),
              pictureContainer(),
              const SizedBox(height: 80.0),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  color: AppColors.secondaryColor,
                  widget: const Text("Test"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
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
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            text: 'Harga',
            hintText: '',
            controller: _hargaBarangController,
            radiusValue: 4.0,
            validator: (val) {
              return GlobalValidator.fieldBarang(val, 'Harga')!;
            },
          ),
        ),
        const SizedBox(width: 30.0),
        Expanded(
          child: CustomDropDown(
            list: JenisBarang.values.map((e) => e.value).toList(),
            text: "",
            value: _selectedValue,
            onChanged: (val) {
              setJenisBarangValue(val!);
            },
          ),
        ),
      ],
    );
  }

  Widget _row1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: CustomTextField(
            text: 'Nama Barang',
            controller: _namaBarangController,
            hintText: '',
            radiusValue: 4.0,
            validator: (val) {
              return GlobalValidator.fieldBarang(val, 'Nama')!;
            },
          ),
        ),
      ],
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
