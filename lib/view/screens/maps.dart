import 'dart:async';

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../cache_helper/cache_helper.dart';
import '../../routes/routes.dart';
import '../../services/category_service.dart';
import '../../services/order_service.dart';
import '../../utils/theme.dart';
import 'order_rented.dart';

class MapScreen extends StatefulWidget {

const MapScreen({Key? key,}) : super(key: key);

@override
_MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
//  int category_id =this.category_id ;
 bool wating = true ;  
Completer<GoogleMapController> _controller = Completer();
// on below line we have specified camera position
static final CameraPosition _kGoogle = const CameraPosition(
	target: LatLng( 30.7911111 ,  30.9980556),
	zoom: 10.4746,
);

// on below line we have created the list of markers
final List<Marker> _markers = <Marker>[
	Marker(
		markerId: MarkerId('1'),
	position: LatLng(20.42796133580664, 75.885749655962),
	infoWindow: InfoWindow(
		title: 'My Position',
	)
),
];

// created method for getting user current location
Future<Position> getUserCurrentLocation() async {
	await Geolocator.requestPermission().then((value){
	}).onError((error, stackTrace) async {
	await Geolocator.requestPermission();
	print("ERROR"+error.toString());
	});
	return await Geolocator.getCurrentPosition();
}

DateTime dateTime = DateTime.now();
late double latitude ;
late double longitude ;
@override
  void initState() {
     
    	getUserCurrentLocation().then((value) async {
			print(value.latitude.toString() +" "+value.longitude.toString());
       latitude = 	value.latitude	;
       longitude = value.longitude ;
       // marker added for current users location
			_markers.add(
				Marker(
				markerId: MarkerId("2"),
				position: LatLng(value.latitude, value.longitude),
				infoWindow: InfoWindow(
					title: 'My Current Location',

				),
				)
			);

			// specified current users location
			CameraPosition cameraPosition = new CameraPosition(
			target: LatLng(value.latitude, value.longitude),
			zoom: 15,
			);

			final GoogleMapController controller = await _controller.future;
			controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
       
			setState(() {
       
			});
		});
    super.initState();
  }

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		backgroundColor: Colors.white,
    elevation: 2,
    leading: IconButton(
      onPressed: ()
      {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
         size: 27, )
      ),
		// on below line we have given title of app
    centerTitle: true,
		title: Text(
      "تحديد الموقع",
       style: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w800,
        color: Colors.black
       ),
      ),
	),
	body: 
  Column(
    children: [
      Expanded(
        child: Container(
          child: SafeArea(
          // on below line creating google maps
          child: GoogleMap(
          // on below line setting camera position
          initialCameraPosition: _kGoogle,
          // on below line we are setting markers on the map
          markers: Set<Marker>.of(_markers),
          // on below line specifying map type.
          mapType: MapType.normal,
          // on below line setting user location enabled.
          myLocationEnabled: true,
          // on below line setting compass enabled.
          compassEnabled: true,
          // on below line specifying controller on map complete.
          onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
          ),
        ),
      ),
        SizedBox(height: 10,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(10)
            ),
            child: MaterialButton(
              onPressed: () async
              {
                 onSendOrder();
              },
              child: Text(
                "تاكيد الطلب",
                 style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white
                 ),
                ),
            ),
          ),
        ),
       SizedBox(height: 20,),
    ],
  ),
	// on pressing floating action button the camera will take to user current location
	// floatingActionButton: FloatingActionButton(
	// 	onPressed: () async{
	
	// 	},
	// 	child: Icon(Icons.local_activity),
	// ),
	);
}


void onSendOrder () async
{
    //
    // Get.toNamed(Routes.OrderRented);
    
     var result = await OrderService.SendOrder(
      longitude,
      latitude,
    );
    print(result);

    if(result )
    {
     
       Get.toNamed(Routes.OrderRented);
      
    }
}

}
