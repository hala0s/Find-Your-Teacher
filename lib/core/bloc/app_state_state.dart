part of 'app_state_bloc.dart';

enum BlocState { init, loading, success, failed }

class BlocStateData<T> {
  final T? data;
  final BlocState _state;
  const BlocStateData.init()
      : data = null,
        _state = BlocState.init;

  const BlocStateData.loading()
      : data = null,
        _state = BlocState.loading;

  const BlocStateData.success(this.data) : _state = BlocState.success;

  const BlocStateData.failed()
      : data = null,
        _state = BlocState.failed;
  bool get isLoading => _state == BlocState.loading;
  bool get isSuccess => _state == BlocState.success;
  bool get isFailed => _state == BlocState.failed;
  bool get isInit => _state == BlocState.init;
}

@immutable
class BlocIstate {
  final BlocStateData blocStateData ;
  BlocIstate ({required this.blocStateData});
}
