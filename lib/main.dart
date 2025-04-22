import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fullscreen_window/fullscreen_window.dart';
import 'localmanager.dart';
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Decafeinate Me',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Entry Point'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _Showcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("src/images/wallpaper.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(190, 62, 62, 62),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  width: 1000,
                  height: height * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(145, 132, 131, 132),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.01),
                      Row(
                        children: const [
                          Text(
                            "\t\tDecafeinate Me",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Machine:",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(width: 30),
                        ],
                      ),
                      SizedBox(height: height * 0.05),
                      Row(
                        children: [
                          const Column(
                            children: [
                              SizedBox(width: 200),
                              Text(
                                "User:\nTime Available:\nLast Time Recharged:",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 100,
                            height: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(31, 0, 0, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                debugPrint("Request More Hours");
                              },
                              child: const Text(
                                "+Hours",
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(31, 0, 0, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.logout,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                        ],
                      ),
                      SizedBox(height: height * 0.05),
                      Container(
                        width: 800,
                        height: height * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(177, 45, 44, 45),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                Spacer(),
                                Container(decoration: BoxDecoration(image: DecorationImage(image:AssetImage("src/test/images/valorant-banner.jpg"),fit: BoxFit.cover)), width: width*0.115, height: height*0.3),
                                Spacer(),
                                Container(decoration: BoxDecoration(image: DecorationImage(image:AssetImage("src/test/images/tf2-banner.jpeg"),fit: BoxFit.cover)), width: width*0.115, height: height*0.3),
                                Spacer(),
                                Container(decoration: BoxDecoration(image: DecorationImage(image:AssetImage("src/test/images/cs2-banner.webp"),fit: BoxFit.cover)), width: width*0.115, height: height*0.3),
                                Spacer(),
                              ],
                            ),
                            SizedBox(height: 30),
                            Row(
                              children: [
                                SizedBox(width: 50),
                                Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('src/test/images/steam-logo.png'))),width: 50,height: 50,),
                                SizedBox(width: 20),
                                Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('src/test/images/firefox-logo.png'))),width: 50,height: 50,),
                                SizedBox(width: 20),
                                Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('src/test/images/gimp-logo.png'))),width: 50,height: 50,),
                                Spacer(),
                                ElevatedButton(style: ElevatedButton.styleFrom(minimumSize: Size(50,50) ,shape: CircleBorder()),onPressed: (){debugPrint("Opening Library...");}, child: Icon(Icons.more_horiz)),
                                SizedBox(width: 35)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class _MyHomePageState extends State<MyHomePage> {
  bool dontMakeError = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width_adaptive = MediaQuery.of(context).size.width / 3;
    
    //FullScreenWindow.setFullScreen(true);
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Container(
      
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("src/images/wallpaper.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        body: Row(
          children: [
            Container(
              height: height,
              width: width_adaptive,
              color: const Color.fromARGB(220, 63, 63, 63),
              child: Column(
                children: [
                  SizedBox(height: height * 0.1),
                  const Text(
                    "Decafeinate Mee",
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: height * 0.2),
                  SizedBox(
                    width: width_adaptive / 1.2,
                    child: TextField(
                      controller: usernameController,
                      autocorrect: false,
                      enableSuggestions: false,
                      textCapitalization: TextCapitalization.none,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    width: width_adaptive / 1.2,
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white),
                        
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.2),
                  SizedBox(
                    width: width_adaptive / 3,
                    child: ElevatedButton(
                      
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {
                        //TODO HERE
                        if(usernameController.text ==''){
                          debugPrint("Logging in...");
                          debugPrint("Username: ${usernameController.text}");
                          debugPrint("Password: ${passwordController.text}");
                          setState(() {
                            dontMakeError = false;
                          });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => _Showcase(),
                          ),
                        );
                        }else{
                          debugPrint("Please enter a valid username and password.");
                          dontMakeError = true;
                          setState(() {dontMakeError = true;});
                        } 
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.05,child:Visibility(
                    visible: dontMakeError,
                    child: 
                    Text('Invalid Response', style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w600),)
                    )
                    ),
                  Spacer()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
