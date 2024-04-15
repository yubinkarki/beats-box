import "package:beats_box/utilities/utilities_barrel.dart" show Messenger, SnackMessenger;

mixin SnackMessengerMixin {
  final Messenger messenger = SnackMessenger();
}
