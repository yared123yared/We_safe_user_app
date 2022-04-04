import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.grey),
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Report", style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          endDrawer: Drawer(
            backgroundColor: Colors.grey,

            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      UserAccountsDrawerHeader(
                        // decoration: BoxDecoration(
                        //     color: myCustomColors.loginBackgroud),
                        accountName: FutureBuilder<SharedPreferences>(
                            future: SharedPreferences.getInstance(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.none &&
                                  snapshot.hasData == null) {
                                return Container(
                                    height: 10,
                                    child: Center(
                                        child:
                                        CircularProgressIndicator()));
                              }
                              print(
                                  'project snapshot data is: ${snapshot.data}');
                              if (snapshot.data == null) {
                                return Container(
                                    height: 10,
                                    child: Center(
                                        child:
                                        CircularProgressIndicator()));
                              } else {
                                return snapshot.data!.getString('first_name') ==
                                    null
                                    ? Text(
                                  "User Name",
                                )
                                    : Text(snapshot.data!
                                    .getString('first_name')!);
                              }
                            }),
                        accountEmail: FutureBuilder<SharedPreferences>(
                            future: SharedPreferences.getInstance(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.none &&
                                  snapshot.hasData == null) {
                                return Container(
                                    height: 10,
                                    child: Center(
                                        child:
                                        CircularProgressIndicator()));
                              }
                              print(
                                  'project snapshot data is: ${snapshot.data}');
                              if (snapshot.data == null) {
                                return Container(
                                    height: 10,
                                    child: Center(
                                        child:
                                        CircularProgressIndicator()));
                              } else {
                                return snapshot.data!
                                    .getString('email') ==
                                    null
                                    ? Text(
                                  "9484alen@gmail.com",
                                )
                                    : Text(snapshot.data!
                                    .getString('email')!);
                              }
                            }),
                        currentAccountPicture: FutureBuilder<SharedPreferences>(
                            future: SharedPreferences.getInstance(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.none &&
                                  snapshot.hasData == null) {
                                return Container(
                                    height: 10,
                                    child: Center(
                                        child:
                                        CircularProgressIndicator()));
                              }
                              print(
                                  'project snapshot data is: ${snapshot.data}');
                              if (snapshot.data == null) {
                                return Container(
                                    height: 10,
                                    child: Center(
                                        child:
                                        CircularProgressIndicator()));
                              } else {
                                return snapshot.data!
                                    .getString('image') ==
                                    null || snapshot.data!
                                    .getString('image') ==
                                    ""
                                    ? CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      'assets/images/app_logo.png'),
                                )
                                    : CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(snapshot.data!
                                      .getString('image')!),
                                );
                              }
                            }),
                      ),
                      ListTile(
                        title: Text("Language"),
                      ),
                      ListTile(
                        title: Text("Settings"),
                      ),
                      ListTile(
                        title: Text("Forum"),
                      ),
                      ListTile(
                        title: Text("Report"),
                      )
                    ],
                  ),
                ),
                Divider(),
                ElevatedButton(onPressed: (){}, child: Text("Log Out"))
              ],
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width*0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.blue,
                        ),

                      ),
                      Container(
                        height: MediaQuery.of(context).size.width*0.5,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/images/Vector.png",
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing"
                                  " orci non sem aliquam rutrum in in ipsum.",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 10),
                    child: Text('Report', textAlign: TextAlign.start, style: TextStyle(
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                  Cards(),
                  Cards(),
                  Cards(),
                  Cards(),
                  Cards(),
                  Cards(),
                  Cards(),
                  Cards(),
                  Cards(),
                  Cards(),
                  Cards(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget Cards(){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey)
      ),
      height: 40,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.15,
            height: 40,
            child: IconButton(icon: Icon(Icons.phone), onPressed: (){},),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            height: 40,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child:Text("Lorem ipsum dolor sit amet", maxLines: 2, textAlign: TextAlign.justify,),
          )

        ],
      ),
    );
  }
}
