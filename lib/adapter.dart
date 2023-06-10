import 'dart:convert';

class FacebookApi {
  String getPostList() {
    return '''
    [ 
      { 
        "title":"Facebook post One title",
        "des":"Facebook post One description"
      },
      { 
        "title":"Facebook post Two title",
        "des":" Facebook post Two description"
      }
    ]
''';
  }
}

class LinkedInApi {
  String getPostList() {
    return '''
      [
        {
          "header":"LinkedIn post One header",
          "bio":"LinkedIn post One description"
        },
        {
          "header":"LinkedIn post Two header",
          "bio":"LinkedIn post Two description"
        }
      ]
''';
  }
}

abstract class CommonPostInterface {
  List<Post> getPosts();
}

class Post {
  final String title, desc;

  Post({required this.title, required this.desc});
}

//===> ADAPTER taking place here to match the imcompatable class with a compatable class <====//
class FacebookApiAdapter implements CommonPostInterface {
  final api = FacebookApi();
  @override
  List<Post> getPosts() {
    final data = jsonDecode(api.getPostList()) as List;
    return data.map((e) => Post(title: e['title'], desc: e['des'])).toList();
  }
}

class LinkedInApiAdapter implements CommonPostInterface {
  final api = LinkedInApi();
  @override
  List<Post> getPosts() {
    final data = jsonDecode(api.getPostList()) as List;
    return data.map((e) => Post(title: e['header'], desc: e['bio'])).toList();
  }
}

//this class is needed to collect the posts from two sources//

class FinalPosts {
  final apiOnePosts = FacebookApiAdapter();
  final apiTwoPosts = LinkedInApiAdapter();
  List<Post> getPosts() {
    return apiOnePosts.getPosts() + apiTwoPosts.getPosts();
  }
}
