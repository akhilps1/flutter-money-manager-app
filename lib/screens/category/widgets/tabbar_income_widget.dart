import 'package:flutter/material.dart';

class TabBarIncomeWidget extends StatelessWidget {
  const TabBarIncomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (BuildContext ctx, int index) {
          return Card(
            elevation: 1,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 30,
                child: Text(
                  '12 \ndes',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              title: const Text('Income'),
              subtitle: const Text('Travel'),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            ),
          );
        },
        separatorBuilder: (BuildContext ctx, int index) {
          return const SizedBox(
            height: 4,
          );
        },
        itemCount: 10);
    
  }
}
