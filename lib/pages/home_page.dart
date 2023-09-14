import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/app_cubit_states.dart';
import 'package:trips/cubit/app_cubits.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/widgets/app_large_text.dart';
import 'package:trips/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloon.png": "Ballooning",
    "beach.png": "Beach",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // menu text
                Container(
                  padding: EdgeInsets.only(top: 55, left: 20),
                  child: Row(
                    children: [
                      Positioned(
                          left: 20,
                          top: 50,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<AppCubits>(context).welcome();
                                },
                                icon: Icon(Icons.arrow_back_ios),
                                color: Colors.black54,
                              ),
                            ],
                          )),
                      Expanded(child: Container()),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                          image: DecorationImage(
                            image: AssetImage(
                              "img/user.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: AppLargeText(
                    text: "Phổ biến",
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                // tabbar
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: EdgeInsets.only(left: 20, right: 20),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(
                          color: AppColors.mainColor, radius: 4),
                      tabs: [
                        Tab(text: "Miền Tây"),
                        Tab(text: "Miền Trung"),
                        Tab(text: "Miền Bắc")
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context)
                                  .detailPage(info[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "http://mark.bslmeiyu.com/uploads/${info[index].img}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context)
                                  .detailPage(info[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "http://mark.bslmeiyu.com/uploads/${info[index].img}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context)
                                  .detailPage(info[index]);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "http://mark.bslmeiyu.com/uploads/${info[index].img}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                          text: "Đặt tour ngay !",
                          size: 22,
                          color: Colors.black),
                      AppText(text: "Tất cả", color: AppColors.textColor1),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              Container(
                                // margin:  EdgeInsets.only(right: 50),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "img/${images.keys.elementAt(index)}"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: AppColors.textColor2,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
