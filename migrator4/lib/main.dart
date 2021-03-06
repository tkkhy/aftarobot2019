import 'package:aftarobotlibrary3/util/functions.dart';
import 'package:aftarobotlibrary3/util/snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:migrator4/dashboard.dart';
import 'package:migrator4/generator.dart';

const API_KEY = "AIzaSyBj5ONubUcdtweuIdQPFszc2Z_kZdhd5g8";

void main() {
  try {
    runApp(MyApp());
  } catch (e) {
    print(e);
  }
}

//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Migrator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Dashboard(),
    );
  }
}

class GenerationPage extends StatefulWidget {
  @override
  _GenerationPageState createState() => _GenerationPageState();
}

class _GenerationPageState extends State<GenerationPage>
    implements GeneratorListener, SnackBarListener {
  List<Msg> _messages = List();
  ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  void _start() {
    _refresh();
    Generator.generate(this);
  }

  void _showExistingData() {
    Generator.getExistingData(this);
  }

  void _refresh() {
    setState(() {
      _messages.clear();
      errorText = null;
    });
  }

  Widget _getListView() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
      );
    });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4.0,
        color: Colors.purple.shade50,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ListView.builder(
              itemCount: _messages == null ? 0 : _messages.length,
              controller: scrollController,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    _messages.elementAt(index).message,
                    style: _messages.elementAt(index).style,
                  ),
                  leading: _messages.elementAt(index).icon,
                );
              }),
        ),
      ),
    );
  }

  void _startExistingPage() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => Dashboard()),
    );
  }

  String errorText;
  Widget _getCounterView() {
    if (counter == 0) {
      return Container();
    }
    if (counter < 3) {
      return Text(
        '$counter',
        style: Styles.blackBoldSmall,
      );
    }
    if (counter < 20) {
      return Text(
        '$counter',
        style: Styles.blackBoldMedium,
      );
    }
    if (counter < 100) {
      return Text(
        '$counter',
        style: Styles.blackBoldLarge,
      );
    }

    return Text(
      '$counter',
      style: Styles.blackBoldLarge,
    );
  }

  Widget _getBottom() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 20.0, left: 10.0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.pink,
                  elevation: 8.0,
                  onPressed: _start,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Start Generation',
                      style: Styles.whiteSmall,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: _getCounterView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _doSomething() {
    print('_DGHomePageState._doSomething ${DateTime.now().toIso8601String()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text('AftaRobot Data'),
        leading: IconButton(icon: Icon(Icons.apps), onPressed: _doSomething),
        bottom: _getBottom(),
        backgroundColor: Colors.purple.shade300,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _refresh,
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _startExistingPage,
          ),
        ],
      ),
      backgroundColor: Colors.purple.shade100,
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fincash.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          _getListView(),
        ],
      ),
    );
  }

  @override
  onEvent(Msg msg) {
    setState(() {
      _messages.add(msg);
    });
  }

  @override
  onActionPressed(int action) {
    return null;
  }

  @override
  onError(String message) {
    AppSnackbar.showErrorSnackbar(
        scaffoldKey: _key, message: message, listener: this, actionLabel: "OK");
    setState(() {
      errorText = message;
    });
  }

  int counter = 0;
  @override
  onRecordAdded() {
    setState(() {
      counter++;
    });
  }
}
