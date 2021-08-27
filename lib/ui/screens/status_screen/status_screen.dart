import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/ui/common/my_floating_action_button.dart';
import 'package:whatsapp/ui/screens/status_screen/view_status/view_status.dart';
import 'package:whatsapp/utils/globals.dart';

class Status {
  late String name;
  late String time;
  late String photo;

  Status({required this.name, required this.time, required this.photo});


}

class StatusScreen extends StatelessWidget {
  StatusScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Status> objetos = List.generate(10, (index) => Status(name: 'Thalisson', time: 'há 14 minutos', photo: 'https://www.vounajanela.com/wp-content/uploads/2019/12/toquio-1.jpg'));
    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 15),
          itemCount: objetos.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){
                showDialog(context: context, builder: (context) => ViewStatus(status: objetos[index],),);
              },
              title: Text(objetos[index].name, style: TextStyle(color: GlobalColors.textColor, fontSize: 20, fontWeight: FontWeight.bold),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(objetos[index].time, style: TextStyle(color: GlobalColors.textColor.withOpacity(.8), fontSize: 16)),
              ),
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(objetos[index].photo),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              // contentPadding: EdgeInsets.symmetric(vertical: 10),
            );
          },
        ),
        ...myFloatingActionButton(
          firstButtonIcon: Icons.edit,
          secondButtonIcon: CupertinoIcons.camera_fill,
          onPressedFirsButton: (){
            print('a');
          },
          onPressedSecondButton: (){
            print('b');
          }
        )
      ],
    );
  }
}
