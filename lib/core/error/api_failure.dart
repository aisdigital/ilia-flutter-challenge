class ApiFailure {
  final String errorMessage;

  const ApiFailure({
    this.errorMessage = 'Unable to fetch from API',
  });
}
