import 'package:flutter/material.dart';

class StatusList extends StatelessWidget {
  StatusList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 15,
      itemBuilder: (context, index) {
        return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://www.vounajanela.com/wp-content/uploads/2019/12/toquio-1.jpg'),
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ),
        );
      },
    );
  }
}
