import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../purchases/presentation/bloc/purchases_bloc.dart';
import '../widgets/calculator.dart';

class POSScreen extends StatefulWidget {
  const POSScreen({super.key});

  @override
  State<POSScreen> createState() => _POSScreenState();
}

class _POSScreenState extends State<POSScreen> {
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

  final rows = List.filled(
    200,
    PlutoRow(
      cells: {
        'name': PlutoCell(value: ''),
        'amount': PlutoCell(value: 0.0),
        'product': PlutoCell(value: ''),
        'date': PlutoCell(value: DateTime.now()),
        'time': PlutoCell(value: ''),
      },
    ),
  ).toList();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 16),
            child: PlutoGrid(
                columns: columns,
                rows: rows,
                onChanged: (PlutoGridOnChangedEvent event) {
                  print(event);
                },
                onLoaded: (PlutoGridOnLoadedEvent event) {
                  print(event);
                }),
          ),
        ),
        const Flexible(flex: 2, child: CalculatorWidget())
      ],
    );
  }
}
