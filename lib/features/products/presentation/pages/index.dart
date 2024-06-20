import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_kalteck_pos/core/logger/logger.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../data/models/product_model.dart';
import '../bloc/products_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List<PlutoColumn> columns = <PlutoColumn>[
    PlutoColumn(
      title: 'Id',
      field: 'id',
      type: PlutoColumnType.text(),
      hide: true,
    ),
    PlutoColumn(
      title: 'Name',
      field: 'name',
      type: PlutoColumnType.text(),
      renderer: (rendererContext) =>
          AutoCompleteCellEditor(rendererContext.cell),
    ),
    PlutoColumn(
      title: 'Cost Price',
      field: 'costPrice',
      type: PlutoColumnType.currency(),
      footerRenderer: (rendererContext) {
        return PlutoAggregateColumnFooter(
          rendererContext: rendererContext,
          formatAsCurrency: true,
          type: PlutoAggregateColumnType.sum,
          format: '#,###',
          alignment: Alignment.center,
          titleSpanBuilder: (text) {
            return [
              const TextSpan(
                text: 'Sum',
                style: TextStyle(color: Colors.red),
              ),
              const TextSpan(text: ' : '),
              TextSpan(
                text: text,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ];
          },
        );
      },
    ),
    PlutoColumn(
      title: 'Selling Price',
      field: 'sellingPrice',
      type: PlutoColumnType.currency(),
      footerRenderer: (rendererContext) {
        return PlutoAggregateColumnFooter(
          rendererContext: rendererContext,
          formatAsCurrency: true,
          type: PlutoAggregateColumnType.sum,
          format: '#,###',
          alignment: Alignment.center,
          titleSpanBuilder: (text) {
            return [
              const TextSpan(
                text: 'Sum',
                style: TextStyle(color: Colors.red),
              ),
              const TextSpan(text: ' : '),
              TextSpan(
                text: text,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ];
          },
        );
      },
    ),
    PlutoColumn(
      title: 'Total',
      field: 'total',
      type: PlutoColumnType.number(),
      footerRenderer: (rendererContext) {
        return PlutoAggregateColumnFooter(
          rendererContext: rendererContext,
          type: PlutoAggregateColumnType.sum,
          alignment: Alignment.center,
          titleSpanBuilder: (text) {
            return [
              const TextSpan(
                text: 'Total',
                style: TextStyle(color: Colors.red),
              ),
              const TextSpan(text: ' : '),
              TextSpan(
                text: text,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ];
          },
        );
      },
    ),
    PlutoColumn(
      title: 'Remaining',
      field: 'totalItemsRemaining',
      type: PlutoColumnType.number(),
      footerRenderer: (rendererContext) {
        return PlutoAggregateColumnFooter(
          rendererContext: rendererContext,
          type: PlutoAggregateColumnType.sum,
          alignment: Alignment.center,
          titleSpanBuilder: (text) {
            return [
              const TextSpan(
                text: 'Total',
                style: TextStyle(color: Colors.red),
              ),
              const TextSpan(text: ' : '),
              TextSpan(
                text: text,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ];
          },
        );
      },
    ),
  ];

  late final PlutoGridStateManager stateManager;

  @override
  void initState() {
    context.read<ProductsBloc>().add(FetchStockProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          if (state.data != null) {
            return PlutoGrid(
              columns: columns,
              rows: _generateEmptyRows(),
              // rowColorCallback: (PlutoRowColorContext rowColorContext) {
              //   return rowColorContext.row.cells['name']?.value == 'Suzi'
              //       ? Colors.green
              //       : Colors.white;
              // },
              createHeader: (stateManager) {
                return ButtonBar(
                  children: [
                    ElevatedButton(
                      child: const Text('Customers'),
                      onPressed: () => context.read<ProductsBloc>().add(
                            AddStockProductRows(
                              rows: stateManager.refRows.filterOrOriginalList,
                            ),
                          ),
                    ),
                    TextButton(
                      child: const Text('Users'),
                      onPressed: () {},
                    )
                  ],
                );
              },
              // columnGroups: columnGroups,
              onLoaded: (PlutoGridOnLoadedEvent event) {
                stateManager = event.stateManager;
                stateManager.setShowColumnFilter(true);
                // stateManager.autoFitColumn(context, columns[0]);
                stateManager.setAutoEditing(true);
              },
              onChanged: (PlutoGridOnChangedEvent event) {
                Logger.debug(
                    data: stateManager.refRows.filterOrOriginalList.length,
                    key: 'PlutoGridOnChangedEvent');
              },
              configuration: const PlutoGridConfiguration(
                  enterKeyAction: PlutoGridEnterKeyAction.editingAndMoveDown,
                  columnSize: PlutoGridColumnSizeConfig(
                    autoSizeMode: PlutoAutoSizeMode.scale,
                  ),
                  style: PlutoGridStyleConfig()),
            );
          } else {
            return const PlutoLoading(
              level: PlutoGridLoadingLevel.rows,
            );
          }
        }),
      ),
    );
  }

  List<PlutoRow> _generateRows(List<Product> products) => products
      .map(
        (p) => PlutoRow(
          cells: {
            'id': PlutoCell(value: p.id),
            'name': PlutoCell(value: p.name),
            'costPrice': PlutoCell(value: p.costPrice),
            'sellingPrice': PlutoCell(value: p.sellingPrice),
            'total': PlutoCell(value: p.total),
            'totalItemsRemaining': PlutoCell(value: p.totalItemsRemaining),
          },
        ),
      )
      .toList();

  List<PlutoRow> _generateEmptyRows() => List.generate(
        10,
        (index) => PlutoRow(
          cells: {
            'id': PlutoCell(value: ''),
            'name': PlutoCell(value: ''),
            'costPrice': PlutoCell(value: ''),
            'sellingPrice': PlutoCell(value: ''),
            'total': PlutoCell(value: ''),
            'totalItemsRemaining': PlutoCell(value: ''),
          },
        ),
      ).toList();
}

class AutoCompleteCellEditor extends StatefulWidget {
  final PlutoCell cell;

  const AutoCompleteCellEditor(this.cell, {super.key});

  @override
  State<AutoCompleteCellEditor> createState() => _AutoCompleteCellEditorState();
}

class _AutoCompleteCellEditorState extends State<AutoCompleteCellEditor> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.cell.value);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) {
        _controller.text = value;
        // Implement auto-complete logic here
        // You can filter the 'autoCompleteOptions' list based on the input 'value'
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
