import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/functions/show_toast.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entity.dart';
import 'package:movies_app/movies/presentation/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/widgets/movie_details_widgets/recommendations_list.dart';
import 'package:movies_app/movies/presentation/widgets/movie_details_widgets/recommendations_loading.dart';

class RecommendationsGridBlocConsumer extends StatefulWidget {
  const RecommendationsGridBlocConsumer({super.key});

  @override
  State<RecommendationsGridBlocConsumer> createState() =>
      _RecommendationsGridBlocConsumerState();
}

class _RecommendationsGridBlocConsumerState
    extends State<RecommendationsGridBlocConsumer> {
  List<RecommendationEntity> recommendations = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
        listener: (context, state) {
          if (state is RecommendationsSuccess) {
            recommendations.addAll(state.recommendations);
          }
          if (state is RecommendationsPaginationError) {
            customToast(message: state.errorMessage, state: ToastStates.error);
          }
        },
        buildWhen: (previous, current) =>
            current is RecommendationsLoading ||
            current is RecommendationsSuccess ||
            current is RecommendationsError ||
            current is RecommendationsPaginationLoading ||
            current is RecommendationsPaginationError ||
            current is RecommendationsNoMoreData,
        builder: (context, state) {
          if (state is RecommendationsSuccess ||
              state is RecommendationsPaginationLoading ||
              state is RecommendationsPaginationError ||
              state is RecommendationsNoMoreData) {
            return RecommendationsList(recommendations: recommendations);
          } else if (state is RecommendationsError) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(state.errorMessage),
              ),
            );
          } else {
            return const RecommendationsLoadingWidget();
          }
        });
  }
}
