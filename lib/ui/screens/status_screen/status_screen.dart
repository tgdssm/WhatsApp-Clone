import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/data/models/status_item.dart';
import 'package:whatsapp/ui/common/my_floating_action_button.dart';
import 'package:whatsapp/ui/screens/status_screen/status_screen_controller.dart';
import 'package:whatsapp/ui/screens/view_status/view_status.dart';
import 'package:whatsapp/utils/globals.dart';



class StatusScreen extends StatelessWidget {
  final _controller = Get.put(StatusScreenController());
  StatusScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<StatusItem> listStatusItem = List.generate(
        10,
        (index) => StatusItem(
            userName: 'Thalisson',
            time: 'há 14 minutos',
            data: 'https://cdn.fstatic.com/media/movies/covers/2019/11/mqupeeot6k731_Lj7obag.jpg'));
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 15),
          itemCount: listStatusItem.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => ViewStatus(status: listStatusItem),
                    barrierDismissible: true,
                );
              },
              title: Text(
                listStatusItem[index].userName,
                style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(listStatusItem[index].time,
                    style: TextStyle(
                        color: GlobalColors.textColor.withOpacity(.8),
                        fontSize: 16)),
              ),
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(listStatusItem[index].data),
                      fit: BoxFit.cover),
                ),
              ),
              // contentPadding: EdgeInsets.symmetric(vertical: 10),
            );
          },
        ),
        ...myFloatingActionButton(
            firstButtonIcon: Icons.edit,
            secondButtonIcon: CupertinoIcons.camera_fill,
            onPressedFirsButton: () {
              print('a');
            },
            onPressedSecondButton: () {
              print('b');
            })
      ],
    );
  }
}
