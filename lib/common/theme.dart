ThemeData createTheme() {
  return ThemeData(
    primarySwatch: ColorThemeCustom.customSwatch,
    primaryColor: ColorThemeCustom.customPrimaryColor,
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    buttonTheme: StyleThemeCustom.createButtonTheme()
        .copyWith(shape: StyleThemeCustom.round),
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    accentTextTheme: textTheme,
  );
}
