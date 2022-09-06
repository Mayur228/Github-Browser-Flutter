class Resource<T> {
  final T? _data;
  final dynamic error;

  Resource({T? data, this.error}) : _data = data;

  factory Resource.pending() {
    return Resource(
      data: null,
      error: null,
    );
  }

  factory Resource.data(T data) {
    return Resource(
      data: data,
      error: null,
    );
  }

  factory Resource.error(error) {
    return Resource(data: null, error: error);
  }

  R when<R extends Object?>({
    required R Function(T value) data,
    required R Function(dynamic error) error,
    required R Function() pending,
  }) {
    if (_data == null && this.error == null) {
      return pending();
    } else if (_data != null) {
      return data(_data as T);
    } else {
      return error(this.error);
    }
  }
}