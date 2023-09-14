import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/cubit/app_cubits.dart';
import 'package:trips/misc/colors.dart';
import 'package:trips/widgets/app_large_text.dart';
import 'package:trips/widgets/app_text.dart';
import 'package:trips/widgets/responsive_button.dart';

class Welcompage extends StatefulWidget {
  Welcompage({super.key});

  @override
  State<Welcompage> createState() => _WelcompageState();
}

class _WelcompageState extends State<Welcompage> {
  List images = [
    "welcome-one.jpg",
    "welcome-two.jpg",
    "welcome-three.jpg",
  ];
  List text = [""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('img/${images[index]}'),
                      fit: BoxFit.cover)),
              child: Container(
                margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Travel Tour"),
                        AppText(text: "Du Lịch Cùng Travel Tour", size: 22),
                        SizedBox(height: 20),
                        Container(
                          width: 250,
                          child: AppText(
                            text: "Đồng hành cùng Travel Tour, Travel Tour"
                                " sẽ đưa bạn đi khắp mọi miền của đất nước...",
                            color: Colors.white70,
                            size: 15,
                          ),
                        ),
                        SizedBox(height: 40),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                            width: 200,
                            child: Row(
                              children: [ResponsiveButton(width: 120)],
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
