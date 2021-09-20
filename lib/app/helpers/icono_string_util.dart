import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _icons = <String, IconData>{
  'clinicMedical': FontAwesomeIcons.clinicMedical,
  'houseUser': FontAwesomeIcons.houseUser,
  'chessQueen': FontAwesomeIcons.chessQueen,
  'shapes': FontAwesomeIcons.shapes,
  'cameraRetro': FontAwesomeIcons.cameraRetro,
  'building': FontAwesomeIcons.building,
  'shoppingBag': FontAwesomeIcons.shoppingBag,
  'babyCarriage': FontAwesomeIcons.babyCarriage,
  'tree': FontAwesomeIcons.tree,
  'coffee': FontAwesomeIcons.coffee,
  'child': FontAwesomeIcons.child,
  'bookOpen': FontAwesomeIcons.bookOpen,
  'biking': FontAwesomeIcons.biking,
  'baby': FontAwesomeIcons.baby,
  'checkCircle': FontAwesomeIcons.checkCircle,
  'users': FontAwesomeIcons.users,
  'userEdit': FontAwesomeIcons.userEdit,
  'plus': FontAwesomeIcons.plus,
  'edit': FontAwesomeIcons.edit,
  'car': FontAwesomeIcons.car,
  'shieldAlt': FontAwesomeIcons.shieldAlt,
  'shippingFast': FontAwesomeIcons.shippingFast,
  'home': FontAwesomeIcons.home,
  'file-invoice-dollar': FontAwesomeIcons.fileInvoiceDollar,
  'hand-holding-usd': FontAwesomeIcons.handHoldingUsd,
  'search-dollar': FontAwesomeIcons.searchDollar
};

IconData getIcon(String nombreIcono) {
  try {
    return _icons[nombreIcono]!;
  } catch (e) {
    return FontAwesomeIcons.rocket;
  }
}
