import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random = Random();
  int x = 0;
   
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //drawer
                drawer: Drawer(backgroundColor: Colors.yellow.shade100,
        child: Padding(
          padding: const EdgeInsets.only(),
          child: ListView(
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(
                color: Colors.yellow,
              ),
                child: Text('Lottery App \n Lets Try Your Luck',
                 style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Lemon'),
              
              )),
              ListTile(title: Text('Home')),
              ListTile(title: Text('Contect')),
              ListTile(title: Text('Feedback')),
          ],
          ),
        ),
        ),
        backgroundColor: Colors.yellow.shade100,
        //app bar style
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Center(
              child: Text('Lottery App',
                  style: TextStyle(
                    color: Color.fromARGB(255, 39, 38, 38),
                    fontFamily: 'Lemon',
                    fontSize: 28,
                  ))),
        ),
        //lothery winning number
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                'images/goodluck.png',
              ),
              height: 250,
              width: 250,
            ),
            const SizedBox(height: 1),
            const Center(
                child: Text(
              '[ Lottery Winning number is 5 ]',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Lemon',
              ),
            )),
            const SizedBox(height: 10),
            //container
            Container(
                height: x == 5 ? 260 : 250,
                width: x == 5 ? 310 : 300,
                decoration: BoxDecoration(
                  color: x == 5
                      ? Colors.blueGrey.withOpacity(.3)
                      : Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    //lothery winner interface
                    child: x == 5
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                const Icon(
                                  Icons.done,
                                  color: Colors.green,
                                  size: 50,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'Congertulation! \n You have Won the lothery \n $x is your winning number',
                                  textAlign: TextAlign.center,
                                )
                              ])
                        :
                        //lothery loser interface
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 50,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'Better Luck Next Time \n Your Number is $x \n Try Again',
                                  textAlign: TextAlign.center,
                                )
                              ])))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
          onPressed: () {
            x = random.nextInt(10);
            // print(x);
            setState(() {});
          },
          child: Icon(x == 5 ? Icons.gif_rounded : Icons.heart_broken),
        ),
      ),
    );
  }
}
