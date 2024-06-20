import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offline_kalteck_pos/utils/helper.dart';

import '../../../../../configs/theme_config.dart';
import '../../../../../constants/app_constants.dart';
import '../../../../../constants/asset_paths.dart';
import '../../../../../database/db_utils/db_categories.dart';
import '../../../../../database/models/category.dart';
import '../../../../../database/models/customer.dart';
import '../../../../../database/models/product.dart';
import '../../../../../utils/ui_utils/padding_margin.dart';
import '../../../../../utils/ui_utils/spacer_widget.dart';
import '../../../../../utils/ui_utils/text_styles/custom_text_style.dart';
import '../../../database/models/order_item.dart';
import '../../../network/api_helper/comman_response.dart';
import '../../../widgets/item_options.dart';
import '../../service/login/api/verify_instance_service.dart';
import '../widget/create_customer_popup.dart';
import '../widget/select_customer_popup.dart';
import '../widget/title_search_bar.dart';
import 'cart_widget.dart';

class CreateOrderLandscape extends StatefulWidget {
  final RxString selectedView;
  const CreateOrderLandscape({Key? key, required this.selectedView})
      : super(key: key);

  @override
  State<CreateOrderLandscape> createState() => _CreateOrderLandscapeState();
}

class _CreateOrderLandscapeState extends State<CreateOrderLandscape> {
  late TextEditingController searchCtrl;
  late Size size;
  Customer? customer;
  List<Product> products = [];
  List<Category> categories = [];
  // ParkOrder? parkOrder;
  late List<OrderItem> items;

  @override
  void initState() {
    items = [];
    searchCtrl = TextEditingController();
    super.initState();
    verify();
    getProducts();
    if (Helper.activeParkedOrder != null) {
      log("park order is active");
      customer = Helper.activeParkedOrder!.customer;
      items = Helper.activeParkedOrder!.items;
    }
  }

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    searchCtrl.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: _handleTap,
        child: Row(
          children: [
            SizedBox(
              width: size.width - 415,
              height: size.height,
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TitleAndSearchBar(
                    focusNode: _focusNode,
                    inputFormatter: [],
                    title: "Choose Category",
                    onSubmit: (text) {
                      if (text.length >= 3) {
                        categories.isEmpty
                            ? const Center(
                                child: Text(
                                "No items found",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                            : _filterProductsCategories(text);
                      } else {
                        getProducts();
                      }
                    },
                    onTextChanged: (changedtext) {
                      if (changedtext.length >= 3) {
                        categories.isEmpty
                            ? const Center(
                                child: Text(
                                "No items found",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                            : _filterProductsCategories(changedtext);
                      } else {
                        getProducts();
                      }
                    },
                    searchCtrl: searchCtrl,
                    searchHint: "Search product / category",
                    searchBoxWidth: size.width / 4,
                  ),
                  hightSpacer20,
                  categories.isEmpty
                      ? const Center(
                          child: Text(
                          "No items found",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                      : getCategoryListWidg(),
                  hightSpacer20,
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          categories.isEmpty
                              ? const Center(
                                  child: Text(
                                  "No items found",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                              : getCategoryItemsWidget(categories[index]),
                          hightSpacer10
                        ],
                      );
                    },
                  ),
                ],
              )),
            ),
            Padding(
              padding: leftSpace(x: 5),
              child: CartWidget(
                customer: customer,
                orderList: items,
                onHome: () {
                  widget.selectedView.value = "Home";
                  items.clear();
                  customer = null;
                  setState(() {});
                },
                onPrintReceipt: () {
                  widget.selectedView.value = "Home";
                  items.clear();
                  customer = null;
                  setState(() {});
                },
                onNewOrder: () {
                  customer = null;
                  items = [];
                  setState(() {});
                },
              ), //_cartWidget()
            ),
          ],
        ));
  }

  getCategoryItemsWidget(Category cat) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            cat.name,
            style: getTextStyle(
              fontSize: LARGE_FONT_SIZE,
            ),
          ),
        ),
        hightSpacer10,
        SizedBox(
          height: 140,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cat.items.length,
              itemBuilder: (BuildContext context, index) {
                // return Container(
                //     margin: const EdgeInsets.only(left: 8, right: 8),
                //     child: InkWell(
                //       onTap: () {
                //         if (customer == null) {
                //           _handleCustomerPopup();
                //         } else {
                //           var item =
                //               OrderItem.fromJson(cat.items[index].toJson());
                //           _openItemDetailDialog(context, item);
                //           debugPrint("Item clicked $index");
                //         }
                //       },
                //       child: Stack(
                //         alignment: Alignment.topCenter,
                //         children: [
                //           Align(
                //             alignment: Alignment.bottomCenter,
                //             child: Container(
                //               margin: paddingXY(x: 5, y: 5),
                //               padding: paddingXY(y: 0, x: 10),
                //               width: 145,
                //               height: 105,
                //               decoration: BoxDecoration(
                //                   color: WHITE_COLOR,
                //                   borderRadius: BorderRadius.circular(10)),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment: CrossAxisAlignment.stretch,
                //                 children: [
                //                   hightSpacer25,
                //                   SizedBox(
                //                     child: Text(
                //                       cat.items[index].name,
                //                       maxLines: 2,
                //                       overflow: TextOverflow.ellipsis,
                //                       style: getTextStyle(
                //                           color: DARK_GREY_COLOR,
                //                           fontWeight: FontWeight.w500,
                //                           fontSize: SMALL_PLUS_FONT_SIZE),
                //                     ),
                //                   ),
                //                   hightSpacer5,
                //                   Text(
                //                     "$appCurrency ${cat.items[index].price.toStringAsFixed(2)}",
                //                     textAlign: TextAlign.right,
                //                     style: getTextStyle(
                //                         color: MAIN_COLOR,
                //                         fontSize: MEDIUM_FONT_SIZE),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //           Container(
                //             height: 60,
                //             width: 60,
                //             decoration:
                //                 const BoxDecoration(shape: BoxShape.circle),
                //             clipBehavior: Clip.antiAliasWithSaveLayer,
                //             child: cat.items[index].productImage.isNotEmpty
                //                 ? Image.memory(cat.items[index].productImage,
                //                     fit: BoxFit.fill)
                //                 : SvgPicture.asset(
                //                     PRODUCT_IMAGE,
                //                   ),
                //           ),
                //         ],
                //       ),
                //     ));
                return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                        onTap: () {
                          _handleTap();

                          if (customer == null) {
                            _handleCustomerPopup();
                          } else {
                            if (cat.items[index].stock > 0) {
                              var item =
                                  OrderItem.fromJson(cat.items[index].toJson());
                              log('Selected Item :: $item');
                              _openItemDetailDialog(context, item);
                            } else {
                              Helper.showPopup(
                                  context, 'Sorry, item is not in stock.');
                            }
                          }
                        },
                        child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                cat.items[index].stock > 0
                                    ? Colors.transparent
                                    : Colors.white.withOpacity(0.6),
                                BlendMode.screen),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin: paddingXY(x: 5, y: 20),
                                    padding: paddingXY(y: 0, x: 10),
                                    width: 145,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: WHITE_COLOR,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        hightSpacer40,
                                        SizedBox(
                                          height: 20,
                                          child: Text(
                                            cat.items[index].name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: getTextStyle(

                                                // color: DARK_GREY_COLOR,
                                                // fontWeight: FontWeight.w500,
                                                fontSize: MEDIUM_FONT_SIZE),
                                          ),
                                        ),
                                        hightSpacer4,
                                        Text(
                                          "$appCurrency ${cat.items[index].price.toStringAsFixed(2)}",
                                          textAlign: TextAlign.end,
                                          style: getTextStyle(
                                              color: MAIN_COLOR,
                                              fontSize: SMALL_PLUS_FONT_SIZE),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: WHITE_COLOR),
                                        shape: BoxShape.circle),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      height: 58,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle),
                                      child: cat
                                              .items[index].productImage.isEmpty
                                          ? Image.asset(BURGAR_IMAGE)
                                          : Image.memory(
                                              cat.items[index].productImage),
                                    )),
                                Container(
                                    padding: const EdgeInsets.all(6),
                                    margin: const EdgeInsets.only(left: 45),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: GREEN_COLOR),
                                    child: Text(
                                      cat.items[index].stock.toInt().toString(),
                                      style: getTextStyle(
                                          fontSize: SMALL_FONT_SIZE,
                                          color: WHITE_COLOR),
                                    ))
                              ],
                            ))));
              }),
        ),
      ],
    );
  }

  _openItemDetailDialog(BuildContext context, OrderItem product) async {
    product.orderedPrice = product.price;
    if (product.orderedQuantity == 0) {
      product.orderedQuantity = 1;
    }
    var res = await showDialog(
        context: context,
        builder: (context) {
          return ItemOptions(orderItem: product);
        });
    if (res == true) {
      items.add(product);
    }
    setState(() {});
  }

  getCategoryListWidg() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              child: categories.isEmpty
                  ? const Center(
                      child: Text(
                      "No items found",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ))
                  : Container(
                      margin: paddingXY(y: 5),
                      width: 100,
                      decoration: BoxDecoration(
                        color: WHITE_COLOR,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            height: 60,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.amber),
                            child: categories[index].image.isNotEmpty
                                ? Image.memory(
                                    categories[index].items.first.productImage,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.fill,
                                  )
                                : Image.asset(
                                    BURGAR_IMAGE,
                                    height: 55,
                                    width: 55,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          Text(
                            categories[index].name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: getTextStyle(
                              fontSize: LARGE_FONT_SIZE,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
            );
          }),
    );
  }

  Future<void> getProducts() async {
    //Fetching data from DbProduct database
    categories = await DbCategory().getCategories();
    setState(() {});
  }

  _handleCustomerPopup() async {
    final result = await Get.defaultDialog(
      // contentPadding: paddingXY(x: 0, y: 0),
      title: "",
      titlePadding: paddingXY(x: 0, y: 0),
      // custom: Container(),
      content: SelectCustomerPopup(
        customer: customer,
      ),
    );
    if (result.runtimeType == String) {
      customer = await Get.defaultDialog(
        // contentPadding: paddingXY(x: 0, y: 0),
        title: "",
        titlePadding: paddingXY(x: 0, y: 0),
        // custom: Container(),
        content: CreateCustomerPopup(
          phoneNo: result,
        ),
      );
    }
    if (result != null && result.runtimeType == Customer) {
      customer = result;
      debugPrint("Customer selected");
    }
    setState(() {});
  }

  void _filterProductsCategories(String searchTxt) {
    categories = categories
        .where((element) =>
            element.items.any((element) =>
                element.name.toLowerCase().contains(searchTxt.toLowerCase())) ||
            element.name.toLowerCase().contains(searchTxt.toLowerCase()))
        .toList();

    setState(() {});
  }

  verify() async {
    CommanResponse res = await VerificationUrl.checkAppStatus();
    if (res.message == true) {
    } else {
      Helper.showPopup(context, "Please update your app to latest version",
          barrierDismissible: true);
    }
  }
}
