import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GAME',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.transparent,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<GameItem> trendingGames = [
    GameItem('CALL BREAK', 'assets/call-break.png', Colors.green),
    GameItem('RUMMY', 'assets/rummy.png', Colors.orange),
    GameItem('MAZE RUSH', 'assets/maze.png', Colors.blue),
  ];

  final List<GameItem> snakesLadders = [
    GameItem('SNAKES & LADDERS', 'assets/snake-and-ladder.png', Colors.red),
    GameItem('BLADES RUNNER', 'assets/blade-runner.png', Colors.purple),
    GameItem('TEMPLE RUN', 'assets/temple-run.png', Colors.orange),
  ];

  final List<GameItem> popularGames = [
    GameItem('POKER', 'assets/poker.png', Colors.blue),
    GameItem('LUDO', 'assets/ludo.png', Colors.green),
    GameItem('CARROM', 'assets/carrom.png', Colors.brown),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1565C0), // Light Blue
            Color(0xFF0D47A1), // Medium Blue
            Color(0xFF0A2472), // Deep Blue
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Decorative stars background
          Positioned.fill(
            child: RepaintBoundary(
              child: CustomPaint(
                painter: StarBackgroundPainter(
                  starColor: Color(0xFF64B5F6).withOpacity(0.05), // Light blue stars
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF1565C0), // Light Blue
                      Color(0xFF0D47A1), // Medium Blue
                      Color(0xFF0A2472), // Deep Blue
                    ],
                  ),
                ),
              ),
              title: SizedBox(
                height: 50,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                  width: 100, // Add explicit width
                  height: 50, // Match the SizedBox height
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback if logo doesn't load
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.gamepad, color: Colors.black, size: 20),
                        ),
                        Text(
                          'GAME',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              centerTitle: false,
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Color(0xFF4A3B5C),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        color: Colors.amber,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '₹28.71',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.person, color: Colors.black, size: 20),
                ),
                SizedBox(width: 16),
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // GAME Logo Section
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 24),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF00FFFF), // Cyan (neon)
                            Color(0xFF00BFFF), // Deep sky blue
                            Color(0xFF1E90FF), // Dodger blue
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF00BFFF).withOpacity(0.6),
                            blurRadius: 15,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Logo Image
                          Container(
                            height: 120,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/logo.png', // Replace with your logo file name
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  // Fallback if image doesn't load
                                  return Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.cyan,
                                          Colors.amber,
                                          Colors.pink,
                                          Colors.cyan,
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'FUL2WIN',
                                        style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          // Stars decoration
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              5,
                              (index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Trending Section
                  _buildSectionHeader('🔥 TRENDING', Icons.trending_up),
                  SizedBox(height: 12),
                  _buildGameGrid(trendingGames),

                  SizedBox(height: 24),

                  // Snakes & Ladders Section
                  _buildSectionHeader('🐍 MULTIPLAYER GAMES', Icons.gamepad),
                  SizedBox(height: 12),
                  _buildGameGrid(snakesLadders),

                  SizedBox(height: 24),

                  // Popular Section
                  _buildSectionHeader('⭐ POPULAR GAMES', Icons.star),
                  SizedBox(height: 12),
                  _buildGameGrid(popularGames),

                  SizedBox(height: 24),

                  // Promotion Banner
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF6200EA), // Deep Purple
                          Color(0xFF304FFE), // Indigo
                          Color(0xFF2962FF), // Blue
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF304FFE).withOpacity(0.5),
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'WIN ₹20,000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Join tournament now!',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {},
                          style:
                              ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                              ).copyWith(
                                backgroundColor: WidgetStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.amber, Colors.orange],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Text(
                              'PLAY NOW',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF1565C0), // Light Blue
                    Color(0xFF0D47A1), // Medium Blue
                    Color(0xFF0A2472), // Deep Blue
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF1565C0).withOpacity(0.3),
                    blurRadius: 15,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: Colors.amber, // Changed to amber (yellow)
                unselectedItemColor: Colors.white70,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                selectedFontSize: 10,
                unselectedFontSize: 10,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports_esports),
                    label: 'Games',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_events),
                    label: 'Tournaments',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people),
                    label: 'Community',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance_wallet),
                    label: 'Wallet',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Image.asset(
          title.contains('TRENDING')
              ? 'assets/orange-star.png'
              : title.contains('POPULAR')
              ? 'assets/blue-star.png'
              : 'assets/trophy.png',
          width: 24,
          height: 24,
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildGameGrid(List<GameItem> games) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.0, // Make cells square
      ),
      itemCount: games.length,
      itemBuilder: (context, index) {
        return _buildGameCard(games[index]);
      },
    );
  }

  Widget _buildGameCard(GameItem game) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${game.name} selected!'),
            duration: Duration(seconds: 1),
            backgroundColor: game.color,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF1A237E),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color(0xFF42A5F5).withOpacity(0.5),
            width: 1.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image.asset(
                game.imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image ${game.imagePath}: $error');
                  return Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _getGameIcon(game.name),
                          color: game.color,
                          size: 32,
                        ),
                        SizedBox(height: 8),
                        Text(
                          game.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Image.asset(
                  'assets/yellow-star.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _checkImageExists(String imagePath) async {
    try {
      await rootBundle.load(imagePath);
      return true;
    } catch (_) {
      return false;
    }
  }

  IconData _getGameIcon(String gameName) {
    switch (gameName.toLowerCase()) {
      case 'call break':
        return Icons.style;
      case 'rummy':
        return Icons.dashboard;
      case 'maze rush':
        return Icons.grain;
      case 'snakes & ladders':
        return Icons.stairs;
      case 'blades runner':
        return Icons.flash_on;
      case 'temple run':
        return Icons.directions_run;
      case 'poker':
        return Icons.casino;
      case 'ludo':
        return Icons.extension;
      case 'carrom':
        return Icons.adjust;
      default:
        return Icons.games;
    }
  }
}

class GameItem {
  final String name;
  final String imagePath;
  final Color color;

  GameItem(this.name, this.imagePath, this.color);
}

class StarBackgroundPainter extends CustomPainter {
  final Color starColor;

  StarBackgroundPainter({this.starColor = const Color(0x0DFFFFFF)});

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(42);
    final paint = Paint()
      ..color = starColor
      ..style = PaintingStyle.fill;

    // Draw more stars but with lower opacity
    for (int i = 0; i < 30; i++) {
      double x = random.nextDouble() * size.width;
      double y = random.nextDouble() * size.height;
      double starSize = random.nextDouble() * 15 + 5; // Smaller stars (5-20)

      canvas.drawCircle(Offset(x, y), starSize / 2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
