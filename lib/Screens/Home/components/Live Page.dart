import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LivePage extends StatefulWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
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
                      "Live", style: TextStyle(color: Colors.grey),
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
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Start Streaming", style: TextStyle(color: Colors.blue),),
                        IconButton(onPressed: (){}, icon: Icon(Icons.video_call, color: Colors.blue,))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text('Currently Live', textAlign: TextAlign.start, style: TextStyle(
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10),
                    child: GridView.builder(
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        // maxCrossAxisExtent: 160,
                          crossAxisCount: 2,
                          childAspectRatio: (MediaQuery
                              .of(context)
                              .orientation ==
                              Orientation
                                  .portrait)
                              ? 1.4
                              : 2 / 2.2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 10),
                      shrinkWrap: true,
                      physics:
                      NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder:
                          (BuildContext ctxt, int index) {
                        return _buildListItem(
                            ctxt);
                      },
                      itemCount: 4,
                    ),
                  ),
                ],
              ),
            ),
          ),
         ),
      ),
    );
  }
  _buildListItem(BuildContext ctxt) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: GestureDetector(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white38,
            ),
            child: Stack(
              children: [
                Expanded(
                  child: Center(
                      child: Image.asset(
                        "assets/images/deer.png",
                        fit: BoxFit.cover,
                      )
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Live",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(backgroundColor: Colors.red, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "200 Views",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
  Widget Streams(){
    return Container(
      child: Center(
        child: Text('It is a second layout tab, which is responsible for taking pictures from your mobile.',
          style: TextStyle(fontSize: 35.0),
        ),
      ),
    );
  }
}
