// import 'package:dio/dio.dart';
// import 'package:nouman_knop/models/post_model.dart';

// class ApiService {
//   // 1. Dio ka instance banana aur Base URL set karna
//   final Dio _dio = Dio(
//     BaseOptions(
//       baseUrl: 'https://jsonplaceholder.typicode.com',
//       connectTimeout: const Duration(seconds: 10), // 10 sec mein internet na mile toh cancel
//       receiveTimeout: const Duration(seconds: 10),
//       responseType: ResponseType.json,
//     ),
//   );

//   // 2. Posts fetch karne ka function
//   Future<List<PostModel>> fetchPosts() async {
//     try {
//       // Endpoint call ho raha hai: https://jsonplaceholder.typicode.com/posts
//       final response = await _dio.get('/posts');

//       // HTTP Status Code check karna (200 = OK / Success)
//       if (response.statusCode == 200) {
//         // response.data Dio mein automatically decoded List hoti hai
//         List<dynamic> rawList = response.data;

//         // Har item ko PostModel.fromJson ke zariye Dart object mein badalna
//         List<PostModel> posts = rawList.map((item) {
//           return PostModel.fromJson(item as Map<String, dynamic>);
//         }).toList();

//         return posts;
//       } else {
//         throw Exception('Server error: ${response.statusCode}');
//       }
//     } on DioException catch (e) {
//       // Internet ya network ka masla (Company level error handling)
//       if (e.type == DioExceptionType.connectionTimeout) {
//         throw Exception('Connection timed out. Internet slow hai!');
//       } else if (e.type == DioExceptionType.connectionError) {
//         throw Exception('No Internet connection!');
//       } else {
//         throw Exception('Network issue: ${e.message}');
//       }
//     } catch (e) {
//       // Koi doosra masla (jaise parsing error)
//       throw Exception('Unexpected error: $e');
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:nouman_knop/models/post_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      responseType: ResponseType.json,
    ),
  );
  //hum constructor banaii gy ur os cosntructor ki waaja se Interceptor active hogya
  ApiService() {
    // Token / auth interceptor(toll Plaza)
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          //in real jobs , phone ki memory sy token uthya jata hai
          // String? token = await  Storage.read(key:"auth_token"); opar async aye ga
          String userToken = 'my_sercret_token_1234';
          options.headers['Authorization'] = 'bearer$userToken';
          return handler.next(options);
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: false,
        error: true,
      ),
    );
  }

  Future<List<PostModel>> fetchPosts() async {
    try {
      final response = await _dio.get('/posts');
      // 200 means data mil gya
      // chunkyy response ma data haii tu agyy hum reposnse as a varaible use kare gy
      if (response.statusCode == 200) {
        // yaha data response.data ma para hai, Server se raw data ata hai
        List<dynamic> rawList = response.data;
        // raw data ko PostModel ma dal do
        List<PostModel> posts = rawList.map((item) {
          return PostModel.fromJson(item);
        }).toList();
        // .toList() asal ma uski ik list bana ka UI par show kar deta hai

        return posts;
      } else {
        //throw Exception('Server error: ${response.statusCode}');
        //}
        throw Exception('Server error : ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception("internet issue: please check your Inernet connection");
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }

  Future<bool> createPost(String title, String body) async {
    try {
      final response = await _dio.post(
        '/posts',
        data: {'title': title, 'body': body, 'userId': 1},
      );
      // 201 ka matlb server par data store hogya
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      return false;
    }
  }

  // The below mwthod is known as Interceptors
  // this function for Filtering and Searching  , Jaisy youtube ma facebookma E-commerce apps ma
  Future<List<PostModel>> fetchPostsByUser(int userId) async {
    try {
      final response = await _dio.get(
        "/posts",
        // Dio itslef will put ?userId=1
        queryParameters: {'userId': userId},
      );
      if (response.statusCode == 200) {
        List<dynamic> rawList = response.data;
        return rawList.map((item) => PostModel.fromJson(item)).toList();
      } else {
        throw Exception('Server eroor');
      }
    } catch (e) {
      throw Exception("Masla aya");
    }
  }

  // post delete karny ka function ( Delete Request )
  Future<bool> deletePost(int id) async {
    try {
      final response = await _dio.delete('/posts/$id');
      // 200 ka matlb server sy data delete hogya
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print("Delete error : $e");
    } catch (e) {}
    return false;
  }

  // Update hony ka funtion with ID and New Title and Body ka sath
  Future<bool> updatePost(int id, String newTitle, String newBody) async {
    try {
      // is function ma hum Server ko data bhej rahy
      final response = await _dio.put(
        '/posts/$id',
        data: {'title': newTitle, 'body': newBody, 'userId': 1},
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
