import 'package:flutter/material.dart';

double getSize(BuildContext context) {
  final aboveAppBar = MediaQuery.of(context).padding.top;
  final heightAppBar = AppBar().preferredSize.height;
  return (heightAppBar - aboveAppBar).abs();
}
