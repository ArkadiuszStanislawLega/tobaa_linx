export 'baa_weights.dart';
export 'box_weights.dart';
export 'loading_area_weights.dart';
export 'stack_weights.dart';

class Weights{
  late double net;
  late double gross;
  late double netExplosive;

  Weights({this.net = 0.0, this.gross = 0.0, this.netExplosive = 0.0});
}