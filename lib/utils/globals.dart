import 'package:flutter/material.dart';
import 'package:whatsapp/data/models/status_item.dart';
import 'package:whatsapp/data/models/user.dart';

class GlobalColors{
  static const primaryColor = Color(0xff101D25);
  static const primaryColorWithOpacity = Color(0xff232D36);
  static const secundaryColor = Color(0xff04B49A);
  static const chatBackgroudColor = Color(0xffDCF8C6);
  static const singleAndDoubleTickColor = Color(0xffECE5DD);
  static const readTickColor = Color(0xff34B7F1);
  static const textColor = Color(0xffB0BABD);
}

User? globalUserModel;


final List<StatusItem> mockStatus = [
  StatusItem(
      userName: 'Thalisson',
      duration: 5,
      time: 'Ontem 20:19',
      data: 'https://cdn.fstatic.com/media/movies/covers/2019/11/mqupeeot6k731_Lj7obag.jpg'),
  StatusItem(
      userName: 'Thalisson',
      duration: 5,
      time: 'Ontem 22:41',
      data: 'https://tecnoblog.net/wp-content/uploads/2021/10/konami-1060x596.jpeg'),
  StatusItem(
      userName: 'Thalisson',
      duration: 10,
      time: 'Hoje 03:16',
      data: 'https://a-static.mlcdn.com.br/1500x1500/livro-god-of-war-vol-1/boaviagemdistribuidora/95677/44cba38659e8127b6f19bc2b529096a4.jpg'),
  StatusItem(
      userName: 'Thalisson',
      time: 'há 14 minutos',
      data: 'https://i1.wp.com/canoticias.pt/wp-content/uploads/2021/01/rumores-hbo-max-vai-produzir-nova-serie-de-harry-potter-rumores-hbo-max-vai-produzir-nova-serie-de-harry-potter.jpg')
];