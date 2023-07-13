import 'package:flutter/material.dart';

import '../infrastructure/get_data.dart';

class RecordModel extends StatelessWidget {
  final UserRepository userRepository = UserRepository();

  RecordModel({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: userRepository.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // データの取得中の表示
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // エラーが発生した場合の処理
          return Text('エラーが発生しました: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // データが利用可能な場合の処理
          final List<User> users = snapshot.data!;
          List<Map<String, dynamic>> combined = [];

          // データを使ってウィジェットを構築する
          for (var i = 0; i < users.length; i++) {
            combined.add({
              'value': users[i].countTime,
              'date': DateTime.parse(users[i].dateTime.toString())
            });
          }
          combined.sort((a, b) => a['date'].compareTo(b['date']));

          Map<String, int> mergedData = {};
          List<Map<String, dynamic>> mergedList = [{}];
          for (var entry in combined) {
            String dateString = entry['date'].toString();
            String date = dateString.substring(0, 10); // 日付の先頭から10文字を抽出
            int value = int.parse(entry['value']);

            if (mergedData.containsKey(date)) {
              mergedData[date] = mergedData[date]! + value;
            } else {
              mergedData[date] = value;
            }

            mergedList = mergedData.entries
                .map((entry) => {'date': entry.key, 'value': entry.value})
                .toList();
          }
          print(mergedList);

          return Scaffold(
            // Scaffoldを使用する
            appBar: AppBar(
              title: Text('Users'),
            ),
            body: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index].countTime),
                  subtitle: Text(users[index].dateTime.toString()),
                );
              },
            ),
          );
        } else {
          // データがない場合の処理
          return const Text('データがありません');
        }
      },
    );
  }
}
