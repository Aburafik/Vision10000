// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
    theme: ThemeData(scaffoldBackgroundColor: Color(0xff5F23B6)),
  ));
}

class MyHomePage extends StatelessWidget {
  List list = [
    buttonText("Home"),
    buttonText("Services"),
    buttonText("Work"),
    sunbmitButton()
  ];

  List<Widget> pages = [Home(), Services(), Work(), ApplyButtonPage()];

  var colors = [Color(0xff5F23B6), Colors.red, Colors.yellow, Colors.purple];

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    TextStyle _testStyle = Theme.of(context)
        .textTheme
        .headline1!
        .copyWith(fontSize: 20, fontWeight: FontWeight.w900);
    return Scaffold(
      backgroundColor: Color(0xff5F23B6),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Color(0xff5F23B6),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: "Vison",
                        style: _testStyle.copyWith(color: Colors.white),
                        children: [
                          TextSpan(
                              text: "10000",
                              style: _testStyle.copyWith(color: Colors.red))
                        ]),
                  ),
                  // Image(image: AssetImage("images/vlogo.png")),
                  // Container(
                  //   width: 50,
                  //   height: 50,
                  //   // margin: EdgeInsets.all(8),
                  //   decoration: BoxDecoration(
                  //       color: Color(0xffffffff),
                  //       borderRadius: BorderRadius.circular(10)),
                  // ),
                  Spacer(),
                  Row(
                    children: List.generate(3, (index) {
                      return GestureDetector(
                        onTap: () {
                          _scrollToIndex(index);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 35, vertical: 15),
                          child: list[index + 1],
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
            Expanded(
              child: PageView(
                  scrollDirection: Axis.vertical,
                  pageSnapping: false,
                  controller: controller,
                  children: List.generate(pages.length, (index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: double.maxFinite,
                      color: colors[index],
                      child: Center(
                        child: pages[index],
                        //  Text(
                        //   // list[index],
                        //   "",
                        //   style: TextStyle(color: Colors.white, fontSize: 50),
                        // ),
                      ),
                    );
                  })),
            ),
          ],
        ),
      )),
    );
  }

  void _scrollToIndex(int index) {
    controller.animateToPage(index + 1,
        duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 60, color: Colors.white);
    return Scaffold(
      body: Container(
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text("Vision 1000"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Girls who",
                  style: textStyle,
                ),
                Text(
                  "Code",
                  style: textStyle,
                ),
                Text(
                  "rule the future",
                  style: textStyle,
                ),
                Text(
                    "Don't be left out, join the community to build yourself in tech for sustanable employemnt")
              ],
            ),
            Image(image: AssetImage("images/coders.gif")),
          ],
        ),
      ),
    );
  }
}

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.black,
        child: Text("njdfkjdfjkdfjdfdf"),
      ),
    );
  }
}

class Work extends StatelessWidget {
  const Work({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("njdfkjdfjkdfjdfdf"),
      ),
    );
  }
}

class ApplyButtonPage extends StatelessWidget {
  const ApplyButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("njdfkjdfjkdfjdfdf"),
      ),
    );
  }
}

buttonText(String text) {
  return Text(
    text,
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
  );
}

sunbmitButton() {
  return const Material(
    color: Color(0xffFFFFF),
    // onPressed: () {},
    child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Text(
          "Click",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        )),
  );
}




// class SliverAppBarWithTabBar extends StatefulWidget {
//   @override
//   _SliverAppBarWithTabBarState createState() => _SliverAppBarWithTabBarState();
// }

// class _SliverAppBarWithTabBarState extends State<SliverAppBarWithTabBar> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: DefaultTabController(
//           length: 3,
//           child: NestedScrollView(
//             headerSliverBuilder:
//                 (BuildContext context, bool innerBoxIsScrolled) {
//               return <Widget>[
//                 SliverAppBar(
//                   pinned: false,
//                   expandedHeight: 100.0,
//                   actions: [],
//                   leading: Row(children: [],),
//                   flexibleSpace: FlexibleSpaceBar(
//                     title: Text('Goa', textScaleFactor: 1),
//                     // background: Image.asset(
//                     //   'assets/images/beach.png',
//                     //   fit: BoxFit.fill,
//                     // ),
//                     stretchModes: [StretchMode.zoomBackground],
//                   ),
//                   //collapsedHeight: 100,
//                 ),
//                 SliverPersistentHeader(
//                   delegate: MySliverPersistentHeaderDelegate(
//                     TabBar(
//                       tabs: [
//                         Tab(icon: Icon(Icons.flight)),
//                         Tab(icon: Icon(Icons.directions_transit)),
//                         Tab(icon: Icon(Icons.directions_car)),
//                       ],
//                     ),
//                   ),
//                   pinned: true,
//                 ),
//               ];
//             },
//             body: TabBarView(
//               children: [
//                 Icon(Icons.flight, size: 350),
//                 Icon(Icons.directions_transit, size: 350),
//                 Icon(Icons.directions_car, size: 350),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
//   MySliverPersistentHeaderDelegate(this._tabBar);

//   final TabBar _tabBar;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;
//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return new Container(
//       color: Colors.blue,
//       child: _tabBar,
//     );
//   }

//   @override
//   bool shouldRebuild(MySliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }
