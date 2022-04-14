import 'package:clip_path_tutorial/qr_code_card.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CustomPainter Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'CustomPainter Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: const Color(0xFF55c544),
        child: Center(
          child: QrCodeCard(
            width: 350,
            height: 550,
            footerHeight: 50,
            radius: 32,
            padding: const EdgeInsets.all(32.0),
            footerChild: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.call_outlined,
                  color: Colors.white,
                ),
                Text(
                  "0000",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.blur_circular_outlined,
                  color: Colors.white,
                ),
                Text(
                  "comet.la",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Color(0xFF1A4789),
                  ),
                  title: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 4,
                    color: const Color(0xFFE43434).withOpacity(0.5),
                  ),
                  subtitle: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 4,
                    color: const Color(0xFF1A4789).withOpacity(0.5),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        // backgroundImage:
                        //     NetworkImage('https://via.placeholder.com/150'),
                        backgroundColor: Colors.grey.shade300,
                        child: Icon(Icons.person,
                            size: 60, color: Colors.grey.shade500),
                      ),
                      const Text(
                        "Comet",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      QrImage(
                        data: "1234567890",
                        version: QrVersions.auto,
                        size: 550 - 300,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "123-12-00-xxxxx000-000",
                        style: TextStyle(
                          color: Color(0xFF1A4789),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
