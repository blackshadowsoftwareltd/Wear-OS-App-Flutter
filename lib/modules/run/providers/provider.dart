import 'package:flutter_riverpod/flutter_riverpod.dart'
    show Notifier, NotifierProvider;
import 'package:wear/wear.dart' show WearMode, WearShape;

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
