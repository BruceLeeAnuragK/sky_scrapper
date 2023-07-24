import 'dart:async';

class Connect {
  String connectivityStatus;
  StreamSubscription? connectivitystream;
  Connect({
    required this.connectivityStatus,
    this.connectivitystream,
  });
}
