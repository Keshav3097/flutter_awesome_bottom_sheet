import 'package:flutter/material.dart';
import 'package:flutter_awesome_bottom_sheet/flutter_awesome_bottom_sheet.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Bottom Sheet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          useMaterial3: true),
      home: const HomePage(title: 'Awesome Bottom Sheet'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key,required this.title}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  ///Object declaration
  final AwesomeBottomSheet _awesomeBottomSheet = AwesomeBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            ///Simple Awesome Sheet
            BuildButton(
              context: context,
              text: 'Simple Awesome Sheet',
              onClick: () {
                _awesomeBottomSheet.show(
                  context: context,
                  title: const Text("Lorem Ipsum"),
                  description: const Text(
                      "Flutter Awesome Bottom sheet content here..."),
                  color: CustomSheetColor(
                    mainColor: const Color(0xff2979FF),
                    accentColor: const Color(0xff0D47A1),
                    iconColor: Colors.white,
                  ),
                  positive: AwesomeSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CANCEL',
                  ),
                );
              },
            ),

            ///Action Awesome Sheet
            BuildButton(
              context: context,
              text: 'Action Awesome Sheet',
              onClick: () {
                _awesomeBottomSheet.show(
                  isDismissible: false,
                  context: context,
                  title: const Text("Delete this post?"),
                  description: const Text(
                      "This action will permanently delete this post."),
                  color: CustomSheetColor(
                    mainColor: const Color(0xfff33838),
                    accentColor: const Color(0xffab1d1d),
                    iconColor: Colors.white,
                  ),
                  icon: Icons.delete,
                  positive: AwesomeSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'DELETE',
                  ),
                  negative: AwesomeSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CANCEL',
                  ),
                );
              },
            ),


            ///Icon Awesome Sheet

            BuildButton(
              context: context,
              text: 'Icon Awesome Sheet',
              onClick: () {
                _awesomeBottomSheet.show(
                  context: context,
                  title: const Text("Attention"),
                  description: const Text(
                      'Your app is not connected to internet actually, please turn on Wifi/Cellular data.'),
                  color: CustomSheetColor(
                    mainColor: const Color(0xff2979FF),
                    accentColor: const Color(0xff0D47A1),
                    iconColor: Colors.white,
                  ),
                  icon: Icons.signal_cellular_connected_no_internet_4_bar,
                  positive: AwesomeSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'OPEN SETTING',
                    icon: Icons.settings,
                  ),
                  negative: AwesomeSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: 'CANCEL',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

///Create Button widget for multiple usage
class BuildButton extends StatelessWidget {
  final BuildContext context;
  final String text;
  final VoidCallback onClick;

  const BuildButton({
    Key? key,
    required this.context,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.blue,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
