import 'dart:async';

import 'package:aftarobotlibrary/api/file_util.dart';
import 'package:aftarobotlibrary/data/routedto.dart';
import 'package:aftarobotlibrary/util/functions.dart';
import 'package:aftarobotlibrary/util/maps/snap_to_roads.dart';
import 'package:aftarobotlibrary/util/snack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:location/location.dart';
import 'package:migrator2/bloc/route_builder_bloc.dart';
import 'package:migrator2/snaptoroads_page.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:flutter/scheduler.dart';

class LocationCollector extends StatefulWidget {
  final RouteDTO route;
  LocationCollector({this.route});
  @override
  _LocationCollectorState createState() => _LocationCollectorState();
}

class _LocationCollectorState extends State<LocationCollector>
    implements SnackBarListener, ModesListener {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  Permission permission = Permission.AccessFineLocation;
  List<ARLocation> locationsCollected = List();
  var bloc = routeBuilderBloc;
  RouteDTO route;
  bool isCancelTimer = false;
  bg.Config config = bg.Config(
      desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
      distanceFilter: 10.0,
      stopOnTerminate: false,
      startOnBoot: true,
      debug: true,
      logLevel: bg.Config.LOG_LEVEL_VERBOSE,
      schedule: [
        '1-7 9:00-17:00', // Sun-Sat: 9:00am to 5:00pm (every day)
      ],
      reset: true);
  @override
  void initState() {
    super.initState();
    _checkPermission();
    _getLocationsFromCache();
    bg.BackgroundGeolocation.onActivityChange(_onActivityChanged);
    bg.BackgroundGeolocation.onMotionChange(_onMotionChanged);
    bg.BackgroundGeolocation.onConnectivityChange(_onConnectivityChange);
    bg.BackgroundGeolocation.onLocation(_onLocation);
    bg.BackgroundGeolocation.ready(bg.Config(
            desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
            distanceFilter: 10.0,
            stopOnTerminate: false,
            startOnBoot: true,
            debug: true,
            logLevel: bg.Config.LOG_LEVEL_VERBOSE,
            reset: true))
        .then((bg.State state) {
      print('++++++++++++ BackgroundGeolocation configured ....');
      print(state);
    });
    if (widget.route != null) {
      route = widget.route;
    } else {
      _getPecanwoodRoute();
    }
  }

  @override
  void dispose() {
    print('### dispose  🔵  🔵  🔵  🔵  🔵  - do nutjin, just checkin!');
    super.dispose();
  }

  void _getPecanwoodRoute() async {
    Firestore fs = Firestore.instance;
    var qs = await fs
        .collection('routes')
        .where('routeID', isEqualTo: '-KVnZVSIg8UMl_gFtswm')
        .getDocuments();
    if (qs.documents.isNotEmpty) {
      route = RouteDTO.fromJson(qs.documents.first.data);
      setState(() {});
    } else {
      print('------ ERROR: ⚠️ Inside Pecanwood not found');
    }
  }

  _startTimer() {
    try {
      bloc.startRoutePointCollectionTimer(collectionSeconds: collectionSeconds);
      _showSnack(color: Colors.teal, message: 'Location collection started');
    } catch (e) {
      print(e);
      _showSnack(
        message: e.toString(),
        color: Colors.red,
      );
    }
  }

  _stopTimer() {
    bloc.stopRoutePointCollectionTimer();
    _showSnack(
        message:
            'Location collection stopped ${getFormattedDateHourMinuteSecond()}',
        color: Colors.pink.shade400);
    setState(() {
      isCancelTimer = false;
    });
  }

  _onLocation(bg.Location location) {
    print(
        '\n\n@@@@@@@@@@@ ✅  ✅  -- onLocation:  isMoving? ${location.isMoving}');
    print('${location.toMap()}');
    _showSnack(
      message:
          'Moving? ${location.isMoving} 📍 Odometer: ${location.odometer} km',
    );
  }

  _onMotionChanged(bg.Location location) {
    print('&&&&&&&&&&&&&  ℹ️ onMotionChanged: location ${location.toMap()}');
    if (location.isMoving) {
      _showSnack(message: 'We are moving ...', color: Colors.green);
      print(
          '************************ WE ARE MOVING ......... LOOK FOR BEACON NOW!!');
    } else {
      print("------------------------  JUST CHILLIN .......");
    }
  }

  _onConnectivityChange(bg.ConnectivityChangeEvent event) {
    print(
        '+++++++++++++++ _onConnectivityChange connected: ${event.connected}');
    _showSnack(
        message: 'Connectivity: ${event.connected}', color: Colors.green);
  }

  _onActivityChanged(bg.ActivityChangeEvent event) {
    print('#############  ℹ️ _onActivityChanged: ${event.toMap()}');
    _showSnack(message: event.toString());
  }

  _showSnack({String message, Color color}) {
    AppSnackbar.showSnackbar(
        backgroundColor: Colors.black,
        scaffoldKey: _key,
        textColor: color == null ? Colors.white : color,
        message: message);
  }

  _requestPermission() async {
    print('\n\n######################### requestPermission');
    try {
      final res = await SimplePermissions.requestPermission(permission);
      print("\n########### permission request result is " + res.toString());
    } catch (e) {
      print(e);
    }
  }

  _checkPermission() async {
    print('\n\n######################### checkPermission');
    try {
      bool res = await SimplePermissions.checkPermission(permission);
      print("***************** permission checked is " + res.toString() + '\n');
      if (res == false) {
        _requestPermission();
      }
    } catch (e) {
      print(e);
    }
  }

  void _eraseLocations() async {
    setState(() {
      prevLocation = null;
      locationsCollected.clear();
    });
    try {
      bloc.deleteRoutePoints(routeID: route.routeID);
    } catch (e) {
      print(e);
      _showSnack(message: e.toString(), color: Colors.red);
    }
  }

  void _getLocationsFromCache() async {
    locationsCollected = await LocalDB.getARLocations();
    setState(() {});
  }

  ARLocation prevLocation;
  void _getGPSLocation() async {
    print(
        '_LocationCollectorState ############# getLocation starting ..............');
    var locationManager = new Location();
    var currentLocation = await locationManager.getLocation();
    var arLoc = ARLocation.fromJson(currentLocation);
    if (prevLocation != null) {
      if (arLoc.latitude == prevLocation.latitude &&
          arLoc.longitude == prevLocation.longitude) {
        print('########## 📍  DUPLICATE location .... ignored ');
      } else {
        _saveARLocation(arLoc);
      }
    } else {
      _saveARLocation(arLoc);
    }
  }

// ✅  🎾 🔵  📍   ℹ️
  void _saveARLocation(ARLocation arLoc) async {
    try {
      arLoc.routeID = route.routeID;
      prevLocation = arLoc;
      setState(() {
        locationsCollected.add(arLoc);
      });

      bloc.addRoutePoint(arLoc);
    } catch (e) {
      print('Problem here??????????');
      print(e);
      AppSnackbar.showErrorSnackbar(
          actionLabel: 'Check',
          listener: this,
          message: e.toString(),
          scaffoldKey: _key);
    }
    return null;
  }

  List<SnappedPoint> snappedPoints;
  void getSnappedPointsFromRoads() async {
    print(
        "########################## getSnappedPointsFromRoads: Snap To Roads API");
    List<ARLocation> list = List();
    locationsCollected.forEach((si) {
      var loc = ARLocation(
        latitude: si.latitude,
        longitude: si.longitude,
      );
      list.add(loc);
    });

    try {
      snappedPoints = await SnapToRoads.getSnappedPoints(list);
      list.clear();
      snappedPoints.forEach((sp) {
        list.add(sp.location);
      });
      print(
          '\n\n\n##################### sending ${list.length} to SnapToRoadsPage ########################\n\n\n');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => SnapToRoadsPage(
                    route: route,
                    arLocations: list,
                  )));
    } catch (e) {
      print(e);
      AppSnackbar.showErrorSnackbar(
        scaffoldKey: _key,
        message: '******** Problem calling Google Roads API $e',
        actionLabel: "Close",
        listener: this,
      );
    }
    return null;
  }

  RouteBuilderModel model;
  int collectionSeconds = 10;
  @override
  void onActionPressed(int action) {}
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
      );
    });
    return StreamBuilder(
        stream: bloc.stream,
        initialData: bloc.model,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              print(
                  'StreamBuilder ConnectionState is active - ✅  - updating model');
              model = snapshot.data;
              locationsCollected = model.arLocations;
              break;
            case ConnectionState.waiting:
              print('StreamBuilder ConnectionState is waiting - ️️ℹ️  ...');
              break;
            case ConnectionState.done:
              print('StreamBuilder ConnectionState is done - ️️ 🔵  ...');
              break;
            case ConnectionState.none:
              print('StreamBuilder ConnectionState is none - ️️ 🎾  ...');
              break;
          }
          return Scaffold(
            key: _key,
            appBar: AppBar(
              title: Text('LocationCollector'),
              backgroundColor: Colors.pink.shade300,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.black,
                  ),
                  onPressed: _stopTimer,
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(200),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Container(
                              child: Text(
                                route == null ? '' : route.name,
                                style: Styles.whiteMedium,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Container(
                              child: Text(
                                route == null ? '' : route.associationName,
                                style: Styles.blackBoldSmall,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Modes(
                            listener: this,
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Column(
                            children: <Widget>[
                              Text('${locationsCollected.length}',
                                  style: Styles.blackBoldReallyLarge),
                              Text(
                                'Collected',
                                style: Styles.whiteBoldSmall,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                controller: scrollController,
                itemCount: locationsCollected.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    child: Card(
                      elevation: 2.0,
                      color: getRandomPastelColor(),
                      child: ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: getRandomColor(),
                        ),
                        title: Text(
                            'Collected at ${getFormattedDateShortWithTime(DateTime.now().toIso8601String(), context)}',
                            style: Styles.blackBoldSmall),
                        subtitle: Text(
                            '${locationsCollected.elementAt(index).latitude} ${locationsCollected.elementAt(index).longitude}  #${index + 1}',
                            style: Styles.greyLabelSmall),
                      ),
                    ),
                    key: Key(locationsCollected.elementAt(index).date),
                    onDismissed: (direction) {
                      print('##### onDismisses direction: $direction');
                      setState(() {
                        locationsCollected.removeAt(index);
                        //remove at Firestore too
                      });
                    },
                  );
                },
              ),
            ),
            backgroundColor: Colors.brown.shade100,
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.cancel,
                    size: 28,
                    color: Colors.pink.shade300,
                  ),
                  title: Text('Erase All', style: Styles.blackSmall),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.my_location, size: 40, color: Colors.blue),
                  title: Text('Build Route'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.location_on,
                    size: 40,
                    color: Colors.black,
                  ),
                  title: Text('Get Location Here'),
                ),
              ],
              onTap: (index) {
                switch (index) {
                  case 0:
                    _eraseLocations();
                    break;
                  case 1:
                    getSnappedPointsFromRoads();
                    break;
                  case 2:
                    _startTimer();
                    break;
                }
              },
            ),
          );
        });
  }

  @override
  onModeSelected(int seconds) {
    print('****** onModeSelected, seconds: $seconds  🔵  - restart timer');

    _startTimer();
    setState(() {
      collectionSeconds = seconds;
    });
  }
}

abstract class ModesListener {
  onModeSelected(int seconds);
}

class Modes extends StatefulWidget {
  final ModesListener listener;

  const Modes({Key key, this.listener}) : super(key: key);
  @override
  _ModesState createState() => _ModesState();
}

class _ModesState extends State<Modes> {
  int _mode = 1;
  void _onWalkingTapped() {
    print('##### on Walking tapped ########');
    setState(() {
      _mode = 0;
      widget.listener.onModeSelected(30);
    });
  }

  void _onDrivingTapped() {
    print('%%%%%%% on Driving tapped');
    setState(() {
      _mode = 1;
      widget.listener.onModeSelected(10);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: _mode == 0 ? Colors.amber.shade100 : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: _onWalkingTapped,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.directions_walk,
                          color: _mode == 0 ? Colors.black : Colors.grey,
                        ),
                      ),
                      Text(
                        'Walking',
                        style: _mode == 0
                            ? Styles.blackBoldSmall
                            : Styles.greyLabelSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: _mode == 1 ? Colors.amber.shade100 : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: _onDrivingTapped,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.directions_car,
                          color: _mode == 1 ? Colors.black : Colors.grey,
                        ),
                      ),
                      Text('Driving',
                          style: _mode == 1
                              ? Styles.blackBoldSmall
                              : Styles.greyLabelSmall),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
