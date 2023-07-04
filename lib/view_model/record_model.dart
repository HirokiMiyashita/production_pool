import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../view/recode.dart';

class RecordModel extends StatelessWidget {
  const RecordModel({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('record').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // データが利用可能な場合の処理
          final documents = snapshot.data!.docs;
          final test = [];
          for (int index = 0; index < documents.length; index++) {
            final data = documents[index].data();
            test.add(data['time']); // testリストに値を追加
          }
          return Recode(
            item: test,
          );
          // データを使ってウィジェットを構築する
        } else if (snapshot.hasError) {
          // エラーが発生した場合の処理
          return const Text('エラーが発生しました');
        } else {
          // データがない場合の処理
          return const Text('データがありません');
        }
      },
    );
  }
}
