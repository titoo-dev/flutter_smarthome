import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smarthome/home_page/model/material_data.dart';
import 'package:flutter_smarthome/service/utils.dart';

class RealtimeDatabaseUtils {
  static final _client = FirebaseDatabase.instance;
  static const String mainKey = 'my_home';
  DatabaseReference mainRef = _client.ref().child(mainKey);
  DatabaseReference mainRefTest =
      _client.ref().child('$mainKey/livingRoom9770');
  String keyOfData = '';

  DatabaseReference getKeyRandom(String key) {
    var k = Random().nextInt(10000);
    keyOfData = '$key$k';
    return _client.ref().child('$mainKey/$keyOfData');
  }

  DatabaseReference getKey(String id) {
    return _client.ref().child('$mainKey/$id');
  }

  List<MaterialData> readAllMaterialData(
      AsyncSnapshot<DatabaseEvent> snapshot) {
    Map<Object?, dynamic> map =
        snapshot.data?.snapshot.value as Map<Object?, dynamic>;
    print('$logTrace $map');
    List<MaterialData> _list = [];
    map.forEach((key, value) {
      final data = Map<String, dynamic>.from(value);
      _list.add(MaterialData.fromList([
        data['id'],
        data['title'],
        data['value'],
      ]));
    });

    return _list;
  }

  Future<void> updateData(
      {required DatabaseReference ref,
      required String id,
      required String title,
      required int value}) async {
    await ref.update({
      "id": id,
      "title": title,
      "value": value,
    });
  }

  Future<void> createData(
      {required DatabaseReference ref,
      required String id,
      required String title,
      required int value}) async {
    await ref.set({
      "id": id,
      "title": title,
      "value": value,
    }).then((value) => print("OK"));
  }

  void deleteData(DatabaseReference ref, String key) {
    ref.child(key).remove();
  }

/*await _realtimeDatabaseUtils.createData(
                      _realtimeDatabaseUtils.getKeyRandom('livingRoom'),
                      'title',
                      'subtitle',
                    );*/
/*await _realtimeDatabaseUtils.updateData(
                        _realtimeDatabaseUtils.mainRefTest, 'hr', 'hrhrhr');*/
/*_realtimeDatabaseUtils.deleteData(
                        _realtimeDatabaseUtils.mainRef, '3329');*/
}
