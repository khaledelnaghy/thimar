import 'package:Thimar/feature/home/data/models/banner_home_response_model/banner_home_response_model.dart';
import 'package:Thimar/feature/home/data/models/category_drinks_response_model/category_drinks_response_model.dart';
import 'package:Thimar/feature/home/data/models/category_fruties_response_model/category_fruties_response_model.dart';
import 'package:Thimar/feature/home/data/models/category_home_response_model/category_home_response_model.dart';
import 'package:Thimar/feature/home/data/models/category_meals_response_model/category_meals_response_model.dart';
import 'package:Thimar/feature/home/data/models/category_vegetables_response_model/category_vegetables_response_model.dart';
import 'package:Thimar/feature/home/data/models/home_response_model/home_response_model.dart';
import 'package:Thimar/feature/home/data/models/listview_product_evalution_response_model/listview_product_evalution_response_model.dart';
import 'package:Thimar/feature/home/data/repo/home_repo.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_event.dart';
import 'package:Thimar/feature/home/presentation/bloc/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<ShowHome>(showHome);
    on<BannerHome>(bannerHome);
    on<CategoriesHome>(categoryHome);
    on<ProductEvaluationHome>(productEvaluationHome);
    on<CategoryDrinksHome>(categoryDrinks);
    on<CategoriesMealsHome>(categoryMeals);
    on<CategoriesVegetablesHome>(categoryVegetables);
    on<CategoriesFruitsHome>(categoryFruties);
    on<AddToFavorite>(addToFavorite);
  }
  HomeResponseModel? homeResponseModel;
  BannerHomeResponseModel? bannerHomeResponseModel;
  CategoryHomeResponseModel? categoryHomeResponseModel;
  CategoryDrinksResponseModel? categoryDrinksResponseModel;
  CategoryMealsResponseModel? categoryMealsResponseModel;
  CategoryVegetablesResponseModel? categoryVegetablesResponseModel;
  CategoryFrutiesResponseModel? categoryFrutiesResponseModel;
  ListviewProductEvalutionResponseModel? listviewProductEvalutionResponseModel;
  Future<void> showHome(ShowHome event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await HomeRepo.showHomeRepo().then((value) {
      if (value != null) {
        homeResponseModel = value;
        emit(HomeSuccessState());
      } else {
        emit(HomeErrorState());
      }
    });
  }

  Future<void> bannerHome(BannerHome event, Emitter<HomeState> emit) async {
    emit(BannerLoadingState());
    await HomeRepo.bannerHomeRepo().then((value) {
      if (value != null) {
        bannerHomeResponseModel = value;
        emit(BannerSuccessState());
      } else {
        emit(BannerErrorState());
      }
    });
  }

  Future<void> categoryHome(
      CategoriesHome event, Emitter<HomeState> emit) async {
    emit(CategoriesLodingState());
    await HomeRepo.categoriesHomeRepo().then((value) {
      if (value != null) {
        categoryHomeResponseModel = value;
        emit(CategoriesSuccessState());
      } else {
        emit(CategoriesErrorState());
      }
    });
  }

  Future<void> categoryDrinks(
      CategoryDrinksHome event, Emitter<HomeState> emit) async {
    emit(CategoriesDrinksLoadingState());
    await HomeRepo.categoriesDrinkRepo().then((value) {
      if (value != null) {
        categoryDrinksResponseModel = value;
        emit(CategoriesDrinksSuccessState());
      } else {
        emit(CategoriesDrinksErrorState());
      }
    });
  }

  Future<void> categoryFruties(
      CategoriesFruitsHome event, Emitter<HomeState> emit) async {
    emit(CategoriesFrutiesLoadingState());
    await HomeRepo.categoriesFrutiesRepo().then((value) {
      if (value != null) {
        categoryFrutiesResponseModel = value;
        emit(CategoriesFrutiesSuccessState());
      } else {
        emit(CategoriesFrutiesErrorState());
      }
    });
  }

  Future<void> categoryMeals(
      CategoriesMealsHome event, Emitter<HomeState> emit) async {
    emit(CategoriesMealLoadingState());
    await HomeRepo.categoryMealRepo().then((value) {
      if (value != null) {
        categoryMealsResponseModel = value;
        emit(CategoriesMealSuccessState());
      } else {
        emit(CategoriesMealErrorState());
      }
    });
  }

  Future<void> categoryVegetables(
      CategoriesVegetablesHome event, Emitter<HomeState> emit) async {
    emit(CategoriesVegetablesLoadingState());
    await HomeRepo.categoryVegetablesRepo().then((value) {
      if (value != null) {
        categoryVegetablesResponseModel = value;
        emit(CategoriesVegetablesSuccessState());
      } else {
        emit(CategoriesVegetablesErrorState());
      }
    });
  }

  Future<void> productEvaluationHome(
      ProductEvaluationHome event, Emitter<HomeState> emit) async {
    emit(ProductEvaluationLoadingState());
    await HomeRepo.listViewEvalutionRepo().then((value) {
      if (value != null) {
        listviewProductEvalutionResponseModel = value;
        emit(ProductEvaluationSuccessState());
      } else {
        emit(ProductEvaluationErrorState());
      }
    });
  }

  Future<void> addToFavorite(
      AddToFavorite event, Emitter<HomeState> emit) async {
    emit(AddToFavoriteLoadingState());
    //api
    await HomeRepo.addToFavoriteRepo(event.id).then(
      (value) {
        if (value == true) {
          emit(AddToFavoriteSuccessState());
        } else {
          emit(AddToFavoriteErrorState());
        }
      },
    );
  }
}

//Evevt , Emitter State
