import 'package:flutter_riverpod/flutter_riverpod.dart' show Notifier, NotifierProvider;
import 'package:wear/wear.dart' show WearShape;

final deviceShapeProvider =
    NotifierProvider<_DeviceShape, WearShape>(_DeviceShape.new);

class _DeviceShape extends Notifier<WearShape> {
  @override
  WearShape build() => WearShape.round;

  void update(WearShape shape) => state = shape;
}
