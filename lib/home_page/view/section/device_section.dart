import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smarthome/home_page/controller/home_page_controller.dart';
import 'package:get/get.dart';
import '../../../service/realtime_database.dart';
import '../../model/material_data.dart';

class DeviceSection extends StatelessWidget {
  DeviceSection({Key? key}) : super(key: key);

  final RealtimeDatabaseUtils _realtimeDatabaseUtils = RealtimeDatabaseUtils();
  final HomePageController _homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: StreamBuilder(
            stream: _realtimeDatabaseUtils.mainRef.onValue,
            builder:
                (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (snapshot.hasData) {
                List<MaterialData> _listMaterial =
                    _realtimeDatabaseUtils.readAllMaterialData(snapshot);
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: _listMaterial.length,
                  padding: const EdgeInsets.all(2.0),
                  itemBuilder: (BuildContext context, int index) {
                    bool valueOn = _listMaterial[index].value == 1;
                    return GestureDetector(
                      onTap: () {
                        _homePageController
                            .goToDetailMaterial(_listMaterial[index]);
                      },
                      onLongPress: () async {
                        await _homePageController
                            .changeValueOfMaterial(_listMaterial[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0)),
                            image: DecorationImage(
                              image: NetworkImage(_listMaterial[index].photo),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                gradient: LinearGradient(
                                    colors: [
                                      valueOn == true
                                          ? Colors.orange
                                          : Colors.black,
                                      const Color(0x19000000),
                                    ],
                                    begin: const FractionalOffset(0.0, 1.0),
                                    end: const FractionalOffset(0.0, 0.0),
                                    stops: const [0.0, 1.0],
                                    tileMode: TileMode.clamp),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      _listMaterial[index].title,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
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
                return Container();
              }
            }),
      ),
    );
  }
}
