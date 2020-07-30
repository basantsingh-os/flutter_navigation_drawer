import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'new_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.amber,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[50]
              : null),
      home: new HomePage(),
      //in case of single page routing use this apporach it is costly so resuse pages multiple time
      // routes: <String, WidgetBuilder>{
      //   "/a": (BuildContext context) => new NewPage("New page"),
      // },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Drawer App"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Basant Singh"),
            accountEmail: new Text("singhbasant1010@gmail.com"),
            otherAccountsPictures: <Widget>[
              new CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.grey[200]
                          : Colors.white,
                  child: new Text("S"))
            ],
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.grey[200]
                  : Colors.white,
              child: new Text("B"),
            ),
          ),
          new ListTile(
              title: new Text("Page One"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder:(BuildContext context)=>
                  new NewPage("Page One")
                ));
                // Navigator.of(context).pushNamed("/a");
                //in case of single page routing use this apporach it is costly so resuse pages multiple time
              }),
          new ListTile(
            title: new Text("Page Two"),
            trailing: new Icon(Icons.arrow_downward),
            onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder:(BuildContext context)=>
                  new NewPage("Page Two")
                ));
                // Navigator.of(context).pushNamed("/a");
                //in case of single page routing use this apporach it is costly so resuse pages multiple time
              }
          ),
          new Divider(),
          new ListTile(
            title: new Text("Close"),
            trailing: new Icon(Icons.close),
            // closing the drawer code

            onTap: () => Navigator.of(context).pop(),

            ///////
          )
        ],
      )),
      body: new Container(
        child: new Center(child: new Text("Home Page")),
      ),
    );
  }
}
