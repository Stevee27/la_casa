import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/models/StoreHours.dart';

import '../nav/nav_cubit.dart';
import '../nav/nav_state.dart';
import 'store_hours_widget.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key, required this.storeHours}) : super(key: key);

  final List<StoreHours> storeHours;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage('assets/images/name.jpg'),
                      fit: BoxFit.fitWidth))),
          backgroundColor: Colors.white70,
        ),
        body: BlocBuilder<NavCubit, NavState>(
          builder: (BuildContext context, state) {
            return SizedBox.expand(
                child: SafeArea(
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                // Image.asset('assets/images/name.jpg'),
                Image.asset('assets/images/curbview.jpg'),
                const Spacer(flex: 1),
                const Text(
                  'Authentic Italian bakery',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const Text(
                  '7110 Gulf Blvd, St.Pete Beach',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                const Spacer(flex: 1),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    'Stop in at for fresh bread baked daily from homemade dough, '
                    'classic Italian style pizzas, salads, pastries, and the best coffee on St. Pete Beach.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                const Spacer(flex: 1),
                StoreHoursWidget(storeHours: storeHours),
                const Spacer(),
                // HomeButtons()
                TextButton(
                  onPressed: () async {
                    BlocProvider.of<NavCubit>(context).showMenu();
                  },
                  child: const Text('Menu'),
                )
              ]),
            ));
          },
        ));
  }
}
