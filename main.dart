
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Recipe {
  final String id;
  final String name;
  final String imageUrl;
  final String description;
  final List<String> ingredients;
  final List<String> steps;

  Recipe({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.ingredients,
    required this.steps,
  });
}

// ---------------------------
// App State (Provider) - ingredient based filtering 
// ---------------------------
class AppState extends ChangeNotifier {
  final List<Recipe> _allRecipes = [
    Recipe(
      id: 'pizza',
      name: 'Pizza',
      imageUrl:
          'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.1.0&auto=format&fit=crop&q=60&w=600',
      description: 'Classic Italian pizza with tomato sauce, mozzarella and basil.',
      ingredients: [
        'Pizza dough',
        'Tomato sauce',
        'Mozzarella cheese',
        'Fresh basil',
        'Olive oil',
        'Salt'
      ],
      steps: [
        'Preheat oven to 220°C (425°F).',
        'Roll out the pizza dough on a floured surface.',
        'Spread a thin layer of tomato sauce evenly over the dough.',
        'Add shredded mozzarella and a drizzle of olive oil.',
        'Bake for 10–15 minutes until crust is golden and cheese is bubbling.',
        'Top with fresh basil and serve hot.',
      ],
    ),
    Recipe(
      id: 'veg_salad',
      name: 'Veg Salad',
      imageUrl:
          'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.1.0&auto=format&fit=crop&q=80&w=1170',
      description: 'Fresh mixed vegetable salad with a light lemon-olive dressing.',
      ingredients: [
        'Lettuce',
        'Cucumber',
        'Tomatoes',
        'Carrots',
        'Olive oil',
        'Lemon juice',
        'Salt',
        'Pepper'
      ],
      steps: [
        'Wash and chop all vegetables to bite-size pieces.',
        'Place vegetables in a large bowl.',
        'Whisk olive oil, lemon juice, salt and pepper to make dressing.',
        'Pour dressing over salad and toss well.',
        'Serve chilled as a healthy side or light meal.',
      ],
    ),
    Recipe(
      id: 'cake',
      name: 'Cake',
      imageUrl:
          'https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.1.0&auto=format&fit=crop&q=80&w=765',
      description: 'Moist chocolate cake perfect for birthdays and celebrations.',
      ingredients: [
        'Flour',
        'Sugar',
        'Cocoa powder',
        'Butter',
        'Eggs',
        'Milk',
        'Baking powder',
      ],
      steps: [
        'Preheat oven to 180°C (350°F). Grease a cake pan.',
        'Mix dry ingredients (flour, sugar, cocoa, baking powder).',
        'Whisk wet ingredients (eggs, milk, melted butter) and combine with dry mix.',
        'Pour batter into pan and bake for ~30 minutes or until a skewer comes out clean.',
        'Cool, frost as desired and serve.',
      ],
    ),
    Recipe(
      id: 'icecream',
      name: 'Ice Cream',
      imageUrl:
          'https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?ixlib=rb-4.1.0&auto=format&fit=crop&q=60&w=600',
      description: 'Creamy homemade vanilla ice cream — simple and delicious.',
      ingredients: ['Milk', 'Cream', 'Sugar', 'Vanilla extract'],
      steps: [
        'Combine milk, cream, sugar and vanilla in a bowl.',
        'Stir until sugar dissolves.',
        'Chill the mixture, then churn in an ice cream maker or freeze and stir periodically.',
        'Freeze until firm and scoop to serve.',
      ],
    ),
    Recipe(
      id: 'burger',
      name: 'Burger',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1675252369719-dd52bc69c3df?ixlib=rb-4.1.0&auto=format&fit=crop&q=80&w=1974',
      description: 'Juicy burger with fresh toppings and a soft bun.',
      ingredients: [
        'Burger buns',
        'Lettuce',
        'Tomato',
        'Cheese',
        'Onion',
        'Patty',
        'Ketchup',
      ],
      steps: [
        'Season patties with salt and pepper.',
        'Grill or pan-fry patties 3–4 minutes per side until cooked to preference.',
        'Toast buns lightly on the grill or pan.',
        'Assemble: bun, patty, cheese, lettuce, tomato, onion, sauce.',
        'Serve immediately with fries or salad.',
      ],
    ),
    Recipe(
      id: 'pasta',
      name: 'Pasta',
      imageUrl:
          'https://images.unsplash.com/photo-1485962398705-ef6a13c41e8f?ixlib=rb-4.1.0&auto=format&fit=crop&q=80&w=687',
      description: 'Comforting pasta dish with a rich tomato and herb sauce.',
      ingredients: [
        'Pasta',
        'Tomato sauce',
        'Garlic',
        'Olive oil',
        'Parmesan cheese',
        'Basil'
      ],
      steps: [
        'Boil pasta in salted water until al dente, then drain.',
        'Sauté garlic in olive oil, add tomato sauce and simmer.',
        'Toss pasta into sauce, add herbs and grated cheese.',
        'Serve hot with extra cheese on top.',
      ],
    ),

    // Sandwich 
    Recipe(
      id: 'sandwich',
      name: 'Sandwich',
      imageUrl:
          'https://images.unsplash.com/photo-1642442928984-b18c2c86b9c2?ixlib=rb-4.1.0&auto=format&fit=crop&q=80&w=687',
      description: 'Crispy toasted sandwich loaded with veggies and melted cheese.',
      ingredients: [
        'Bread slices',
        'Butter',
        'Cheese',
        'Tomato',
        'Cucumber',
        'Onion',
        'Lettuce',
        'Salt',
        'Pepper'
      ],
      steps: [
        'Butter the bread slices on one side.',
        'Place cheese and sliced tomato/cucumber between the bread (butter side out).',
        'Grill on a pan until golden and cheese is melted.',
        'Slice and serve hot with ketchup or chutney.',
      ],
    ),

    // Oreo Milkshake 
    Recipe(
      id: 'oreo_milkshake',
      name: 'Oreo Milkshake',
      imageUrl:
          'https://images.unsplash.com/photo-1563805042-7684c019e1cb?ixlib=rb-4.1.0&auto=format&fit=crop&q=80&w=627',
      description: 'Rich and creamy Oreo milkshake topped with crushed cookies.',
      ingredients: ['Oreo biscuits', 'Milk', 'Ice cream', 'Sugar', 'Whipped cream'],
      steps: [
        'Blend Oreo biscuits, milk, ice cream and sugar until smooth.',
        'Pour into a chilled glass.',
        'Top with whipped cream and crushed Oreos.',
        'Serve immediately.',
      ],
    ),
  ];

  // Favorites stored locally in-memory
  final List<String> _favorites = [];

  // UI & Profile state
  bool _isDarkMode = false;
  String _userName = 'Guest Chef';
  String _unitSystem = 'metric'; // metric/imperial
  String _defaultDiet = 'none';

  // Filters: selected ingredient tokens (normalized)
  final Set<String> _selectedIngredients = <String>{};

  // getters
  List<Recipe> get allRecipes => List.unmodifiable(_allRecipes);
  List<Recipe> get favoriteRecipes =>
      _favorites.map((id) => _allRecipes.firstWhere((r) => r.id == id)).toList();
  bool get isDarkMode => _isDarkMode;
  String get userName => _userName;
  String get unitSystem => _unitSystem;
  String get defaultDiet => _defaultDiet;
  Set<String> get selectedIngredients => _selectedIngredients;

  // actions
  void toggleFavorite(String recipeId) {
    if (_favorites.contains(recipeId)) {
      _favorites.remove(recipeId);
    } else {
      _favorites.add(recipeId);
    }
    notifyListeners();
  }

  bool isFavorite(String id) => _favorites.contains(id);

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setUnitSystem(String u) {
    _unitSystem = u;
    notifyListeners();
  }

  void setDefaultDiet(String d) {
    _defaultDiet = d;
    notifyListeners();
  }

  void toggleIngredientToken(String token) {
    if (_selectedIngredients.contains(token)) {
      _selectedIngredients.remove(token);
    } else {
      _selectedIngredients.add(token);
    }
    notifyListeners();
  }

  void clearSelections() {
    _selectedIngredients.clear();
    notifyListeners();
  }

  // compute normalized ingredient tokens (unique & sorted)
  List<String> get allIngredientTokens {
    final Set<String> s = <String>{};
    for (final r in _allRecipes) {
      for (final ing in r.ingredients) {
        final token = _normalizeIngredient(ing);
        if (token.isNotEmpty) s.add(token);
      }
    }
    final list = s.toList()..sort();
    return list;
  }

  // filtering logic: OR-match — show recipes that contain ANY of the selected tokens
  List<Recipe> get filteredRecipes {
    if (_selectedIngredients.isEmpty) return allRecipes;
    return _allRecipes.where((r) {
      final tokens = r.ingredients.map(_normalizeIngredient).where((t) => t.isNotEmpty).toList();
      // if any selected token is present in recipe tokens -> include
      for (final sel in _selectedIngredients) {
        if (tokens.any((t) => t.contains(sel))) return true;
      }
      return false;
    }).toList();
  }

  // simple normalization: lowercase, remove numbers/punctuation, remove common stop tokens, keep meaningful words
  static String _normalizeIngredient(String ing) {
    final String cleaned = ing.toLowerCase().replaceAll(RegExp(r'[0-9]'), '').replaceAll(RegExp(r'[\(\),/]'), ' ').replaceAll(RegExp(r'[^a-z\s]'), ' ').trim();
    final parts = cleaned.split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    final stop = <String>{'slice','slices','cup','cups','tbsp','tsp','to','taste','of','and','or','fresh','small','large'};
    final meaningful = parts.where((p) => !stop.contains(p)).toList();
    if (meaningful.isEmpty) return parts.isNotEmpty ? parts.first : '';
    // return joined meaningful words as a single token (e.g., "mozzarella cheese" -> "mozzarella cheese")
    return meaningful.join(' ');
  }
}

// ---------------------------
// App Entry & Root
// ---------------------------
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const RecipeRealmRoot(),
    ),
  );
}

class RecipeRealmRoot extends StatelessWidget {
  const RecipeRealmRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, app, _) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RecipeRealm',
        theme: app.isDarkMode
            ? ThemeData.dark().copyWith(
                useMaterial3: true,
              )
            : ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: const Color(0xFFFFF8F1),
                appBarTheme: const AppBarTheme(backgroundColor: Colors.deepOrange),
                visualDensity: VisualDensity.adaptivePlatformDensity,
                useMaterial3: true,
              ),
        home: const SplashScreen(),
      );
    });
  }
}

// ---------------------------
// Splash -> GetStarted -> Home
// ---------------------------
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1400), () {
      if (context.mounted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const GetStartedScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Hero(tag: 'app_logo', child: Icon(Icons.local_dining, size: 92, color: Colors.deepOrange.shade700)),
          const SizedBox(height: 12),
          const Text('RecipeRealm', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Delicious recipes, beautifully presented', style: TextStyle(color: Colors.black54)),
        ]),
      ),
    );
  }
}

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFFFFF3E0), Color(0xFFFFE0B2)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(children: [
            const SizedBox(height: 8),
            Hero(tag: 'app_logo', child: Icon(Icons.restaurant_menu, size: 80, color: Colors.deepOrange.shade600)),
            const SizedBox(height: 18),
            const Text('Welcome to RecipeRealm', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Explore recipes, save favorites and find dishes by ingredient!', textAlign: TextAlign.center),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text('Get Started', style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
            ),
            const SizedBox(height: 18),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
              },
              child: const Text('Skip'),
            ),
          ]),
        ),
      ),
    );
  }
}

// ---------------------------
// Home Screen (ingredient chips + grid)
// ---------------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildIngredientChips(BuildContext context) {
    final app = Provider.of<AppState>(context);
    final items = app.allIngredientTokens;
    return SizedBox(
      height: 46,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final token = items[index];
          final selected = app.selectedIngredients.contains(token);
          return FilterChip(
            selectedColor: Colors.deepOrange.shade300,
            backgroundColor: Colors.grey.shade200,
            label: Text(token.capitalize()),
            selected: selected,
            onSelected: (_) => app.toggleIngredientToken(token),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    final recipes = app.filteredRecipes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('RecipeRealm'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ProfileScreen()));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          // Header card with app name and short summary
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.orange.shade200, Colors.orange.shade50]),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)],
            ),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  recipes.isNotEmpty ? recipes[0].imageUrl : app.allRecipes.first.imageUrl,
                  width: 84,
                  height: 84,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(color: Colors.grey[200], width: 84, height: 84, child: const Icon(Icons.broken_image)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('RecipeRealm', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text('Hi, ${app.userName.split(' ').first}! Tap ingredient chips to filter recipes.', style: const TextStyle(color: Colors.black87)),
              ])),
              OutlinedButton.icon(
                icon: const Icon(Icons.clear),
                label: const Text('Clear'),
                onPressed: () => app.clearSelections(),
              )
            ]),
          ),

          // Ingredient chips (horizontal)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _buildIngredientChips(context),
          ),

          // Grid of recipes
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: recipes.isEmpty
                  ? Center(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        const Icon(Icons.search_off, size: 52, color: Colors.grey),
                        const SizedBox(height: 8),
                        const Text('No recipes found for selected ingredients.'),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => app.clearSelections(),
                          child: const Text('Clear filters'),
                        )
                      ]),
                    )
                  : GridView.builder(
                      itemCount: recipes.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.78,
                      ),
                      itemBuilder: (context, index) {
                        final r = recipes[index];
                        return _RecipeCard(recipe: r);
                      },
                    ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Favorites'),
        icon: const Icon(Icons.favorite),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FavoritesScreen())),
      ),
    );
  }
}

// Recipe card widget (grid)
class _RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const _RecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    final bool isFav = app.isFavorite(recipe.id);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => RecipeDetail(recipeId: recipe.id)));
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 4,
        child: Stack(children: [
          // image
          Positioned.fill(
            child: Hero(
              tag: 'hero_${recipe.id}',
              child: Image.network(recipe.imageUrl, fit: BoxFit.cover, loadingBuilder: (c, child, progress) {
                if (progress == null) return child;
                return Container(color: Colors.grey.shade200, child: const Center(child: CircularProgressIndicator()));
              }, errorBuilder: (c, e, s) => Container(color: Colors.grey[300], child: const Icon(Icons.broken_image, size: 48))),
            ),
          ),

          // gradient overlay
          Positioned.fill(child: Container(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black.withOpacity(0.6)])))),

          // bottom text & favorite
          Positioned(bottom: 10, left: 10, right: 10, child: Row(children: [
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(recipe.name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(recipe.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ])),
            Material(
              color: Colors.black26,
              shape: const CircleBorder(),
              child: IconButton(
                icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: Colors.redAccent),
                onPressed: () {
                  app.toggleFavorite(recipe.id);
                },
              ),
            ),
          ])),
        ]),
      ),
    );
  }
}

// ---------------------------
// Recipe Detail Screen
// ---------------------------
class RecipeDetail extends StatelessWidget {
  final String recipeId;
  const RecipeDetail({Key? key, required this.recipeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context, listen: false);
    final recipe = app.allRecipes.firstWhere((r) => r.id == recipeId);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        actions: [
          Consumer<AppState>(builder: (context, a, _) {
            final fav = a.isFavorite(recipe.id);
            return IconButton(
              icon: Icon(fav ? Icons.favorite : Icons.favorite_border, color: Colors.redAccent),
              onPressed: () => a.toggleFavorite(recipe.id),
            );
          }),
        ],
      ),
      body: ListView(
        children: [
          Hero(tag: 'hero_${recipe.id}', child: Image.network(recipe.imageUrl, height: 260, width: double.infinity, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(color: Colors.grey[300], height: 260, child: const Icon(Icons.broken_image, size: 72)))),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(recipe.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(recipe.description, style: const TextStyle(color: Colors.black87)),
              const SizedBox(height: 16),
              const Text('Ingredients', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              ...recipe.ingredients.map((ing) => Padding(padding: const EdgeInsets.only(bottom: 6), child: Text('• $ing'))),
              const SizedBox(height: 14),
              const Text('Procedure', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              ...recipe.steps.asMap().entries.map((e) => Padding(padding: const EdgeInsets.only(bottom: 8), child: Text('${e.key + 1}. ${e.value}'))),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.restaurant_menu),
                label: const Text('Start Cooking'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Happy cooking! Follow the steps above.')));
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

// ---------------------------
// Favorites Screen
// ---------------------------
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    final favs = app.favoriteRecipes;

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favs.isEmpty
          ? const Center(child: Text('No favorites yet — tap the heart on any recipe to add.'))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: favs.length,
              itemBuilder: (c, i) {
                final r = favs[i];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: Image.network(r.imageUrl, width: 64, height: 64, fit: BoxFit.cover, errorBuilder: (c, e, s) => Container(width: 64, height: 64, color: Colors.grey[300])),
                    title: Text(r.name),
                    subtitle: Text(r.description),
                    trailing: IconButton(icon: const Icon(Icons.delete_outline), onPressed: () => app.toggleFavorite(r.id)),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RecipeDetail(recipeId: r.id))),
                  ),
                );
              },
            ),
    );
  }
}

// ---------------------------
// Profile Screen
// ---------------------------
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  late String _unit;
  late String _diet;

  @override
  void initState() {
    super.initState();
    final app = Provider.of<AppState>(context, listen: false);
    _nameController = TextEditingController(text: app.userName);
    _unit = app.unitSystem;
    _diet = app.defaultDiet;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Widget _buildProfileHeader(AppState app) {
    return Row(children: [
      CircleAvatar(radius: 40, backgroundImage: NetworkImage(app.allRecipes.first.imageUrl), backgroundColor: Colors.grey[200]),
      const SizedBox(width: 12),
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(app.userName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Food lover • ${app.favoriteRecipes.length} favorites'),
        ]),
      ),
      IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Edit name'),
              content: TextField(controller: _nameController),
              actions: [
                TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<AppState>(context, listen: false).setUserName(_nameController.text.trim().isEmpty ? 'Guest Chef' : _nameController.text.trim());
                    Navigator.of(context).pop();
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildProfileHeader(app),
          const SizedBox(height: 20),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Preferences', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text('Dark Theme'),
                  Switch(value: app.isDarkMode, onChanged: (_) => app.toggleDarkMode()),
                ]),
                const SizedBox(height: 8),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text('Unit System'),
                  DropdownButton<String>(
                    value: _unit,
                    items: const [
                      DropdownMenuItem(value: 'metric', child: Text('Metric')),
                      DropdownMenuItem(value: 'imperial', child: Text('Imperial'))
                    ],
                    onChanged: (v) {
                      if (v == null) return;
                      setState(() => _unit = v);
                      app.setUnitSystem(v);
                    },
                  )
                ]),
                const SizedBox(height: 8),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text('Default Diet'),
                  DropdownButton<String>(
                    value: _diet,
                    items: <String>['none', 'vegetarian', 'vegan']
                        .map((d) => DropdownMenuItem(value: d, child: Text(d.capitalize())))
                        .toList(),
                    onChanged: (v) {
                      if (v == null) return;
                      setState(() => _diet = v);
                      app.setDefaultDiet(v);
                    },
                  )
                ]),
              ]),
            ),
          ),

          const SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('App Utilities', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                ListTile(
                  leading: const Icon(Icons.delete_forever),
                  title: const Text('Clear Image Cache'),
                  onTap: () {
                    PaintingBinding.instance.imageCache.clear();
                    PaintingBinding.instance.imageCache.clearLiveImages();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Image cache cleared.')));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('Manage Favorites'),
                  subtitle: Text('${app.favoriteRecipes.length} saved'),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FavoritesScreen())),
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text('About'),
                  onTap: () => showAboutDialog(context: context, applicationName: 'RecipeRealm', applicationVersion: '1.0', children: [
                    const Text('This sample app is frontend-only and uses Provider for state management.')
                  ]),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}

// ---------------------------
// Utils & Extension
// ---------------------------
extension CapExt on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
