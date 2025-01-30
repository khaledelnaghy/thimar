import 'package:Thimar/feature/favourite/data/model/resposne/favorites_response_model/favorites_response_model.dart';
import 'package:Thimar/feature/favourite/data/repo/favorite_repo.dart';
import 'package:Thimar/feature/favourite/presentation/bloc/favorite_event.dart';
import 'package:Thimar/feature/favourite/presentation/bloc/favorite_state.dart';
import 'package:bloc/bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<ShowFavoriteEvent>(showFavorite);
  }
  FavoritesResponseModel? favoriteResponseModel;
  Future<void> showFavorite(
      FavoriteEvent event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoadingState());

    await FavoriteRepo.showFavoriteReoo().then((value) {
      if (value != null) {
        favoriteResponseModel = value;
        emit(FavoriteSuccessState());
      } else {
        emit(FavoriteErrorState());
      }
    });
  }
}
