
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:latlong2/latlong.dart';

import 'MarkerData.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final MapController mapController = MapController();
  // LocationData? currentLocation;
  // List<LatLng> routePoints = [];

  LatLng? _selectedPosition;
  LatLng? _mylocation;
  LatLng? _draggedPosition;
  bool _isDragging = false;

  final List<MarkerData> _markerData = [];
  final List<Marker> _markers = [];

  TextEditingController searchController = TextEditingController();
  List<dynamic> _searchResults = [];
  bool _isSearching = false;

  // List<LatLng> savedLocations = []; // List to store saved locations
  // LatLng? selectedLocation; // To store the user's selected location
  // final String orsApiKey =
  //     '5b3ce3597851110001cf62482a3bbccce840449baea616641f870310'; // Replace with your OpenRouteService API key

// get current location:
  Future _getCurrentLocation() async {
    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

// show current location:
  void showCurrentLocation() async {
    try {
      Position position = await _getCurrentLocation();
      LatLng currentLatLng = LatLng(position.latitude, position.longitude);
      mapController.move(currentLatLng, 15.0);

      setState(() {
        _mylocation = currentLatLng;
      });
    } catch (e) {
      print(e.toString());
    }

    // _getCurrentLocation().then((position) {
    //   setState(() {

    //     _mylocation = LatLng(position.latitude, position.longitude);
    //     mapController.move(currentLatLng, 15.0)
    //   });
    // });
  }

// Adding Marker:
  void addMarker(LatLng position, String title, String description) {
    setState(() {
      final markerData =
      MarkerData(position: position, title: title, description: description);
      _markerData.add(markerData);
      _markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: position,
          child: GestureDetector(
            onTap: () {
              showMarkerInfo(markerData);
            },
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 45,
                )
              ],
            ),
          ),
        ),
      );
    });
  }

// Showing Marker Dialog:
  void showMarkerDialog(BuildContext context, LatLng position) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Your Marker Title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel')),
            TextButton(
              onPressed: () {
                addMarker(
                    position, titleController.text, descriptionController.text);
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Show Marker When tapping:
  void showMarkerInfo(MarkerData markerData) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(markerData.title),
          content: Text(markerData.description),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'))
          ],
        ));
  }

  // Search for Locations:
  Future searchLocations(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _isSearching = false;
      });
      return;
    }

    final String url =
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=5';
    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    if (data.isNotEmpty) {
      setState(() {
        _searchResults = data;
        _isSearching = true;
      });
    } else {
      setState(() {
        _searchResults = [];
        _isSearching = false;
      });
    }
  }

// Move to specific location:
  void moveToLocation(double lat, double long) {
    LatLng location = LatLng(lat, long);
    mapController.move(location, 15.0);
    setState(() {
      _selectedPosition = location;
      _searchResults = [];
      _isSearching = false;
      searchController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      searchLocations(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenStreetMap with Flutter'),
      ),
      // body: currentLocation == null
      // ? const Center(child: CircularProgressIndicator())
      body: Stack(
        children: [
          FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter:
                LatLng(51.509364, -0.128928), // Center the map over London
                initialZoom: 9.2,
                onTap: (TapPosition, LatLng) {
                  _selectedPosition = LatLng;
                  _draggedPosition = _selectedPosition;
                },
              ),
              children: [
                TileLayer(
                  urlTemplate:
                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(markers: _markers),
                if (_isDragging && _draggedPosition != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                          point: _draggedPosition!,
                          width: 80,
                          height: 80,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.indigo,
                            size: 45,
                          ))
                    ],
                  ),
                if (_mylocation != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                          point: _mylocation!,
                          width: 80,
                          height: 80,
                          child: Icon(
                            Icons.location_on,
                            color: Colors.green,
                            size: 45,
                          ))
                    ],
                  ),
              ]),

          // Search Widget
          Positioned(
            top: 40,
            left: 15,
            right: 15,
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for Locations...',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: _isSearching
                          ? IconButton(
                          onPressed: () {
                            searchController.clear();
                            setState(() {
                              _searchResults = [];
                              _isSearching = false;
                            });
                          },
                          icon: Icon(Icons.clear))
                          : null,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _isSearching = true;
                      });
                    },
                  ),
                ),
                if (_isSearching && _searchResults.isNotEmpty)
                  Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final place = _searchResults[index];
                        return ListTile(
                          title: Text(place['display_name']),
                          onTap: () {
                            moveToLocation(
                              double.parse(place['lat']),
                              double.parse(place['lon']),
                            );
                          },
                        );
                      },
                      itemCount: _searchResults.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                    ),
                  )
              ],
            ),
          ),

          // Add location Button:
          _isDragging == false
              ? Positioned(
              bottom: 20,
              left: 15,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _isDragging = true;
                    // showMarkerDialog(context, _draggedPosition!);
                  });
                },
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                child: Icon(Icons.add_location_alt_outlined),
              ))
              : Positioned(
            bottom: 20,
            left: 15,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _isDragging = false;
                });
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              child: Icon(Icons.wrong_location),
            ),
          ),

          Positioned(
            bottom: 20,
            right: 15,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: showCurrentLocation,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                  child: Icon(Icons.location_searching_sharp),
                ),
                if (_isDragging)
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (_draggedPosition != null) {
                          // adding marker
                          showMarkerDialog(context, _draggedPosition!);
                        }

                        setState(() {
                          _isDragging = false;
                          _draggedPosition = null;
                        });
                      },
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.check_circle_rounded),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}