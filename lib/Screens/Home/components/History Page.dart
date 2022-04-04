import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
                      "History", style: TextStyle(color: Colors.grey),
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
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 10),
                        child: Text('Recent News', textAlign: TextAlign.start, style: TextStyle(
                            fontWeight: FontWeight.w600
                        ),),
                      ),
                      Row(
                        children: [
                          Icon(Icons.filter_alt_rounded, color: Colors.red),
                          Text("Filter" , style: TextStyle(
                              fontWeight: FontWeight.w600
                          ))
                        ],
                      )
                    ],
                  ),
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
      height: 80,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.15,
            height: 70,
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.refresh),
            ),
          ),
          VerticalDivider(
            color: Colors.black,
            thickness: 0.5,
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.65,
            height: 70,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text("Lorem ipsum", textScaleFactor: 1.1,maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold),),
                Text("Lorem ipsum dolor sit amet, amet consectetur adipiscing"
                    " elit. Morbi mollis ornare orci. Maecenas nec", maxLines: 2,style: TextStyle(
                    color: Colors.black45, fontSize: 12
                ), textAlign: TextAlign.justify,),
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  child: Text("Dec 21, 2022", maxLines: 1,style: TextStyle(
                      color: Colors.black45, fontSize: 12
                  ), textAlign: TextAlign.left,),
                )
              ],
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.delete), padding: EdgeInsets.all(0), constraints: BoxConstraints(),color: Colors.black54,)
        ],
      ),
    );
  }
}
