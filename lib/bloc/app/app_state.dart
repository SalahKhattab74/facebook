part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}


class AppLoadingData extends AppState {}
class AppSuccsessData extends AppState {}