import 'dart:async';

import 'package:butlerservice/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GooglemapPage extends StatefulWidget {
  GooglemapPage({super.key, this.latitude, this.longitude});
  double? latitude;
  double? longitude;

  @override
  State<GooglemapPage> createState() => _GooglemapPageState();
}

class _GooglemapPageState extends State<GooglemapPage> {
  Completer<GoogleMapController> mapcontroller = Completer();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kBackgroundColor,
          centerTitle: true,
          title: Text(
            'สถานที่',
            style: TextStyle(fontSize: 25, color: kConkgroundColor),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/icons/chevron_w.png'))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height,
                width: double.infinity,
                //color: Colors.blue,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GoogleMap(
                    zoomControlsEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(widget.latitude!, widget.longitude!),
                      zoom: 18,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      mapcontroller.complete(controller);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
