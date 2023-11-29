import 'package:flutter/material.dart';
import 'package:sakila_store_project/theme/colors.dart';
import 'package:sakila_store_project/widgets/custom_button.dart';

class LaporanPage extends StatelessWidget {
  const LaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Column(children: [
      _container('assets/calendar.png', 'Pilih Tanggal', true, false, context),
      const SizedBox(height: 16.0),
      _container('assets/report.png', 'Laporan Pemasukan', false, false),
      const SizedBox(height: 8.0),
      _container('assets/report.png', 'Laporan Pengeluaran', false, false),
      const SizedBox(height: 50.0),
      _container('assets/pdf.png', 'Laporan Pengeluaran', false, true),
      SizedBox(height: MediaQuery.of(context).size.height * 0.3),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.0,
            width: 170.0,
            child: CustomButton(
              widget: const Text(
                "Simpan",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {},
              enableBorderSide: false,
              radiusValue: 30.0,
            ),
          ),
          const SizedBox(width: 22.0),
          SizedBox(
            height: 40.0,
            width: 150.0,
            child: CustomButton(
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/share.png'),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Bagikan',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              onPressed: () {},
              enableBorderSide: false,
              radiusValue: 30.0,
            ),
          ),
        ],
      ),
    ]);
  }

  // PreferredSizeWidget _appBar() {
  //   return AppBar(
  //     title: const Text("Laporan"),
  //     backgroundColor: AppColors.primaryColor,
  //   );
  // }

  //smaller widgets
  Widget _container(
      String imagePath, String text, bool isMoreWidget, bool isWidgetCenter,
      [BuildContext? context]) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment:
            isWidgetCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          Image.asset(imagePath),
          Text(text),
          const SizedBox(width: 4.0),
          isWidgetCenter ? Container() : const Spacer(),
          isMoreWidget
              ? GestureDetector(
                  child: const Text('Ubah'),
                  onTap: () {
                    _showBotomSheet(context!);
                  },
                )
              : Container(),
        ],
      ),
    );
  }

  void _showBotomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(55.0),
          topRight: Radius.circular(55.0),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          height: 400.0,
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 30.0,
          ),
          child: Column(children: [
            Row(
              children: [
                Image.asset('assets/calendar.png'),
                const SizedBox(width: 16.0),
                const Text('Pilih Tanggal'),
              ],
            ),
          ]),
        );
      },
    );
  }
}
