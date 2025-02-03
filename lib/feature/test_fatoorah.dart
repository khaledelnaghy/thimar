// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:my_fatoorah/my_fatoorah.dart';

// class ListViewPage extends StatelessWidget {
//   const ListViewPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('ListView Payment')),
//         body: MyFatoorah(
//           onResult: (response) {
//             log(response.status.toString());
//             log('response: ${response.paymentId}');
//           },
//           request: MyfatoorahRequest.test(
//             currencyIso: Country.SaudiArabia,
//             successUrl:
//                 'https://openjournalsystems.com/file/2017/07/payment-success.png',
//             errorUrl: 'https://www.google.com',
//             invoiceAmount: 120,
//             language: ApiLanguage.Arabic,
//             token:
//                 "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL",
//           ),
//         ));
//   }
// }


// static Future<void> verifiyData(
//       VerifiyEvent event, Emitter<AuthState> emit) async {
//     emit(VerifyLoadingState());
//     print(
//         "Phone: ${event.phone}, Code: ${event.code}, Type: ${event.type}, Device Token: ${event.deviceToken}");
//    var response =  await AuthRepo.verifiyCodoRepo(
//           event.phone, event.code, event.type, event.deviceToken);
      
//       if (response  == true) {
//        String? token = await LocalStorage.getData(key: LocalStorage.token);
        
//         if (token != null){
//             LocalStorage.cacheData(key: LocalStorage.token, value: token);
//         }
//         emit(VerifySuccessState());
//       } else {
//         emit(VerifyErrorState(errorMesaage: "الكود غير صحيح  "));
//       }
//     }