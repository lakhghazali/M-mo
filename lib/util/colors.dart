import 'package:flutter/material.dart';
import 'dart:ui';


const Color gradientStart = const Color(0xFFCE93D8);
const Color gradientEnd = const Color(0xFFAB47BC);

const primaryGradient = const LinearGradient(
  colors: const [gradientStart, gradientEnd],
  stops: const [0.0, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
