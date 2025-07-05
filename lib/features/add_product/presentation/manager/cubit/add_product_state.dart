abstract class AddProductState {}

final class AddProductInitialState extends AddProductState {}

final class AddProductLoadingState extends AddProductState {}

final class AddProductSuccessState extends AddProductState {}

final class AddProductFailureState extends AddProductState {
  final String message;

  AddProductFailureState({required this.message});
}
