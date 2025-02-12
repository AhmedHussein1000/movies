import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/cache/cache_constants.dart';
import 'package:movies_app/movies/domain/entities/genre_entity.dart';
import 'package:movies_app/movies/domain/entities/movie_entity.dart';
import 'package:movies_app/movies/domain/entities/movie_details_entity.dart';
import 'package:movies_app/movies/domain/entities/movies_response_entity.dart';
import 'package:movies_app/movies/domain/entities/recommendation_entity.dart';
import 'package:movies_app/movies/domain/entities/recommendations_response_entity.dart';

class HiveHelper {
  static const _cacheDuration = Duration(days: 1);

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MovieEntityAdapter());
    Hive.registerAdapter(MovieDetailsEntityAdapter());
    Hive.registerAdapter(RecommendationEntityAdapter());
    Hive.registerAdapter(RecommendationsResponseEntityAdapter());
    Hive.registerAdapter(GenreEntityAdapter());
    Hive.registerAdapter(MoviesResponseEntityAdapter());
    if (!Hive.isBoxOpen(CacheConstants.nowPlayingBox)) {
      await Hive.openBox<MoviesResponseEntity>(CacheConstants.nowPlayingBox);
    }

    if (!Hive.isBoxOpen(CacheConstants.popularBox)) {
      await Hive.openBox<MoviesResponseEntity>(CacheConstants.popularBox);
    }
    if (!Hive.isBoxOpen(CacheConstants.topRatedBox)) {
      await Hive.openBox<MoviesResponseEntity>(CacheConstants.topRatedBox);
    }
    if (!Hive.isBoxOpen(CacheConstants.movieDetailsBox)) {
      await Hive.openBox<MovieDetailsEntity>(CacheConstants.movieDetailsBox);
    }
    if (!Hive.isBoxOpen(CacheConstants.recommendationBox)) {
      await Hive.openBox<RecommendationsResponseEntity>(
          CacheConstants.recommendationBox);
    }
  }

  Future<void> saveItemData<T>({
    required T data,
    required String boxName,
    required String key,
  }) async {
    final box = Hive.box<T>(boxName);
    await box.put(key, data);
  }

  Future<T?> getItemData<T>(
      {required String boxName, required String key}) async {
    final box = Hive.box<T>(boxName);
    final item = box.get(key);
    if (item != null && item is MoviesResponseEntity) {
      if (_isCacheExpired(item.timestamp ?? DateTime.now())) {
        await box.delete(key);
        return null;
      }
    } else if (item != null && item is RecommendationsResponseEntity) {
      if (_isCacheExpired(item.timestamp ?? DateTime.now())) {
        await box.delete(key);
        return null;
      }
    } else if (item != null && item is MovieDetailsEntity) {
      if (_isCacheExpired(item.timestamp ?? DateTime.now())) {
        await box.delete(key);
        return null;
      }
    }

    return item;
  }

  bool _isCacheExpired(DateTime timestamp) {
    final now = DateTime.now();
    final isExpired = now.difference(timestamp) > _cacheDuration;
    return isExpired;
  }

  String getKey({required int? page}) => 'page$page';

  Future<void> clearExpiredCache() async {
    final boxes = [
      CacheConstants.nowPlayingBox,
      CacheConstants.popularBox,
      CacheConstants.topRatedBox,
      CacheConstants.movieDetailsBox,
      CacheConstants.recommendationBox,
    ];

    for (final boxName in boxes) {
      if (boxName == CacheConstants.nowPlayingBox ||
          boxName == CacheConstants.popularBox ||
          boxName == CacheConstants.topRatedBox) {
        final box = Hive.box<MoviesResponseEntity>(boxName);
        final keysToRemove = <dynamic>[];

        for (final key in box.keys) {
          final cached = box.get(key);
          if (cached != null &&
              _isCacheExpired(cached.timestamp??DateTime.now())) {
            keysToRemove.add(key);
          }
        }
        await box.deleteAll(keysToRemove);
      } else if (boxName == CacheConstants.movieDetailsBox) {
        final box = Hive.box<MovieDetailsEntity>(boxName);
        final keysToRemove = <dynamic>[];

        for (final key in box.keys) {
          final cached = box.get(key);
          if (cached != null &&
              _isCacheExpired(cached.timestamp??DateTime.now())) {
            keysToRemove.add(key);
          }
        }
        await box.deleteAll(keysToRemove);
      } else if (boxName == CacheConstants.recommendationBox) {
        final box = Hive.box<RecommendationsResponseEntity>(boxName);
        final keysToRemove = <dynamic>[];

        for (final key in box.keys) {
          final cached = box.get(key);
          if (cached != null &&
              _isCacheExpired(cached.timestamp??DateTime.now())) {
            keysToRemove.add(key);
          }
        }

        await box.deleteAll(keysToRemove);
      }
    }
  }
}
