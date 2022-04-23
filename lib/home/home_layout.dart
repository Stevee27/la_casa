import 'package:flutter/material.dart';
import 'package:la_casa/models/StoreHours.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key, required this.storeHours}) : super(key: key);

  final List<StoreHours> storeHours;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // flexibleSpace: Container(
          //     decoration: const BoxDecoration(
          //         image: DecorationImage(
          //             alignment: Alignment.bottomCenter,
          //             image: AssetImage('images/name.jpg'),
          //             fit: BoxFit.fitWidth)
          //             )),
          backgroundColor: Colors.white70,
        ),
        body: SizedBox.expand(
            child: Container(
                // color: Colors.red[50],
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
                      const Text(
                        'Authentic Italian bakery',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        '7110 Gulf Blvd, St.Pete Beach',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const Spacer(flex: 2),
                      const Text(
                        'Stop in at for fresh bread baked daily from homemade dough, '
                        'classic Italian style pizzas, salads, pastries, and the best coffee on St. Pete Beach.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                      // const WeeklyHoursWidget(),
                      const Spacer(),
                      // HomeButtons()
                      Text('Buttons here')
                    ])))));
  }
}
