import 'package:flutter/material.dart';

@immutable
abstract class ProductGridEvent {}

class GetProductGrid extends ProductGridEvent {
  final String sessionId, skip, limit;
  final dynamic apiToken;
  GetProductGrid({required this.sessionId, required this.skip, required this.limit, @required this.apiToken});
}