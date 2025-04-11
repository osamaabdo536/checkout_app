class Failure{
  final String errorMess;

  Failure({required this.errorMess});
}

class ServiceFailure extends Failure{
  ServiceFailure({required super.errorMess});
}
