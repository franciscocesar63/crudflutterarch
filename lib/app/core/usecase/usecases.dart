import 'package:equatable/equatable.dart';

abstract class UseCase<Type> {
  Future<Type> call(Type type);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
