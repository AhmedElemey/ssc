import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/main_bg.png",
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                buildAppBarRow(),
                const SizedBox(
                  height: 5,
                ),
                buildText("Hi,", Colors.white, FontWeight.w800, 18.0),
                const SizedBox(
                  height: 5,
                ),
                buildText("Welcome User", Colors.white.withOpacity(0.75),
                    FontWeight.w600, 18.0),
                const SizedBox(
                  height: 20,
                ),
                buildWeatherContainer(screenWidth, screenHeight),
                const SizedBox(
                  height: 15,
                ),
                buildServiceType(screenWidth, screenHeight),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildText(
                          "Services", Colors.white, FontWeight.w900, 22.0),
                      buildText(
                          "View All", Colors.white, FontWeight.w500, 15.0),
                    ],
                  ),
                ),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (ctx, index) {
                    return Container(
                      width: screenWidth * 0.88,
                      height: screenHeight * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                              height: screenHeight * 0.1,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(climateImages[index])),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildText(climateStatus[index], Colors.white,
                                  FontWeight.w500, 15.0),
                              buildText(climateStatus2[index], Colors.white,
                                  FontWeight.w500, 15.0),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: climateImages.length,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<String> climateImages = [
    "assets/images/Climate Data Icon.png",
    "assets/images/Request a weather report.png",
    "assets/images/FreeForecast.png",
  ];
  List<String> climateStatus = [
    "Climate Data",
    "Request A Weather",
    "Free Forecast Report",
  ];
  List<String> climateStatus2 = [
    "Request",
    "Report",
    "Request",
  ];

  List<String> images = [
    "assets/images/weather_icon02.png",
    "assets/images/weather_icon02.png",
    "assets/images/weather_icon01.png",
    "assets/images/weather_icon04.png",
    "assets/images/weather_icon06.png",
    "assets/images/weather_icon05.png",
    "assets/images/weather_icon06.png",
  ];
  List<String> days = ["Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed"];
  List<String> colors = [
    "assets/images/Stats01.png",
    "assets/images/Stats02.png",
    "assets/images/Stats03.png",
  ];
  List<String> degrees = [
    "53",
    "33",
    "20",
  ];
  List<String> status = [
    "Service Applied",
    "Service Approved",
    "Service Rejected",
  ];

  Container buildServiceType(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth,
      height: screenHeight * .2,
      padding: const EdgeInsets.only(left: 10),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            width: 25,
          );
        },
        itemBuilder: (ctx, index) {
          return SizedBox(
            width: screenWidth * 0.25,
            height: screenHeight * .2,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    colors[index],
                    fit: BoxFit.cover,
                    width: screenWidth * 0.25,
                    height: screenHeight * .2,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: buildText(degrees[index], Colors.white,
                            FontWeight.w300, 50.0)),
                    Container(
                        padding: const EdgeInsets.only(left: 10, top: 15),
                        width: screenWidth * 0.2,
                        child: buildText(status[index], Colors.white,
                            FontWeight.w400, 12.0)),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: colors.length,
      ),
    );
  }

  Row buildAppBarRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/White_logo.png",
          height: 75,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/search.png",
                height: 26,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/notification_icon.png",
                height: 30,
              ),
            )
          ],
        )
      ],
    );
  }

  Center buildWeatherContainer(double screenWidth, double screenHeight) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: screenWidth * 0.88,
        height: screenHeight * 0.45,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildText("Wednesday, August 06", Colors.white.withOpacity(0.75),
                FontWeight.w500, 15.0),
            const SizedBox(
              height: 5,
            ),
            buildText(
                "Riyadh, Saudi Arabia", Colors.white, FontWeight.w600, 20.0),
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              "assets/images/Weather_icon.png",
            ),
            const SizedBox(
              height: 15,
            ),
            buildText("Partly Cloud", Colors.white.withOpacity(0.75),
                FontWeight.w500, 15.0),
            const SizedBox(
              height: 5,
            ),
            buildText("27°", Colors.white, FontWeight.w300, 65.0),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              width: screenWidth,
              height: 55,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                    width: 18,
                  );
                },
                itemBuilder: (ctx, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(images[index]),
                      buildText(days[index].toUpperCase(), Colors.white,
                          FontWeight.w400, 15.0),
                    ],
                  );
                },
                itemCount: days.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text buildText(text, color, fontWeight, size) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: fontWeight, fontSize: size),
    );
  }
}
