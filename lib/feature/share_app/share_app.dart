import 'dart:io';

import 'package:Thimar/core/constant/app_constant.dart';
import 'package:Thimar/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class ShareApp extends StatefulWidget {
  const ShareApp({super.key});

  @override
  State<ShareApp> createState() => _ShareAppState();
}

class _ShareAppState extends State<ShareApp> {
  // share() async {
  //   http.Response response = await http.get(Uri.parse(
  //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtpIG-rXt0RGqCvBY1S7GdhbRY_l9Nj0mQvA&s"));

  //       if (response.statusCode == 200){
  //         final dir = await getTemporaryDirectory();
  //         final files = File("${dir.path}/test.png");
  //         files.writeAsBytes(response.bodyBytes);

  //         final result = await Share.shareXFiles([XFile("${files.path}")],
  //         text: "share picture" , subject: "asd",
  //         );
  //       }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () async {
            const urlImage =
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtpIG-rXt0RGqCvBY1S7GdhbRY_l9Nj0mQvA&s";
            final url = Uri.parse(urlImage);
            final response = await http.get(url);
            final bytes = response.bodyBytes;
            final temp = await getTemporaryDirectory();
            final path = "${temp.path}/image.jpg";
            File(path).writeAsBytesSync(bytes);
            await Share.shareXFiles(
              [
                XFile(path),
              ],
              text: "تم مشاركة",
            );
          },
          child: Text(
            "مشاركة التطبيق",
            style: Styles.textStyle16.copyWith(
              color: buttonColor,
            ),
          ),
        ),
      ),
    );
  }
}
