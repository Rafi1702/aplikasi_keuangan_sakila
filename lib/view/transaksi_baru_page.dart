import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakila_store_project/bloc/barang/barang_bloc.dart';
import 'package:sakila_store_project/bloc/filter/filter_bloc.dart';
import 'package:sakila_store_project/bloc/pengeluaran/pengeluaran_bloc.dart';
import 'package:sakila_store_project/bloc/pengeluaran/pengeluaran_state.dart';

import 'package:sakila_store_project/theme/colors.dart';
import 'package:sakila_store_project/widgets/custom_button.dart';
import 'package:sakila_store_project/widgets/loading_dialog.dart';

class TransaksiBaruPage extends StatefulWidget {
  const TransaksiBaruPage({super.key});

  @override
  State<TransaksiBaruPage> createState() => _TransaksiBaruPageState();
}

class _TransaksiBaruPageState extends State<TransaksiBaruPage> {
  final LoadingOverlay _loadingOverlay = LoadingOverlay();
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
        listenWhen: (previous, current) {
          if (current.pengeluaran.isEmpty) {
            return false;
          }

          return true;
        },
        listener: (context, state) {
          if (state.status == PengeluaranStatus.loading) {
            _loadingOverlay.show(context);
          }
          if (state.status == PengeluaranStatus.loaded) {
            _loadingOverlay.hide();
          }
          if (state.status == PengeluaranStatus.error) {
            _loadingOverlay.hide();
            showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      content: Text(state.errorMessage),
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
        },
        child: BlocBuilder<BarangBloc, BarangState>(
          builder: (context, state) {
            if (state.status == BarangStatus.loading) {
              return const CircularProgressIndicator();
            }
            if (state.status == BarangStatus.loaded) {
              return Column(
                children: [
                  _filterContainer(),
                  const SizedBox(height: 10.0),
                  _listBarang(state),
                  const SizedBox(height: 16.0),
                  _calendarBox(),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _roundedButton(context, state),
                ],
              );
            }
            if (state.status == BarangStatus.error) {
              return Center(child: Text(state.errorMessage));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _roundedButton(BuildContext context, BarangState state) {
    return SizedBox(
      width: 240.0,
      child: CustomButton(
        color: AppColors.secondaryColor,
        widget: const Text(
          "Simpan Transaksi",
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () async {
          context.read<PengeluaranBloc>().add(InsertPengeluaranEvent(
              barang: state.barang, tanggalPengeluaran: "2024-01-06"));
        },
        radiusValue: 30.0,
        enableBorderSide: false,
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

  Widget _filterContainer() {
    return BlocProvider(
      create: (context) => FilterBloc()..add(GetFilterEvent()),
      child: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          if (state is FilterLoaded) {
            return SizedBox(
              height: 100.0,
              child: ListView.builder(
                clipBehavior: Clip.hardEdge,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: state.filters.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<FilterBloc>().add(
                            ChangeFilterEvent(
                              filter: state.filters[index],
                            ),
                          );
                    },
                    child: Container(
                      color: state.filters[index].isActive
                          ? Colors.red
                          : Colors.white,
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Center(child: Text(state.filters[index].nama)),
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _listBarang(BarangState state) {
    return SizedBox(
      child: state.barang.isEmpty
          ? const Center(
              child: Text(
                'List Kosong',
                style: TextStyle(),
              ),
            )
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
                                  KurangiKuantitasEvent(
                                      id: state.barang[index].idBarang));
                            },
                            child: const Icon(Icons.remove, size: 20.0),
                          ),
                          Text(state.barang[index].kuantitas.toString()),
                          GestureDetector(
                            onTap: () {
                              context.read<BarangBloc>().add(
                                  TambahKuantitasEvent(
                                      id: state.barang[index].idBarang));
                            },
                            child: const Icon(Icons.add, size: 20.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
