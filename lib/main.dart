import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_floating_marker_titles/flutter_map_floating_marker_titles.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transportkartan',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF122850)),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Row(
              children: [
                NavigationRail(
                  elevation: 25,
                  extended: false,
                  selectedLabelTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                  labelType: NavigationRailLabelType.selected,
                  backgroundColor: const Color(0xFF122850),
                  unselectedIconTheme:
                      const IconThemeData(color: Colors.white70),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Hem'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      label: Text('Inställningar'),
                    ),
                  ],
                  selectedIndex: 0,
                  onDestinationSelected: (int index) {
                    // Handle navigation item selection
                  },
                ),
                Container(
                  width: 140,
                  height: double.infinity,
                  color: const Color(0xFF122850),
                ),
                Expanded(
                  child: const MapWidget(),
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 90,
              bottom: 0,
              width: 300, // Adjust the width as needed
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                          0.4), // Customize the shadow color and opacity
                      blurRadius: 10, // Adjust the blur radius as needed
                      spreadRadius: 2, // Adjust the spread radius as needed
                      offset: Offset(0, 4), // Adjust the offset as needed
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    duration: const Duration(milliseconds: 300),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 32, right: 8, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Logistik hubbar',
                              style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(height: 16),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image.asset(
                                        'assets/icons/kombiterminal.png'),
                                  ),
                                  tileColor: Colors.indigo,
                                  title: Text('Kombiterminal ${index + 1}'),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(55.509364, 13.128928),
          initialZoom: 6,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://maps.geoapify.com/v1/tile/osm-bright-smooth/{z}/{x}/{y}.png?apiKey=fb622ee8c7a048f1b766548572313f5a',
            userAgentPackageName: 'com.example.karta',
          ),
          FloatingMarkerTitlesLayer(
            floatingTitles: [FloatingMarkerTitlesLayer],
            fmtoOptions: fmtoOptions,
          ),
        ]);
  }
}
