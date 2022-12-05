import 'package:flutter/material.dart';
import 'package:geolocater/Prom/Location.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  Position? position;
  final TextEditingController first = TextEditingController();
  final TextEditingController Secnd = TextEditingController();
  double bearing =
      Geolocator.bearingBetween(52.2165157, 6.9437819, 52.3546274, 4.8285838);

  //late final String res;

  late LocationPermission Permission;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Column(
          children: [
            TextField(
              controller: first,
              decoration: InputDecoration(),
            ),
            TextField(
              controller: Secnd,
              decoration: InputDecoration(),
            ),
            IconButton(
                onPressed: () async {
                  determinePosition();
                  Permission = await Geolocator.checkPermission();

                  position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  bearing = Geolocator.bearingBetween(
                      position!.latitude,
                      position!.longitude,
                      double.parse(Secnd.text),
                      double.parse(first.text));

                  setState(() {});
                },
                icon: Icon(Icons.home)),
            Text(
              "${position}",
            ),
            Row(
              children: [Text("the distence:  "), Text("${bearing * -1}")],
            )
          ],
        ));
  }
}
