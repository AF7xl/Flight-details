import 'package:flightdetails/bloc/flight_bloc.dart';
import 'package:flightdetails/repository/ModelClass/FlightModelClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

late FlightModelClass data;

class _page1State extends State<page1> {
  @override
  void initState() {
    BlocProvider.of<FlightBloc>(context).add(FetchFlight());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/plane.png"),
        title: Padding(
          padding: EdgeInsets.only(left: 95.w),
          child: Text(
            "PLANE",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          )
        ],
      ),
      drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.only(top: 45.h)),
              ListTile(
                title: Text(
                  "about",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
              ListTile(
                title: Text(
                  "privacy&security",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
              ListTile(
                title: Text(
                  "Help",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<FlightBloc, FlightState>(
              builder: (context, state) {
                if (state is FlightStateLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                if (state is FlightStateError) {
                  return Center(
                    child: Text("No Connection"),
                  );
                }
                if (state is FlightStateLoaded) {
                  data = BlocProvider.of<FlightBloc>(context).flightModelClass;
                  return GridView.count(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    childAspectRatio:6 / 3,
                    mainAxisSpacing: 10,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(data.rows!.length, (index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: Container(
                          width: 280.w,
                          height: 90.h,
                          decoration:
                              BoxDecoration(color: CupertinoColors.systemGrey4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10.h, left: 15.w),
                                child: SizedBox(
                                  width: 300.w,
                                  height: 55.h,
                                  child: Text(
                                    data.rows![index].name.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 40.sp),
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 65.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20.w),
                                    child: Text(
                                      "Code : ${data.rows![index].code.toString()}",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 75.w),
                                    child: Text(
                                      "ICAO : ${data.rows![index].icao.toString()}",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
