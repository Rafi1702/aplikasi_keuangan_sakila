import 'package:flutter/material.dart';
import 'package:sakila_store_project/theme/colors.dart';
import 'package:sakila_store_project/view/laporan_pengeluaran_list.dart';

import 'package:sakila_store_project/widgets/custom_button.dart';

class LaporanPage extends StatelessWidget {
  const LaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Column(children: [
      _container(
          imagePath: 'assets/calendar.png',
          text: 'Pilih Tanggal',
          isMoreWidget: true,
          isWidgetCenter: false,
          context: context),
      const SizedBox(height: 16.0),
      _container(
          imagePath: 'assets/report.png',
          text: 'Laporan Pemasukan',
          isMoreWidget: false,
          isWidgetCenter: false),
      const SizedBox(height: 8.0),
      _container(
          imagePath: 'assets/report.png',
          text: 'Laporan Pengeluaran',
          isMoreWidget: false,
          isWidgetCenter: false,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LaporanPengeluaranPage()));
          }),
      const SizedBox(height: 50.0),
      _container(
          imagePath: 'assets/pdf.png',
          text: 'Laporan Pengeluaran',
          isMoreWidget: false,
          isWidgetCenter: true),
      SizedBox(height: MediaQuery.of(context).size.height * 0.3),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.0,
            width: 170.0,
            child: CustomButton(
              color: AppColors.secondaryColor,
              widget: const Text(
                "Simpan",
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
              color: AppColors.secondaryColor,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/share.png'),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Bagikan',
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
// [BuildContext? context, VoidCallback? onTap]
  //smaller widgets
  Widget _container({
    required String imagePath,
    required String text,
    required bool isMoreWidget,
    required bool isWidgetCenter,
    BuildContext? context,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: isWidgetCenter
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
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
