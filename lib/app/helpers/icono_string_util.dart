import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _icons = <String, IconData>{
  'clinicMedical': FontAwesomeIcons.houseChimneyMedical,
  'houseUser': FontAwesomeIcons.houseUser,
  'chessQueen': FontAwesomeIcons.chessQueen,
  'shapes': FontAwesomeIcons.shapes,
  'cameraRetro': FontAwesomeIcons.cameraRetro,
  'building': FontAwesomeIcons.building,
  'shoppingBag': FontAwesomeIcons.bagShopping,
  'babyCarriage': FontAwesomeIcons.babyCarriage,
  'tree': FontAwesomeIcons.tree,
  'coffee': FontAwesomeIcons.mugSaucer,
  'child': FontAwesomeIcons.child,
  'bookOpen': FontAwesomeIcons.bookOpen,
  'biking': FontAwesomeIcons.personBiking,
  'baby': FontAwesomeIcons.baby,
  'checkCircle': FontAwesomeIcons.circleCheck,
  'users': FontAwesomeIcons.users,
  'userEdit': FontAwesomeIcons.userPen,
  'plus': FontAwesomeIcons.plus,
  'edit': FontAwesomeIcons.penToSquare,
  'car': FontAwesomeIcons.car,
  'shieldAlt': FontAwesomeIcons.shieldHalved,
  'shippingFast': FontAwesomeIcons.truckFast,
  'home': FontAwesomeIcons.house,
  'file-invoice-dollar': FontAwesomeIcons.fileInvoiceDollar,
  'hand-holding-usd': FontAwesomeIcons.handHoldingDollar,
  'search-dollar': FontAwesomeIcons.magnifyingGlassDollar
};

IconData getIcon(String nombreIcono) {
  try {
    return _icons[nombreIcono]!;
  } catch (e) {
    return FontAwesomeIcons.rocket;
  }
}
