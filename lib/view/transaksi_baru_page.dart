import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakila_store_project/bloc/barang/barang_bloc.dart';
import 'package:sakila_store_project/bloc/filter/filter_bloc.dart';
import 'package:sakila_store_project/model/barang_model.dart';
import 'package:sakila_store_project/theme/colors.dart';
import 'package:sakila_store_project/widgets/custom_button.dart';

class TransaksiBaruPage extends StatelessWidget {
  const TransaksiBaruPage({super.key});

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
      child: BlocProvider(
        create: (context) => FilterBloc()..add(GetFilterEvent()),
        child: BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) {
            if (state is FilterLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
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
                            child:
                                Center(child: Text(state.filters[index].nama)),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  BlocBuilder<BarangBloc, BarangState>(
                    builder: (context, state) {
                      if (state is BarangLoading) {
                        return const CircularProgressIndicator();
                      }
                      if (state is BarangLoaded) {
                        return _listBarang(state.barang);
                      }
                      return Container();
                    },
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
                        color: AppColors.secondaryColor,
                        widget: const Text(
                          "Simpan Transaksi",
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          // print(state.filters
                          //     .where((element) => element.isActive)
                          //     .first
                          //     .nama
                          //     .toString());
                          context.read<BarangBloc>().add(ResetStokEvent());
                        },
                        radiusValue: 30.0,
                        enableBorderSide: false,
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _listBarang(List<DataBarang> barang) {
    return SizedBox(
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            onTap: () {
                              context.read<BarangBloc>().add(
                                  KurangiKuantitasEvent(
                                      id: barang[index].idBarang));
                            },
                            child: const Icon(Icons.remove, size: 20.0),
                          ),
                          Text(barang[index].kuantitas.toString()),
                          GestureDetector(
                            onTap: () {
                              context.read<BarangBloc>().add(
                                  TambahKuantitasEvent(
                                      id: barang[index].idBarang));
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
