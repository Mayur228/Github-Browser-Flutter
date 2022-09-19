abstract class Error {

}

class ServerError extends Error {
  final String error;

  ServerError(this.error);
}
