import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smarthome/home_page/controller/navigation_section.dart';
import 'package:flutter_smarthome/home_page/model/material_data.dart';
import 'package:flutter_smarthome/home_page/view/section/camera_section.dart';
import 'package:flutter_smarthome/service/realtime_database.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final RealtimeDatabaseUtils _realtimeDatabaseUtils = RealtimeDatabaseUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: const Drawer(),
      body: Column(
        children: [
          const NavigationSection(),
          const SizedBox(
            height: 8.0,
          ),
          CameraSection(),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: StreamBuilder(
                stream: _realtimeDatabaseUtils.mainRef.onValue,
                builder: (BuildContext context,
                    AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.hasData) {
                    List<MaterialData> _listMaterial =
                        _realtimeDatabaseUtils.readAllMaterialData(snapshot);
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: _listMaterial.length,
                      padding: const EdgeInsets.all(2.0),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              height: 150,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://firebasestorage.googleapis.com/v0/b/praise-ad755.appspot.com/o/profile%2FNDm069nFTcRWWOQjJWSuePFmgST2?alt=media&token=04f8f913-a216-4ca3-9645-09479f0e3ebd'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.black,
                                          Color(0x19000000),
                                        ],
                                        begin: FractionalOffset(0.0, 1.0),
                                        end: FractionalOffset(0.0, 0.0),
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.clamp),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          _listMaterial[index].title,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          _listMaterial[index].value,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w200,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ), /* add child content here */
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          )
        ],
      ),
    );
  }
}
