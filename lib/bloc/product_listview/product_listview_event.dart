import 'package:flutter/material.dart';

@immutable
abstract class ProductListviewEvent {}

class GetProductListview extends ProductListviewEvent {
  final String sessionId, skip, limit;
  final dynamic apiToken;
  GetProductListview({required this.sessionId, required this.skip, required this.limit, required this.apiToken});
}