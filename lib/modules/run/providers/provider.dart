import 'package:flutter_riverpod/flutter_riverpod.dart'
    show Notifier, NotifierProvider, StreamProvider;
import 'package:wear/wear.dart' show WearMode, WearShape;
import 'package:wearable_rotary/wearable_rotary.dart';

final deviceShapeProvider =
    NotifierProvider<_DeviceShape, WearShape>(_DeviceShape.new);

class _DeviceShape extends Notifier<WearShape> {
  @override
  WearShape build() => WearShape.round;

  Future<void> update(WearShape shape) async =>
      await Future.delayed(Duration.zero, () => state = shape);
}

final ambientMoodProvider =
    NotifierProvider<_AmbientMood, WearMode>(_AmbientMood.new);

class _AmbientMood extends Notifier<WearMode> {
  @override
  WearMode build() => WearMode.active;

  Future<void> update(WearMode mood) async =>
      await Future.delayed(Duration.zero, () => state = mood);
}

final rotarStream = StreamProvider<RotaryEvent>((ref) => rotaryEvents);

final rotarProvider = NotifierProvider<_Rotar, int>(_Rotar.new);

class _Rotar extends Notifier<int> {
  int r = 0;
  @override
  int build() {
    final rs = ref.watch(rotarStream).value;
    return update(rs);
  }

  int update(RotaryEvent? e) {
    if (e == null) return 0;
    if (e.direction == RotaryDirection.clockwise) {
      if (r < 100) r++;
    } else {
      if (r > 0) r--;
    }
    return r;
  }
}
