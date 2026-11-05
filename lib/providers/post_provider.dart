import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nouman_knop/models/post_model.dart';
import 'package:nouman_knop/services/api_service.dart';

// for data fetching means reading
// It always brings new posts,
final postsProvider = FutureProvider<List<PostModel>>((ref) async {
  return ApiService().fetchPosts();
});

final postsByUserProvider = FutureProvider.family<List<PostModel>, int>((
  ref,
  userId,
) async {
  return ApiService().fetchPostsByUser(userId);
});

// for like count StateProvider(start at 0)
final likeCountProvider = StateProvider<int>((ref) {
  return 0;
});
