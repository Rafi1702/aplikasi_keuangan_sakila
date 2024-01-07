import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakila_store_project/bloc/barang/barang_bloc.dart';
import 'package:sakila_store_project/bloc/filter/filter_bloc.dart';
import 'package:sakila_store_project/bloc/pengeluaran/pengeluaran_bloc.dart';
import 'package:sakila_store_project/bloc/pengeluaran/pengeluaran_state.dart';
import 'package:sakila_store_project/model/barang_model.dart';

import 'package:sakila_store_project/theme/colors.dart';
import 'package:sakila_store_project/widgets/custom_button.dart';

class TransaksiBaruPage extends StatefulWidget {
  const TransaksiBaruPage({super.key});

  @override
  State<TransaksiBaruPage> createState() => _TransaksiBaruPageState();
}

class _TransaksiBaruPageState extends State<TransaksiBaruPage> {
  // final LoadingOverlay _loadingOverlay = LoadingOverlay();
  List<DataBarang> barang = [];
  // final FilterBloc filter = FilterBloc();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 32.0,
        vertical: 24.0,
      ),
      child: BlocListener<PengeluaranBloc, PengeluaranState>(
        listener: (context, state) {
          if (state.status == PengeluaranStatus.failure) {
            showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      content: Text(state.failureMessage),
                      actions: [
                        ElevatedButton(
                          child: const Text('Pop'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ]);
                });
          }
          if (state.status == PengeluaranStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Berhasil Menambahkan Transaksi'),
              action: SnackBarAction(
                label: 'close',
                onPressed: () {},
              ),
            ));
          }
        },
        child: BlocBuilder<BarangBloc, BarangState>(
          builder: (context, state) {
            barang = state.barang;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocProvider(
                  create: (context) => FilterBloc()..add(GetFilterEvent()),
                  child: BlocBuilder<FilterBloc, FilterState>(
                    builder: (context, state) {
                      if (state is FilterLoaded) {
                        return _filterContainer(state);
                      }
                      return Container();
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                _listBarang(state),
                const SizedBox(height: 16.0),
                _calendarBox(),
                const SizedBox(
                  height: 30.0,
                ),
                BlocBuilder<PengeluaranBloc, PengeluaranState>(
                  builder: (context, state) {
                    return _roundedButton(context, state, barang);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _roundedButton(
      BuildContext context, PengeluaranState state, List<DataBarang> barang) {
    return Center(
      child: SizedBox(
        width: 240.0,
        child: CustomButton(
          color: state.status == PengeluaranStatus.loading
              ? Colors.grey
              : AppColors.secondaryColor,
          widget: state.status == PengeluaranStatus.pending
              ? const CircularProgressIndicator()
              : const Text(
                  "Simpan Transaksi",
                  style: TextStyle(color: Colors.black),
                ),
          onPressed: () {
            state.status == PengeluaranStatus.loading
                ? null
                : context.read<PengeluaranBloc>().add(InsertPengeluaranEvent(
                    barang: barang, tanggalPengeluaran: "2024-01-12"));
          },
          radiusValue: 30.0,
          enableBorderSide: false,
        ),
      ),
    );
  }

  Widget _calendarBox() {
    return Container(
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
    );
  }

  Widget _filterContainer(FilterLoaded state) {
    return SizedBox(
      height: 42.0,
      child: ListView.builder(
        clipBehavior: Clip.hardEdge,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: state.filters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: index == state.filters.length - 1
                ? const EdgeInsets.only()
                : const EdgeInsets.only(right: 8.0),
            child: _filterButton(context, state, index),
          );
        },
      ),
    );
  }

  GestureDetector _filterButton(
      BuildContext context, FilterLoaded state, int index) {
    return GestureDetector(
      onTap: () {
        context.read<FilterBloc>().add(
              ChangeFilterEvent(
                filter: state.filters[index],
              ),
            );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: state.filters[index].isActive
              ? AppColors.secondaryColor
              : const Color(0xFFF0F0F0),
        ),
        child: Center(child: Text(state.filters[index].nama)),
      ),
    );
  }
}

Widget _listBarang(BarangState state) {
  return SizedBox(
    child: state.status == BarangStatus.loading
        ? const Center(child: CircularProgressIndicator())
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of items in each row
              mainAxisSpacing: 20.0, // spacing between rows
              crossAxisSpacing: 20.0, // spacing between columns
              mainAxisExtent: 200.0, // height of container
            ),
            itemCount: state.barang.length,
            itemBuilder: (context, index) {
              return _barangCard(state, index, context);
            },
          ),
  );
}

Container _barangCard(BarangState state, int index, BuildContext context) {
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
        Text(state.barang[index].namaBarang),
        const SizedBox(
          height: 4.0,
        ),
        Text("Rp. ${state.barang[index].hargaBarang}"),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                context.read<BarangBloc>().add(
                    KurangiKuantitasEvent(id: state.barang[index].idBarang));
              },
              child: const Icon(Icons.remove, size: 20.0),
            ),
            Text(state.barang[index].kuantitas.toString()),
            GestureDetector(
              onTap: () {
                context.read<BarangBloc>().add(
                    TambahKuantitasEvent(id: state.barang[index].idBarang));
              },
              child: const Icon(Icons.add, size: 20.0),
            ),
          ],
        ),
      ],
    ),
  );
}
