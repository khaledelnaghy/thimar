import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/address/data/model/request/add_address_params.dart';
import 'package:Thimar/feature/address/presentation/bloc/add_address_bloc.dart';
import 'package:Thimar/feature/address/presentation/bloc/add_address_event.dart';
import 'package:Thimar/feature/address/presentation/bloc/add_address_state.dart';
import 'package:Thimar/feature/auth/presentation/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({
    super.key,
  });

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  int index = 0;

  var formkey = GlobalKey<FormState>();
  // var lattuideController = TextEditingController();
  // var longtitudeController = TextEditingController();
  var phoneController = TextEditingController();
  var describtionController = TextEditingController();
  // var typeController = TextEditingController();
  // var isDefault = TextEditingController();
  // var locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                'assets/icons/arrow_back.svg',
                height: 20,
                width: 20,
                fit: BoxFit.contain,
              )),
        ),
        title: Text(
          "إضافة عنوان",
          style: Styles.textStyle20.copyWith(
            color: buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<AddAddressBloc, AddAddressState>(
          buildWhen: (previous, current) =>
              current is StoreAddressSuccess || current is StoreAddressLoading,
          listener: (context, state) {
            if (state is StoreAddressSuccess) {
              scaffoldMessenger(context, "تم إضافةالعنوان بنجاح");
              context.read<AddAddressBloc>().add(GetAddressEvent());
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Gap(10),
                      SizedBox(
                        width: double.infinity,
                        child: SvgPicture.asset(
                          'assets/images/map.svg',
                          height: 220,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Gap(30),
                      Row(
                        children: [
                          Text(
                            "نوع العمل",
                            style: Styles.textStyle15.copyWith(
                              color: Color(0xff000000),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index == 0 ? buttonColor : Colors.white,
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 0;
                                  });
                                },
                                child: Text(
                                  "المنزل",
                                  style: Styles.textStyle15.copyWith(
                                    color:
                                        index == 0 ? Colors.white : buttonColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 60,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index == 1 ? buttonColor : Colors.white,
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    index = 1;
                                  });
                                },
                                child: Text(
                                  "العمل",
                                  style: Styles.textStyle15.copyWith(
                                    color:
                                        index == 1 ? Colors.white : buttonColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      Gap(20),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "يرجي إدخال رقم الهاتف";
                          }
                          return null;
                        },
                        controller: phoneController,
                        decoration:
                            const InputDecoration(hintText: 'أدخل رقم الهاتف'),
                      ),
                      Gap(20),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "يرجي إدخال الوصف";
                          }
                          return null;
                        },
                        controller: describtionController,
                        decoration: const InputDecoration(hintText: 'الوصف'),
                      ),
                      Gap(80),
                      CustomButton(
                        text: "إضافة عنوان",
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            context.read<AddAddressBloc>().add(
                                  StoreAddressEvent(
                                    params: AddAddressParams(
                                        type: "work",
                                        phone: phoneController.text,
                                        description: describtionController.text,
                                        location: "test",
                                        langitude: "520",
                                        latitude: "11115",
                                        isdefault: "1"),
                                  ),
                                );
                          }
                        },
                        color: buttonColor,
                        weight: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
