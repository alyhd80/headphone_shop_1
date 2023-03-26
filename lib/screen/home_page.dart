import 'package:flutter/material.dart';
import 'package:headphone_shop/data/app_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> hoverAnimation;
  int currentIndex = 0;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700))
          ..repeat(reverse: true);
    hoverAnimation = Tween(begin: Offset(0, 0), end: Offset(0, 0.022))
        .animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff292929),
      body: SafeArea(
        child: Column(
          children: [
            SlideTransition(
                position: hoverAnimation,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 700),
                  child: Image.asset(
                    products[currentIndex].path,
                    key: ValueKey<int>(currentIndex),
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Text(
              "BOAT ROCKERZ 450R",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Bluetooth headphones",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 28,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(products.length, (index) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: products[index].color,
                      ),
                    ));
              }),
            )
          ],
        ),
      ),
    );
  }
}
