import 'package:app_base_flutter2_getx/app/theme/colors.dart';
import 'package:app_base_flutter2_getx/app/theme/fonts.dart';
import 'package:flutter/material.dart';

import '../constants/fonts.dart';

/// Clase que define estilos de texto para su uso en la aplicación.
///
/// La clase [AppTextStyles] proporciona estilos de texto predefinidos para
/// la consistencia en la apariencia de la aplicación.
///
/// Ejemplo de uso:
/// ```dart
/// Text('Título Grande', style: AppTextStyles.titleLarge);
/// Text('Cuerpo del Texto', style: AppTextStyles.bodyMedium);
/// ```
///
/// Esta clase utiliza tamaños de fuente definidos en la clase [Fonts].
sealed class AppTextStyles {
  static final TextStyle _baseTextStyle = AppFonts.primaryFont.copyWith(
    color: AppColors.textColor,
    fontWeight: FontWeight.w400,
  );

  /// Estilo de texto para títulos grandes, con un tamaño de fuente XL y peso de fuente w500.
  static final TextStyle titleLarge = _baseTextStyle.copyWith(
    fontSize: Fonts.fontSizeMD,
    fontWeight: FontWeight.w600,
  );

  /// Estilo de texto para títulos medianos, con un tamaño de fuente LG y peso de fuente w600.
  static final TextStyle titleMedium = _baseTextStyle.copyWith(
      fontSize: Fonts.fontSizeSL, fontWeight: FontWeight.w500);

  /// Estilo de texto para títulos medianos, con un tamaño de fuente LG y peso de fuente w500.
  static final TextStyle titleSmall = _baseTextStyle.copyWith(
    fontSize: Fonts.fontSizeSL,
    fontWeight: FontWeight.w500,
  );

  /// Estilo de texto para cuerpo grande, con un tamaño de fuente MD y peso de fuente w400.
  static final TextStyle bodyLarge = _baseTextStyle.copyWith(
    fontSize: Fonts.fontSizeMD,
  );

  /// Estilo de texto para cuerpo medio, con un tamaño de fuente SL y peso de fuente w400.
  static final TextStyle bodyMedium = _baseTextStyle.copyWith(
    fontSize: Fonts.fontSizeSL,
  );

  /// Estilo de texto para cuerpo pequeño, con un tamaño de fuente SM y peso de fuente w400.
  static final TextStyle bodySmall = _baseTextStyle.copyWith(
    fontSize: Fonts.fontSizeSM,
  );

  static final TextStyle labelSmall = _baseTextStyle.copyWith(
    fontSize: Fonts.fontSizeXS,
  );

  /// Estilo de texto para botones, con un tamaño de fuente SL y peso de fuente w400.
  static final TextStyle buttonMedium = _baseTextStyle.copyWith(
    fontSize: Fonts.fontSizeSL,
  );
}
