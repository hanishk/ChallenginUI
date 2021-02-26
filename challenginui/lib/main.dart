import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
        child: CustomScroll(),
      ),
    );
  }
}

class CustomScroll extends StatefulWidget {
  @override
  _CustomScrollState createState() => _CustomScrollState();
}

class _CustomScrollState extends State<CustomScroll> {
  List<int> list = new List<int>.generate(20, (i) => i);

  PageController vController =
      PageController(initialPage: 0, viewportFraction: 0.2, keepPage: true);
  PageController hController =
      PageController(initialPage: 4, viewportFraction: 0.33, keepPage: true);

  bool vFromTouch = false, hFromTouch = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.33,
            child: PageView.builder(
              itemCount: list.length,
              allowImplicitScrolling: true,
              itemBuilder: (c, i) => Card(
                color: Colors.red.shade300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(list[i].toString())),
                ),
              ),
              onPageChanged: (int i) {
                int page = vController.page.toInt() + 5;
                if (page < list.length)
                  hController.animateToPage(
                    page,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
              },
              controller: vController,
              scrollDirection: Axis.vertical,
              pageSnapping: true,
              dragStartBehavior: DragStartBehavior.start,
              physics: BouncingScrollPhysics(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 150,
              child: PageView.builder(
                itemCount: list.length,
                controller: hController,
                allowImplicitScrolling: true,
                itemBuilder: (c, i) => Container(
                  height: 150.0,
                  width: 150.0,
                  child: Card(
                    color: Colors.red.shade300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(list[i].toString())),
                    ),
                  ),
                ),
                onPageChanged: (int i) {
                  int page = hController.page.toInt() - 3;

                  if (page >= 0)
                    vController.animateToPage(page,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.linear);
                },
                pageSnapping: true,
                scrollDirection: Axis.horizontal,
                dragStartBehavior: DragStartBehavior.start,
                physics: BouncingScrollPhysics(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(new MaterialApp(
//     home: new MyHomePage(),
//   ));
// }

// class MyHomePage extends StatelessWidget {
//   Widget build(BuildContext context) {
//     ThemeData themeData = Theme.of(context);
//     return new Scaffold(
//       body: new SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: new SizedBox(
//           width: 1000.0,
//           child: new ListView.builder(
//             itemBuilder: (BuildContext context, int i) {
//               return new Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: new List.generate(5, (int j) {
//                   return new Text("$i,$j", style: themeData.textTheme.display2);
//                 }),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   Container customContainer() {
//     return Container(
//       height: 100,
//       width: 80,
//       color: Colors.amber,
//       child: Card(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final title = 'Grid List';

//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: Container(
//           height: double.infinity,
//           width: 100,
//           child: GridView.count(
//             crossAxisCount: 1,
//             children: [
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),
//               customContainer(),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Container(
//                     height: 600,
//                     width: 200,
//                     color: Colors.red.shade300,
//                     child: Card(),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
