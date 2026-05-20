
// ignore: unused_import
import 'dart:async';

import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../config/config.dart';


// Contrato Socket.IO con el backend:
// - Cliente emite 'CLIENT_REGISTER': { nomen, color (hex), lng, lat }
// - Cliente emite 'CLIENT_MOVE': { lng, lat }
// - Servidor emite 'CLIENT_JOINED': { id, nomen, color, lng, lat }
// - Servidor emite 'CLIENT_LEFT': { id }
// - Servidor emite 'CLIENT_MOVED': { id, lng, lat }
// - Servidor emite 'GET_CLIENTS': [ { id, nomen, color, lng, lat }, ... ]

class ChartaService {

  IO.Socket? _socket;
  final Map<String, Usor> _usores = {};
  late final StreamController<List<Usor>> _usoresController;

  Stream<List<Usor>> get usoresStream => _usoresController.stream;

  String? get meusSocketId => _socket?.id;

  ChartaService() {
    _usoresController = StreamController<List<Usor>>.broadcast();
  }

  void conectare() {
    _socket = IO.i