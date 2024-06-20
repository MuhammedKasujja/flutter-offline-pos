import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_kalteck_pos/features/purchases/purchases.dart';
import 'package:pluto_grid/pluto_grid.dart';

class PurchacesScreen extends StatefulWidget {
  const PurchacesScreen({super.key});

  @override
  State<PurchacesScreen> createState() => _PurchacesScreenState();
}

class _PurchacesScreenState extends State<PurchacesScreen> {
  final List<PlutoColumn> columns = [
    /// Text Column definition
    PlutoColumn(
      title: 'Client',
      field: 'name',
      type: PlutoColumnType.text(),
    ),

    /// Number Column definition
    PlutoColumn(
      title: 'Amount',
      field: 'amount',
      type: PlutoColumnType.number(),
    ),

    /// Select Column definition
    PlutoColumn(
      title: 'Product',
      field: 'product',
      enableAutoEditing: true,
      type: PlutoColumnType.select(['item1', 'item2', 'item3'],
          enableColumnFilter: true),
    ),

    /// Datetime Column definition
    PlutoColumn(
      title: 'Date Taken',
      field: 'date',
      type: PlutoColumnType.date(),
    ),

    /// Time Column definition
    PlutoColumn(
      title: 'Time',
      field: 'time',
      type: PlutoColumnType.time(),
    ),
  ];

  @override
  void initState() {
    context.read<PurchasesBloc>().add(FetchPurchases());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 16),
      child: BlocBuilder<PurchasesBloc, PurchasesState>(
        builder: (context, state) {
          final rows = state.data
                  ?.map(
                    (item) => PlutoRow(
                      cells: {
                        'name': PlutoCell(value: item.name),
                        'amount': PlutoCell(value: item.amount),
                        'product': PlutoCell(value: item.product),
                        'date': PlutoCell(value: item.date),
                        'time': PlutoCell(value: item.time),
                      },
                    ),
                  )
                  .toList() ??
              [];
          return PlutoGrid(
              columns: columns,
              rows: rows,
              onChanged: (PlutoGridOnChangedEvent event) {
                print(event);
              },
              onLoaded: (PlutoGridOnLoadedEvent event) {
                print(event);
              });
        },
      ),
    );
  }
}
