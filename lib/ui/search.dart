import 'package:flightdetails/bloc/search_bloc.dart';
import 'package:flightdetails/repository/ModelClass/FlightModelClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

TextEditingController Search = TextEditingController();
late FlightModelClass data;

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h, left: 15.w),
              child: Text(
                "Search your flight ",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: SizedBox(
                        width: 300.w,
                        height: 45.h,
                        child: CupertinoSearchTextField(
                          controller: Search,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<SearchBloc>(context)
                            .add(FetchSearch(search: Search.text));
                      },
                      child: Icon(
                        CupertinoIcons.search_circle_fill,
                        size: 35,
                      ),
                    ),
                  )
                ],
              ),
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchStateLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                if (state is SearchStateError) {
                  return Center(
                    child: Text("No Connection"),
                  );
                }
                if (state is SearchStateLoaded) {
                  data = BlocProvider.of<SearchBloc>(context).flightModelClass;
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 25.h, left: 15.w),
                        child: Container(
                          width: 330.w,
                          height: 165.h,
                          decoration:
                              BoxDecoration(color: CupertinoColors.systemGrey4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10.h, left: 15.w),
                                child: Text(
                                  data.rows![0].name.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 40.sp),
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
                                      "Code : ${data.rows![0].code.toString()}",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 75.w),
                                    child: Text(
                                      "ICAO : ${data.rows![0].icao.toString()}",
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
                      )
                    ],
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
