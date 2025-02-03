import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/function/navigator.dart';
import 'package:Thimar/core/utils/assets.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:Thimar/feature/address/presentation/bloc/add_address_bloc.dart';
import 'package:Thimar/feature/address/presentation/bloc/add_address_event.dart';
import 'package:Thimar/feature/address/presentation/bloc/add_address_state.dart';
import 'package:Thimar/feature/address/presentation/view/add_address.dart';
import 'package:Thimar/feature/add_address_bottom_sheet/widgets/custom_new_address.dart';
import 'package:Thimar/feature/home/presentation/widgets/custom_app_bar_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Address extends StatefulWidget {
  const Address({
    super.key,
  });

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  void initState() {
    super.initState();
    context.read<AddAddressBloc>().add(GetAddressEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocConsumer<AddAddressBloc, AddAddressState>(
          buildWhen: (previous, current) =>
              current is GetAddressSuccess || current is GetAddressLoading,
          listener: (context, state) {
            if (state is DeleteAddressSuccessState) {
              scaffoldMessenger(context, "تم حذف العنوان بنجاح");
            }
          },
          builder: (context, state) {
            if (state is GetAddressSuccess) {
              var itemShow =
                  context.read<AddAddressBloc>().getAddressResponseModel?.data;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(60),
                    CustomAppBarRow(
                      text: "العناوين",
                      iconButton: Icons.arrow_back_ios_new,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: itemShow?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 10, left: 10),
                                height: 110,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: buttonColor, width: 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "المنزل",
                                          style: Styles.textStyle15.copyWith(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              context
                                                  .read<AddAddressBloc>()
                                                  .add(DeleteAddressEvent(
                                                      id: itemShow?[index].id ??
                                                          0));
                                              // id: itemShow?[index].id ?? 0));
                                              context
                                                  .read<AddAddressBloc>()
                                                  .add(GetAddressEvent());
                                            });
                                          },
                                          child: SvgPicture.asset(
                                            AssetData.delete,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: SvgPicture.asset(
                                            AssetData.edit,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "العنوان : 119 طريق الملك عبدالعزيز",
                                      style: Styles.textStyle14.copyWith(
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      itemShow?[index].description ?? "",
                                      // itemShow?.description ?? "",
                                      // "الوصف",
                                      style: Styles.textStyle14.copyWith(
                                          color: Color(0xff999797),
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Text(
                                      itemShow?[index].phone ?? "",
                                      // itemShow?.phone ?? "",
                                      //  data.id.toInt()

                                      // "رقم الجوال",
                                      style: Styles.textStyle14.copyWith(
                                          color: Color(0xff999797),
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                              Gap(10),
                            ],
                          );
                        },
                      ),
                    ),
                    CustomNDottedBorderButton(
                        text: "إضافة عنوان",
                        color: buttonColor,
                        onPressed: () {
                          push(
                            context,
                            AddAddress(),
                          );
                        }),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
