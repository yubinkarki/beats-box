Future<void> customDelay(int duration) async {
  await Future.delayed(Duration(milliseconds: duration));
}
