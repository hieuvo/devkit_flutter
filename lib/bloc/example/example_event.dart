import 'package:flutter/material.dart';

@immutable
abstract class ExampleEvent {}

class GetExample extends ExampleEvent {
  final dynamic apiToken;
  GetExample({@required this.apiToken});
}

class PostExample extends ExampleEvent {
  final String id;
  final dynamic apiToken;
  PostExample({required this.id, required this.apiToken});
}