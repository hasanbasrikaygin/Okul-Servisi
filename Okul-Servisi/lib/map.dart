import 'dart:async';
import 'package:deneme/directions_repository.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'Wellcome.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

Sehir() {
  var result;
  for (int i = 0; i < 12; i++) {
    if (busa[i].index == -1) {
      result = busa[i].sehir;
    }
  }
  if (result.toString().isNotEmpty) {
    var directions =
        LocationService().getDirections(result, "Kocaeli Üniversitesi");

  }
  //_gotoPlace(place);
  return result;
}

class MapSampleState extends State<MapSample> {
  late Busa bus;
  Completer<GoogleMapController> _controller = Completer();
  Set<Polyline> _polyline = Set<Polyline>();
  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygon = Set<Polygon>();
  List<LatLng> polygonlatlng = <LatLng>[];

  var _polylineidcounter = 0;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(40.766666, 29.916668),
    zoom: 8,
  );
  static final Polyline _Polyline = Polyline(
      polylineId: PolylineId('kPolyline'),
      points: [LatLng(40.715298, 29.927692), LatLng(40.766666, 29.916668)],
      width: 5);
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  ////////////////////////////////////////////////////////////////////////
  static final Marker _izmit = Marker(
    markerId: MarkerId('_izmit'),
    infoWindow: InfoWindow(title: 'İzmit'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.766666, 29.916668),
  );
  static final Marker _Basiskele = Marker(
    markerId: MarkerId('_Basiskele'),
    infoWindow: InfoWindow(title: 'Basiskele'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.715298, 29.927692),
  );
  static final Marker _Cayirova = Marker(
    markerId: MarkerId('_Cayirova'),
    infoWindow: InfoWindow(title: 'Cayirova'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.8172, 29.3734),
  );
  static final Marker _Darica = Marker(
    markerId: MarkerId('_Darica'),
    infoWindow: InfoWindow(title: 'Darica'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.769588, 29.370031),
  );
  static final Marker _Derince = Marker(
    markerId: MarkerId('_Derince'),
    infoWindow: InfoWindow(title: 'Derince'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.7562, 29.8309),
  );
  static final Marker _Dilovasi = Marker(
    markerId: MarkerId('_Dilovasi'),
    infoWindow: InfoWindow(title: 'Dilovasi'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.7890, 29.5421),
  );
  static final Marker _Gebze = Marker(
    markerId: MarkerId('_Gebze'),
    infoWindow: InfoWindow(title: 'Gebze'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.807751, 29.437340),
  );
  static final Marker _Golcuk = Marker(
    markerId: MarkerId('_Golcuk'),
    infoWindow: InfoWindow(title: 'Golcuk'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.7177, 29.8193),
  );
  static final Marker _Kandira = Marker(
    markerId: MarkerId('_Kandira'),
    infoWindow: InfoWindow(title: 'Kandira'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(41.07101000000006, 30.14862000000005),
  );
  static final Marker _Karamursel = Marker(
    markerId: MarkerId('_Karamursel'),
    infoWindow: InfoWindow(title: 'Karamursel'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.695880000000045, 29.628300000000024),
  );
  static final Marker _Kartepe = Marker(
    markerId: MarkerId('_Kartepe'),
    infoWindow: InfoWindow(title: 'Kartepe'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.753448, 30.028965),
  );
  static final Marker _Korfez = Marker(
    markerId: MarkerId('_Korfez'),
    infoWindow: InfoWindow(title: 'Korfez'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(40.776382, 29.737718),
  );
  /////////////////////////////////////////////////////////////////////////////
  var place = LocationService().getDirections(Sehir(), "Kocaeli Üniversitesi");

  @override
  void initState() {
    super.initState();
    _setMarker(LatLng(39, 25));
  }

  void _setMarker(LatLng point) {
    setState(() {});
  }

  void _setPolyline(List<PointLatLng> points) {
    final String Polylineidval = 'polyline_$_polylineidcounter';
    _polylineidcounter++;
    _polyline.add(
      Polyline(
        polylineId: PolylineId(Polylineidval),
        width: 2,
        color: Colors.blue,
        points:
            points.map(
              (point) => LatLng(point.latitude, point.longitude),
            )
            .toList()
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text(Sehir()),
          ),
          Expanded(
            child: GoogleMap(
              polylines: _polyline,
              mapType: MapType.normal,
              markers: {
                _izmit,
                _Basiskele,
                _Cayirova,
                _Darica,
                _Derince,
                _Dilovasi,
                _Gebze,
                _Golcuk,
                _Kandira,
                _Karamursel,
                _Kartepe,
                _Korfez
              },
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                var place = await LocationService()
                    .getDirections(Sehir(), "Kocaeli Üniversitesi");
                _goToPlace(
                    place['start_location']['lat'],
                    place['start_location']['lng'],
                    place['bounds_ne'],
                    place['bounds_sw']);
                _setPolyline(place['polyline_decoded']);
              },
              child: Text("Yolu Göster"))
        ],
      ),
    );
  }

  Future<void> _goToPlace(
    double lat,
    double lng,
    Map<String, dynamic> boundNe,
    Map<String, dynamic> boundSw,
  ) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );
    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(boundSw['lat'], boundSw['lng']),
            northeast: LatLng(boundNe['lat'], boundNe['lng']),
          ),
          25),
    );
  }
}
