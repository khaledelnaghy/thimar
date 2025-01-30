import 'dart:developer';

import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:Thimar/feature/add_address_bottom_sheet/widgets/add_address_bottom_sheet.dart';
import 'package:Thimar/feature/done_order/presentation/bloc/done_order_bloc.dart';
import 'package:Thimar/feature/done_order/presentation/bloc/done_order_event.dart';
import 'package:Thimar/feature/done_order/presentation/bloc/done_order_state.dart';
import 'package:Thimar/feature/done_order/presentation/view/saved_card_view.dart';
import 'package:Thimar/feature/done_order/presentation/widgets/address_bottom_sheet_order.dart';
import 'package:Thimar/feature/done_order/presentation/widgets/custom_container_house.dart';
import 'package:Thimar/feature/done_order/presentation/widgets/custom_payment_row.dart';
import 'package:Thimar/feature/done_order/presentation/widgets/custom_row_address_done_order.dart';
import 'package:Thimar/feature/done_order/presentation/widgets/custom_text_done_order.dart';
import 'package:Thimar/feature/done_order/presentation/widgets/custom_text_form_field.dart';
import 'package:Thimar/feature/done_order/presentation/widgets/custom_total_price.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class DoneOrder extends StatefulWidget {
  const DoneOrder({super.key});

  @override
  State<DoneOrder> createState() => _DoneOrderState();
}

class _DoneOrderState extends State<DoneOrder> {
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  String? title;
  String date = DateFormat('y-mm-dd').format(DateTime.now());
  String time = DateFormat("hh:mm").format(DateTime.now());
  int cheekColorBorder = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: BlocConsumer<OrderBloc, OrderState>(
            listener: (context, state) {
              if (state is ConfirmOrderSuccessState) {
                push(context, const SavedCardView());
              }
            },
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(40),
                  CustomAppBarRow(
                    iconButton: Icons.arrow_back_ios,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "إتمام الطلب ",
                  ),
                  CustomTextDoneOrder(
                    textName: "الإسم : محمد",
                    textNumber: "الجوال :05068285914",
                  ),
                  CustomRowAddress(
                    icon: Icons.add,
                    onPressed: () {},
                    textAddressDriver: "أختر عنوان التوصيل",
                  ),
                  Gap(15),
                  // DropdownButton<String>(
                  //   isDense: true,
                  //   value: title,
                  //   isExpanded: true,
                  //   items: [
                  //     DropdownMenuItem(
                  //       value: 'المنزل : 119 طريق الملك عبدالعزيز',
                  //       child: Text(
                  //         'المنزل : 119 طريق الملك عبدالعزيز',

                  //       ),

                  //     ),
                  //   ],
                  //   onChanged: (value){

                  //     setState(() {
                  //        title = value;
                  //     });
                  //   },
                  // ),
                  GestureDetector(
                    onTap: () {
                      showModelBottomSheetAddress(context);
                    },
                    child: CustomContainerHouse(
                      title: "المنزل:119 طريق الملك عبدالعزيز",
                      icon: Icons.arrow_drop_down,
                      onPressed: () {},
                    ),
                  ),
                  Gap(20),
                  Text(
                    "تحديد وقت التوصيل",
                    style: Styles.textStyle17.copyWith(
                      color: buttonColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(10),

                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: dateController,
                            onTap: () {
                              showDatePicker(
                                      initialDate: DateTime.now(),
                                      context: context,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2080))
                                  .then((value) {
                                setState(() {
                                  if (value != null) {
                                    date = DateFormat('y-MM-dd').format(value);
                                    log(date);
                                    setState(() {});
                                  }
                                });
                              });
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.access_time,
                                color: buttonColor,
                              ),
                              hintText: date,
                              hintStyle: Styles.textStyle16,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Gap(10),
                        Expanded(
                          child: TextFormField(
                            onTap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then(
                                (value) {
                                  if (value != null) {
                                    final now = DateTime.now();
                                    final dt = DateTime(now.year, now.month,
                                        now.day, value.hour, value.minute);
                                    time = DateFormat('hh:mm').format(dt);
                                    log(time);
                                    setState(() {});
                                  }
                                },
                              );
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.date_range,
                                  color: buttonColor,
                                ),
                                hintText: time,
                                hintStyle: Styles.textStyle16,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        )
                      ],
                    ),
                  ),
                  // CustomRowData(
                  //   iconDay: Icons.schedule,
                  //   iconTime: Icons.timelapse,
                  //   onPressedDay: () {
                  //     showDatePicker(
                  //             initialDate: DateTime.now(),
                  //             context: context,
                  //             firstDate: DateTime.now(),
                  //             lastDate: DateTime(2080))
                  //         .then((value) {
                  //       setState(() {
                  //         if (value != null) {
                  //           date = DateFormat('y-MM-dd').format(value);
                  //           log(date);
                  //           setState(() {});
                  //         }
                  //       });
                  //     });
                  //   },
                  //   onPressedTime: () {},
                  //   textDay: "أختر اليوم والتاريخ",
                  //   textTime: "أختيار الوقت",
                  // ),
                  Gap(20),
                  Text(
                    "ملاحظات وتعليمات",
                    style: Styles.textStyle17.copyWith(
                      color: buttonColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomTextFormFieldComments(),
                  Gap(10),
                  CustomPaymentRow(
                    text: "أختر طريقه الدفع",
                  ),
                  Gap(10),
                  Text(
                    "ملخص الطلب",
                    style: Styles.textStyle17.copyWith(
                      color: buttonColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomTotalPriceOrder(
                    priceDriver: "سعر التوصيل",
                    priceDriverNumber: "40 ر.س",
                    textTotal: "المجموع",
                    textDisCount: "الخصم",
                    textDisCountNumber: "-40ر.س",
                    textTotalNumber: "180ر.س",
                    textTotoalPrice: "إجمالي المنتج",
                    textTotoalPriceNumber: "40 ر.س",
                  ),

                  CustomButton(
                    onPressed: () {
                      context.read<OrderBloc>().add(ConfirmOrderEvent(
                          date: date,
                          time: time,
                          addressId: '1570',
                          payType: 'cash'));
                      // showModelBottomSheetDoneOrder(context);
                    },
                    text: "إنهاء الطلب",
                    color: buttonColor,
                  ),
                  Gap(10),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void showModelBottomSheetDoneOrder(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (context) {
          return const AddAddressBottomSheetOrder();
        });
  }

  void showModelBottomSheetAddress(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (context) {
          return const AddAddressBottomSheet();
        });
  }
}
