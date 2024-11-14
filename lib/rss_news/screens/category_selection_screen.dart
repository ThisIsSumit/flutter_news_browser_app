import 'package:flutter/material.dart';
import 'package:flutter_browser/rss_news/services/fetch_static_feeds.dart';
import 'package:hive/hive.dart';
import 'package:flutter_browser/rss_news/constants/constants.dart';
import 'package:flutter_browser/rss_news/screens/sources_selection_screen.dart';

class CategoriesSelectionScreen extends StatefulWidget {
  final bool fromWelcomeScreen;
  const CategoriesSelectionScreen({Key? key, required this.fromWelcomeScreen});

  @override
  State<CategoriesSelectionScreen> createState() =>
      _CategoriesSelectionScreenState();
}

class _CategoriesSelectionScreenState extends State<CategoriesSelectionScreen> {
  List<String> _categories = [];
  List<String> _filteredCategories = [];
  final List<String> _selectedCategories = ["Home Feeds"];
  late String selectedLanguage;
  final TextEditingController _searchController = TextEditingController();
  // final FetchFeeds _fetchFeeds = FetchFeeds();
  final FetchStaticFeeds _fetchStaticFeeds = FetchStaticFeeds();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    setState(() {
      _isLoading = true;
    });
    final box = Hive.box<List<String>>('preferences');
    final language = box.get('selectedLanguages');
    debugPrint('lan${language.toString()}');
    if (language != null) {
      // final feeds = await _fetchFeeds.feedsBySelectedLanguage(language);
      final feeds = await _fetchStaticFeeds.feedsBySelectedLanguage(language);

      final List<String> categories =
          feeds.map((feed) => feed.category).toSet().toList();

      setState(() {
        _categories = categories;
        _filteredCategories = categories;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
        throw const Text("language is not set");
      });
    }
  }

  void _filterCategories(String query) {
    setState(() {
      _filteredCategories = _categories
          .where((category) =>
              category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _saveSelectedCategories() async {
    if (_selectedCategories.length > 1) {
      final box = Hive.box<List<String>>('preferences');
      box.put('selectedCategories', _selectedCategories);
      // // debugPrint(_selectedCategories.toString());
      if (widget.fromWelcomeScreen) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Great! Please Swipe right to select sources.'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.lightBlue,
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SourcesSelectionScreen(),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one category.'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.lightBlue,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Select Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _searchController,
              onChanged: _filterCategories,
              decoration: InputDecoration(
                hintText: 'Search categories...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (_isLoading)
              const Loader()
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredCategories.length,
                  itemBuilder: (context, index) {
                    final category = _filteredCategories[index];
                    return _buildCategoryTile(category);
                  },
                ),
              ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveSelectedCategories,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTile(String category) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: CheckboxListTile(
        title: Text(
          category,
          style: const TextStyle(fontSize: 16),
        ),
        value: _selectedCategories.contains(category),
        onChanged: (value) {
          setState(() {
            if (value != null && value) {
              _selectedCategories.add(category);
            } else {
              _selectedCategories.remove(category);
            }
          });
        },
        activeColor: Colors.lightBlue,
        checkColor: Colors.white,
      ),
    );
  }
}
