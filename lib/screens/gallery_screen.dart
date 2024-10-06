import 'package:flutter/material.dart';
import 'package:travels/screens/widgets/bottom_menu.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  int _activeIndex = 0;

  // Modify the _images list to track the liked state for each image.
  final List<Map<String, dynamic>> _images = [
    {
      'imagePath': 'assets/images/suluhu.jpg',
      'story': 'Men of Allah in Mecca.',
      'posterName': 'John Doe',
      'posterImage': 'assets/images/maguy.jpg',
      'likes': 10,
      'liked': false, // Add liked state for this post
      'comments': [
        {
          'comment': 'Amazing......',
          'commenterName': 'Alice',
          'commenterImage': 'assets/images/maguy.jpg',
          'time': '2 hours ago',
          'likes': 5,
          'replies': []
        },
        {
          'comment': 'So beautiful!',
          'commenterName': 'Bob',
          'commenterImage': 'assets/images/maguy.jpg',
          'time': '3 hours ago',
          'likes': 3,
          'replies': []
        }
      ],
      'showComments': false,
      'time': '5 hours ago'
    },
    {
      'imagePath': 'assets/images/umrah.jpg',
      'story': 'We\'re going this month for Umrah.',
      'posterName': 'Jane Smith',
      'posterImage': 'assets/images/maguy.jpg',
      'likes': 20,
      'liked': false, // Add liked state for this post
      'comments': [
        {
          'comment': 'Wish I was there!',
          'commenterName': 'Charlie',
          'commenterImage': 'assets/images/maguy.jpg',
          'time': '1 hour ago',
          'likes': 2,
          'replies': []
        },
        {
          'comment': 'I\'m going.',
          'commenterName': 'Dave',
          'commenterImage': 'assets/images/maguy.jpg',
          'time': '4 hours ago',
          'likes': 1,
          'replies': []
        }
      ],
      'showComments': false,
      'time': '8 hours ago'
    },
  ];

  void _toggleLike(int index) {
    setState(() {
      _images[index]['likes'] += _images[index]['liked'] ? -1 : 1;
      _images[index]['liked'] = !_images[index]['liked']; // Toggle the liked state
    });
  }

  void _toggleComments(int index) {
    setState(() {
      _images[index]['showComments'] = !_images[index]['showComments'];
    });
  }

  void _toggleCommentLike(int imageIndex, int commentIndex) {
    setState(() {
      _images[imageIndex]['comments'][commentIndex]['likes']++;
    });
  }

  void _showCommentDialog(BuildContext context, int index) {
    final TextEditingController _commentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add a Comment'),
          content: TextField(
            controller: _commentController,
            decoration: const InputDecoration(hintText: 'Enter your comment'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _images[index]['comments'].add({
                    'comment': _commentController.text,
                    'commenterName': 'You',
                    'commenterImage': 'assets/images/maguy.jpg',
                    'time': 'Just now',
                    'likes': 0,
                    'replies': []
                  });
                });
                Navigator.of(context).pop();
              },
              child: const Text('Post'),
            ),
          ],
        );
      },
    );
  }

  void _showReplyDialog(BuildContext context, int imageIndex, int commentIndex) {
    final TextEditingController _replyController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add a Reply'),
          content: TextField(
            controller: _replyController,
            decoration: const InputDecoration(hintText: 'Enter your reply'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _images[imageIndex]['comments'][commentIndex]['replies'].add({
                    'reply': _replyController.text,
                    'replierName': 'You',
                    'replierImage': 'assets/images/maguy.jpg',
                    'time': 'Just now',
                    'likes': 0
                  });
                });
                Navigator.of(context).pop();
              },
              child: const Text('Post'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 141, 29, 29),
        title: const Text('Gallery', style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(0, 100, 180, 246), Color.fromARGB(0, 21, 101, 192)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(_images[index]['posterImage']),
                    ),
                    title: Text(_images[index]['posterName']),
                    subtitle: Text('${_images[index]['story']} - ${_images[index]['time']}'),
                  ),
                  GestureDetector(
                    onTap: () => _toggleComments(index),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        _images[index]['imagePath'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              child: IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                  color: _images[index]['liked']
                                      ? Color.fromARGB(255, 141, 29, 29)// Color when liked
                                      : Colors.grey, // Color when not liked
                                ),
                                onPressed: () => _toggleLike(index),
                              ),
                            ),
                            Text('${_images[index]['likes']} likes'),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.comment),
                          onPressed: () {
                            _showCommentDialog(context, index);
                          },
                        ),
                      ],
                    ),
                  ),
                  if (_images[index]['showComments'])
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _images[index]['comments']
                            .map<Widget>((comment) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(comment['commenterImage']),
                                        ),
                                        title: Text(comment['commenterName']),
                                        subtitle: Text(comment['comment']),
                                        trailing: Text(comment['time']),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.thumb_up),
                                            onPressed: () => _toggleCommentLike(index, _images[index]['comments'].indexOf(comment)),
                                          ),
                                          Text('${comment['likes']} likes'),
                                          IconButton(
                                            icon: const Icon(Icons.reply),
                                            onPressed: () {
                                              _showReplyDialog(context, index, _images[index]['comments'].indexOf(comment));
                                            },
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: comment['replies']
                                              .map<Widget>((reply) => Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                                                    child: ListTile(
                                                      leading: CircleAvatar(
                                                        backgroundImage: AssetImage(reply['replierImage']),
                                                      ),
                                                      title: Text(reply['replierName']),
                                                      subtitle: Text(reply['reply']),
                                                      trailing: Text(reply['time']),
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomMenu(
        activeIndex: _activeIndex,
        onTap: (index) {
          setState(() {
            _activeIndex = index;
          });
        },
      ),
    );
  }
}
