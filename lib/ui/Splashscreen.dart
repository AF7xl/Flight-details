import 'package:flightdetails/ui/bnb.dart';
import 'package:flightdetails/ui/page%201.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreen();
}

class _splashscreen extends State<splashscreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const bnb()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 250.h,
          ),
          SizedBox(
              width: double.infinity,
              height: 150.h,
              child: Image.asset("assets/plane.png")),
          Text(
            "PLANE",
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            "know about your favourite flight",
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14.sp,
                color: Colors.grey),
          )
        ],
      ),
    );
  }
}
