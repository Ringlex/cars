//import 'package:advMe/providers/user.dart' as user;
import 'package:cars/providers/cars.dart';
import 'package:cars/widgets/location_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';


import '../screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPlace;

  LocationInput(this.onSelectPlace);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  void _showPreview(double lat, double lng) {
    final staticMapImageUrl = LocationMap.generateLocationPreviewImage(
      latitude: lat,
      longitude: lng,
    );
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> _getCurrentUserLocation() async {
    try {
      final locData = await Location().getLocation();
      _showPreview(locData.latitude, locData.longitude);
      widget.onSelectPlace(locData.latitude, locData.longitude);
    } catch (error) {
      return;
    }
  }

  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(
          isSelecting: true,
        ),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    _showPreview(selectedLocation.latitude, selectedLocation.longitude);
    widget.onSelectPlace(selectedLocation.latitude, selectedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final isEng = Provider.of<Cars>(context,).isEng;
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:  Color(0x0000001A),
                blurRadius: 8,
                spreadRadius: 0,
                offset: Offset(0, 8),
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            color:Color(0xFF565656),
          ),
          child: _previewImageUrl == null
              ? Text(isEng ?
                  'No location chosen' : 'Brak lokalizacji',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFCECECE),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                   
                  ),
                  child: ClipRRect(
                    
                    child: Image.network(
                      _previewImageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.03,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton.icon(
                    icon: Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 16,
                    ),
                    label: Text(isEng ?
                      'Current Location' : 'Aktualne miejsce',
                      style: TextStyle(
                         
                        color: Colors.white,
                      ),
                    ),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: _getCurrentUserLocation,
                  ),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                   
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  child: FlatButton.icon(
                    icon: Icon(
                      Icons.map,
                      color: Colors.white,
                      size: 18,
                    ),
                    label: Text(isEng ? 
                      'Select on Map' : 'Wybierz na mapie',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    textColor: Theme.of(context).accentColor,
                    onPressed: _selectOnMap,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
