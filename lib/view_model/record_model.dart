import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Record extends StatelessWidget {
  const Record({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('record').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.hasData);
          // データが利用可能な場合の処理
          final documents = snapshot.data!.docs;
          final test = [];
          for (int index = 0; index < documents.length; index++) {
            final data = documents[index].data();
            test.add(data['time']); // testリストに値を追加
          }
          // データを使ってウィジェットを構築する
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final data = documents[index].data();
              print(test);
              return ListTile(
                title: Text(data['time']),
              );
            },
          );
        } else if (snapshot.hasError) {
          print(snapshot.data);
          // エラーが発生した場合の処理
          return Text('エラーが発生しました');
        } else {
          // データがない場合の処理
          return Text('データがありません');
        }
      },
    );
  }
}
