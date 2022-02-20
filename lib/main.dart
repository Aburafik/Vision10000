// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
    theme: ThemeData(scaffoldBackgroundColor: Color(0xffffffff)),
  ));
}

const Color cardOneColor = Color(0xffF9E9E9);
const Color cardTwoColor = Color(0xffF8F1E7);
const Color cardThreeColor = Color(0xffE7F6F6);

class MyHomePage extends StatelessWidget {
  List list = [
    buttonText("Home"),
    buttonText("What We Do"),
    buttonText("Latest News"),
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
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: Color(0xff5F23B6),
            child: Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: "Vison",
                      style: _testStyle.copyWith(
                          color: Colors.white, fontFamily: "Lato-Bold"),
                      children: [
                        TextSpan(
                            text: "10000",
                            style: _testStyle.copyWith(
                                color: Colors.red, fontFamily: "Lato-Bold"))
                      ]),
                ),
                Spacer(),
                Row(
                  children: List.generate(3, (index) {
                    return GestureDetector(
                      onTap: () {
                        _scrollToIndex(index);
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        child: list[index + 1],
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
          Expanded(
            // horizontal: MediaQuery.of(context).size.width / 10),
            child: PageView(
                scrollDirection: Axis.vertical,
                pageSnapping: false,
                controller: controller,
                children: List.generate(pages.length, (index) {
                  return Container(
                    // padding: EdgeInsets.symmetric(
                    //     horizontal: MediaQuery.of(context).size.width / 10),

                    // horizontal: MediaQuery.of(context).size.width / 10),

                    width: MediaQuery.of(context).size.width,
                    height: double.maxFinite,
                    // color: colors[index],
                    child: pages[index],
                  );
                })),
          ),
        ],
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
    // var textStyle = TextStyle(fontSize: 60, color: Color(0xff5F23B6));
    TextStyle textStyle = Theme.of(context).textTheme.headline1!.copyWith(
        color: Color(0xff5F23B6), fontFamily: "Lato-Bold", fontSize: 100);
    return Scaffold(
      body: Container(
        // color: Colors.red,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                      "Rule the future",
                      style: textStyle,
                    ),
                    Text(
                        "Don't be left out, join the community to build yourself in tech for sustanable employemnt")
                  ],
                ),
                Image(image: AssetImage("images/coders.gif")),
              ],
            ),
            MaterialButton(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Text(
                  "JOIN US",
                  style: textStyle.copyWith(color: Colors.white, fontSize: 20),
                ),
              ),
              onPressed: () {},
              color: Color(0xff5F23B6),
            )
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
    TextStyle textStyle = Theme.of(context).textTheme.headline1!.copyWith(
        color: Color(0xff5F23B6), fontFamily: "Lato-Bold", fontSize: 100);
    TextStyle textStyles = TextStyle(height: 2, fontSize: 16);

    return Scaffold(
      body: Center(
          // color: Colors.black,
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "We Provide Sustainable Job Skills",
            style: textStyle.copyWith(fontSize: 50),
          ),
          Text(
            "in the following Areas",
            style: textStyle.copyWith(fontSize: 50),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                skillsCard(
                    textStyle: textStyle,
                    color: cardOneColor,
                    courseTitle: "Software Development",
                    icon: Icons.laptop,
                    description:
                        "Learn how to build websites and mobile applications with practical projects"),
                skillsCard(
                    textStyle: textStyle,
                    color: cardTwoColor,
                    courseTitle: "Digital Media",
                    icon: Icons.laptop,
                    description:
                        "Learn Graphic designing, Photography and Videography with field practicals"),
                skillsCard(
                    textStyle: textStyle,
                    color: cardThreeColor,
                    courseTitle: "Enterprenuership Skills",
                    icon: Icons.laptop,
                    description:
                        "Turn your skills to income generation with enterprenueship skills"),
                skillsCard(
                    textStyle: textStyle,
                    color: cardThreeColor,
                    courseTitle: "Career Coaching & Mentoring",
                    icon: Icons.laptop,
                    description:
                        "Build your career with experince and skilled personnel."),
              ],
            ),
          ),
          Text(
              "We have skilled and experience facilators to teach and mentor you to build your real self in society. Creating a sustainable human society is our core agenda.",
              style: textStyles),
          Text(
              "The world is now a global village with evrything now on the internet, with our SOFTWARE Skills. Benigficiaries will be trained in mobile app and web Sites Development",
              style: textStyles),
          Text(
              "to help gain internships and employment contracts in and beyond Ghana",
              style: textStyles),
        ],
      )),
    );
  }
}

skillsCard(
    {TextStyle? textStyle,
    Color? color,
    String? courseTitle,
    String? description,
    IconData? icon}) {
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    elevation: 3,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 340,
      width: 230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(backgroundColor: color, radius: 60, child: Icon(icon)),
          Text(
            courseTitle!,
            style: textStyle!.copyWith(fontSize: 20, color: Color(0xff353739)),
          ),
          Text(
            description!,
            style: TextStyle(color: Color(0xff929596)),
          )
        ],
      ),
    ),
  );
}

class Work extends StatelessWidget {
  const Work({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = Theme.of(context).textTheme.headline1!.copyWith(
          color: Colors.white,
          fontFamily: "Lato-Bold",
          fontSize: 30,
        );

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image(
              // colorBlendMode: BlendMode.dstOver,

              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              image: AssetImage("images/lad.jpg")),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(top: 300),
            // color: Colors.green,
            height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width/1.5,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => NewsCards()),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 100,
              // width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "LATEST NEWS \$ EVENTS",
                    style: _textStyle,
                  ),
                  Text(
                      "Updates on our upcoming Programs \$ what we have been upto")
                ],
              ),
              // color: Colors.red,
            ),
          ),
        ],
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
    color: Color(0xff43B5EE),
    // onPressed: () {},
    child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Text(
          "Contact Us",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        )),
  );
}

class NewsCards extends StatelessWidget {
  const NewsCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          child:Column(children: [
            
          ],),          
          width: 400,
          height: 800,
          // child: Column(),
        ),
      ),
    );
  }
}

List news = [
  {"newsImageUrl": "", "newsTitle": "", "newsShortDescription": ""},
  {"newsImageUrl": "", "newsTitle": "", "newsShortDescription": ""},
  {"newsImageUrl": "", "newsTitle": "", "newsShortDescription": ""}
];
