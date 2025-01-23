import 'package:bloc/bloc.dart';
import 'package:imdb/repositery/api/imdb_api.dart';
import 'package:imdb/repositery/model%20class/imdb_model.dart';
import 'package:meta/meta.dart';

part 'imdb_event.dart';
part 'imdb_state.dart';

class ImdbBloc extends Bloc<ImbdEvent, ImdbState> {
  ImdbApi imdbApi = ImdbApi();
  late Imdbmodel imdbmodel;

  ImdbBloc() : super(ImbdInitial()) {
    on<FetchImdbEvent>((event, emit) async {
      emit(ImbdblocLoading());
      try {
        imdbmodel = await imdbApi.getImdb();
        emit(ImbdblocLoaded());
      } catch (e) {
        print(e);
        emit(ImbdblocError());
      }
      // TODO: implement event handler
    });
  }
}
