import 'package:equatable/equatable.dart';

abstract class PageState extends Equatable {

  final List propss;
  PageState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnPageState extends PageState {

  UnPageState();

  @override
  String toString() => 'UnPageState';
}

/// Initialized
class InPageState extends PageState {
  final String hello;

  InPageState(this.hello) : super([hello]);

  @override
  String toString() => 'InPageState $hello';

}

class ErrorPageState extends PageState {
  final String errorMessage;

  ErrorPageState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorPageState';
}
