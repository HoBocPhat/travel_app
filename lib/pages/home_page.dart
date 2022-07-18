import 'package:flutter/material.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';

import '../misc/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  var images = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling'
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    const Icon(Icons.menu, size: 30, color: Colors.black54),
                    const Expanded(child: SizedBox()),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40),
              AppLargeText(text: "Discover"),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 0, right: 20),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicator: CircleIndicator(color: AppColors.mainColor, radius: 4),
                  tabs: const [
                    Tab(text: "Places"),
                    Tab(text: "Inspiration"),
                    Tab(text: "Emotions")
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                        padding: const EdgeInsets.only(right: 15, top: 20),
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index){
                          return Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage('img/mountain.jpeg'),
                                fit: BoxFit.cover
                              )
                            ),
                          );
                        }),
                    Text("Inspiration"),
                    Text("Emotions")
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(text: "Explore more", size: 22),
                    AppText(text: "See all", color: AppColors.textColor1),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 120,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index){
                      return Container(
                        padding: EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                //color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'img/' + images.keys.elementAt(index),
                                  ),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppText(text: images.values.elementAt(index), color: AppColors.textColor2)
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleIndicator extends Decoration{
  final Color color;
  final double radius;
  const CircleIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter{
  final Color color;
  final double radius;
  const _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset
      , ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2 - 10, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }

}