import 'dart:convert';
import 'dart:developer';
 import 'package:Thimar/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';

// const String mAPIUrl = "https://api.myfatoorah.com";

// You can get the API Token Key from here:
// https://myfatoorah.readme.io/docs/test-token

///live key
const String mAPIKey =
    "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL";
const mfEnvironment = MFEnvironment.TEST;

class PaymentMyFatoorah extends StatefulWidget {
  final double amount;

  final Function(String) onSuccess;

  PaymentMyFatoorah({Key? key, required this.amount, required this.onSuccess})
      : super(key: key);

  @override
  _PaymentMyFatoorahState createState() => _PaymentMyFatoorahState();
}

class _PaymentMyFatoorahState extends State<PaymentMyFatoorah> {
  // ignore: unused_field
  bool isAnimationVisible = false;
  String response = '';
  final String _loading = "Loading...";

  List<MFPaymentMethod> paymentMethods = [];
  List<bool> isSelected = [];
  int selectedPaymentMethodIndex = -1;

  // String amount = widget.amount.toString();
  // String cardNumber = "5453010000095489";
  // String expiryMonth = "5";
  // String expiryYear = "21";
  // String securityCode = "100";
  // String cardHolderName = "Mahmoud Ibrahim";
  bool visibilityObs = false;

  @override
  void initState() {
    super.initState();

    // MFSDK.init(mAPIUrl, mAPIKey);
    MFSDK.init(mAPIKey, MFCountry.SAUDIARABIA, mfEnvironment);

    initiatePayment();
  }

  void initiatePayment() {
    var request = MFInitiatePaymentRequest(
        invoiceAmount: widget.amount,
        currencyIso: MFCurrencyISO.SAUDIARABIA_SAR);

    MFSDK
        .initiatePayment(request, MFLanguage.ENGLISH)
        .then((value) => {
              log('-=-=-=-==--= ${jsonEncode(value.toJson())}'),
              paymentMethods.addAll(value.paymentMethods!),
              for (int i = 0; i < paymentMethods.length; i++)
                setState(() {
                  isSelected.add(false);
                })
            })
        // ignore: body_might_complete_normally_catch_error
        .catchError((error) {
      print('-=-=-=-=-= error ${error.toString()}');
    });

    setState(() {
      response = _loading;
    });
  }

  /*
    Execute Regular Payment
   */
  // executeRegularPayment(int paymentMethodId) async {
  //   var request = MFExecutePaymentRequest(
  //       paymentMethodId: paymentMethodId, invoiceValue: widget.amount);
  //   request.displayCurrencyIso = MFCurrencyISO.SAUDIARABIA_SAR;

  //   // var recurring = MFRecurringModel();
  //   // recurring.intervalDays = 10;
  //   // recurring.recurringType = MFRecurringType.Custom;
  //   // recurring.iteration = 2;
  //   // request.recurringModel = recurring;

  //   await MFSDK.executePayment(request, MFLanguage.ENGLISH, (invoiceId) {
  //     log('-=-=---=- invoiceId $invoiceId');
  //   }).then((value) {
  //     if (value.invoiceTransactions?.isNotEmpty == true &&
  //         value.invoiceTransactions!.first.transactionStatus == 'Succss') {
  //       setState(() {
  //         isAnimationVisible = true; // عرض Lottie Animation
  //       });
  //       // log( '==--=-= value is toJson ${value.invoiceTransactions!.first.toJson()}');
  //       //
  //       // log( '==--=-= value is transactionStatus ${value.invoiceTransactions!.first.transactionStatus}');
  //       //
  //       // ColorFiltered(
  //       //   colorFilter: ColorFilter.mode(
  //       //       Color.fromARGB(180, 2, 225, 6), BlendMode.srcATop),
  //       //   child: Lottie.asset(
  //       //     'assets/lottie/loading_animation.json',
  //       //     height: 250,
  //       //     width: double.infinity,
  //       //   ),
  //       // );
  //       log('==--=-= value is transactionId ${value.invoiceTransactions!.first.transactionId}');
  //       widget.onSuccess(
  //           value.invoiceTransactions!.first.transactionId.toString());

  //       Navigator.pop(context);
  //     }
  //   }).catchError((error) {
  //     log('-=-=-=-=-=error${error.message}');

  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(error.message.toString())));
  //   });
  // }

  executeRegularPayment(int paymentMethodId) async {
    var request = MFExecutePaymentRequest(
        paymentMethodId: paymentMethodId, invoiceValue: widget.amount);
    request.displayCurrencyIso = MFCurrencyISO.SAUDIARABIA_SAR;

    await MFSDK.executePayment(request, MFLanguage.ENGLISH, (invoiceId) {
      log('-=-=---=- invoiceId $invoiceId');
    }).then((value) {
      if (value.invoiceTransactions?.isNotEmpty == true &&
          value.invoiceTransactions!.first.transactionStatus == 'Succss') {
        setState(() {
          isAnimationVisible = true; // عرض Lottie Animation
        });

        log('==--=-= value is transactionId ${value.invoiceTransactions!.first.transactionId}');
        widget.onSuccess(
            value.invoiceTransactions!.first.transactionId.toString());

        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            isAnimationVisible = false; // إخفاء Lottie بعد 3 ثوانٍ
          });
          Navigator.pop(context);
        });
      }
    }).catchError((error) {
      log('-=-=-=-=-=error${error.message}');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message.toString())));
    });
  }

  void setPaymentMethodSelected(int index, bool value) {
    for (int i = 0; i < isSelected.length; i++) {
      if (i == index) {
        isSelected[i] = value;
        if (value) {
          selectedPaymentMethodIndex = index;
          visibilityObs = paymentMethods[index].isDirectPayment!;
        } else {
          selectedPaymentMethodIndex = -1;
          visibilityObs = false;
        }
      } else {
        isSelected[i] = false;
      }
    }
  }

  void pay() {
    if (selectedPaymentMethodIndex == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('الرجاء تحديد طريق الدفع')));
    } else {
      executeRegularPayment(
          paymentMethods[selectedPaymentMethodIndex].paymentMethodId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(title: Text("إستكمال الدفع")),

      bottomNavigationBar: paymentMethods.isEmpty
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: isAnimationVisible ? null :
               CustomButton1(
                onPressed: () {
                  pay();
                },
                text:   "دفع",
                radius: 11,
              ),
            ),
//4464040000000007
      // RaisedButton(
      //   color: Colors.lightBlue,
      //   textColor: Colors.white,
      //   child: Text('Pay'),
      //   onPressed: pay,
      // ),
      // body: SafeArea(
      //   child: paymentMethods.isEmpty
      //       ? const Center(child: CircularProgressIndicator())
      //       : Column(
      //           children: [
      //             Expanded(
      //               child: ListView.builder(
      //                 itemCount: paymentMethods.length,
      //                 itemBuilder: (BuildContext ctx, int index) {
      //                   return
      //                       // ![
      //                       //         'ap',
      //                       //         'md',
      //                       //         'vm',
      //                       //       ].contains(paymentMethods[index].paymentMethodCode.toString()) ||
      //                       //       (paymentMethods[index].paymentMethodCode.toString() == 'ap' && !Platform.isIOS)
      //                       //   ? SizedBox.shrink()
      //                       //   :
      //                       Container(
      //                           decoration: BoxDecoration(
      //                               border: Border.all(
      //                                 color: Colors.grey,
      //                                 width: .2,
      //                               ),
      //                               borderRadius: BorderRadius.circular(8)),
      //                           child: Row(
      //                             children: <Widget>[
      //                               Checkbox(
      //                                   value: isSelected[index],
      //                                   onChanged: (bool? value) {
      //                                     setState(() {
      //                                       setPaymentMethodSelected(
      //                                           index, value!);
      //                                     });
      //                                   }),
      //                               Image.network(
      //                                 paymentMethods[index].imageUrl!,
      //                                 width: 40.0,
      //                                 height: 40.0,
      //                               ),
      //                               SizedBox(width: 10),
      //                               Expanded(
      //                                 child: Text(paymentMethods[index]
      //                                         .paymentMethodEn ??
      //                                     ""),
      //                               )
      //                             ],
      //                           ));
      //                 },
      //               ),
      //             ),

      //           ],
      //         ),
      // ),
      body: SafeArea(
  child: isAnimationVisible
      ? Center(
          child: Lottie.asset(
            'assets/lottie/verification_success.json',
            width: 200,
            height: 200,

          ),
        )
      : paymentMethods.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: paymentMethods.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: .2,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: <Widget>[
                              Checkbox(
                                  value: isSelected[index],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      setPaymentMethodSelected(index, value!);
                                    });
                                  }),
                              Image.network(
                                paymentMethods[index].imageUrl!,
                                width: 40.0,
                                height: 40.0,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(paymentMethods[index]
                                        .paymentMethodEn ??
                                    ""),
                              )
                            ],
                          ));
                    },
                  ),
                ),
              ],
            ),
),  
    );
  }
}
