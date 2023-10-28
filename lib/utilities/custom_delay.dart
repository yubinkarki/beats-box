Future<void> customMiliDelay(int duration) async {
  await Future.delayed(Duration(milliseconds: duration));
}
