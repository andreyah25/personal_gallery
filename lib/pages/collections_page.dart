import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'favorites_provider.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  final List<Map<String, String>> memoryData = const [
    {'image': 'images/photo1.jpeg', 'desc': 'Coffee date! ☕'},
    {'image': 'images/photo2.jpeg', 'desc': 'Sunset vibes.'},
    {'image': 'images/photo3.jpeg', 'desc': 'With my Frappe Buddy!.'},
    {'image': 'images/photo4.jpeg', 'desc': 'As a Jollibee Crew'},
    {'image': 'images/photo5.jpeg', 'desc': 'Coding session'},
    {'image': 'images/photo6.jpeg', 'desc': 'Tea while chika and making the Capstone!.'},
    {'image': 'images/photo7.jpeg', 'desc': 'After school jogging with the girls'},
    {'image': 'images/photo8.jpeg', 'desc': 'At Cha Tuk Chak, catching up with the OG Razons Crew'},
    {'image': 'images/photo9.jpeg', 'desc': 'IBITS WEEK CHAMPION!!WOHOO!!'},
    {'image': 'images/photo10.jpeg', 'desc': 'Catching up with my SHS FRIENDS!'},
    {'image': 'images/photo11.jpeg', 'desc': 'With my Social Climber Sistah! '},
    {'image': 'images/photo12.jpeg', 'desc': 'UWEEK Volleyball Semi-Finals game!'},
    {'image': 'images/photo13.jpeg', 'desc': 'with my PAR girls!'},
    {'image': 'images/photo14.jpeg', 'desc': 'Mirror Shot feeling the OOTD hehe'},
    {'image': 'images/photo15.jpeg', 'desc': 'Dabest Tiramisu!'},
    {'image': 'images/photo16.jpeg', 'desc': 'New years tradition photo'},
    {'image': 'images/photo17.jpeg', 'desc': 'Just a crazy photo'},
    {'image': 'images/photo18.jpeg', 'desc': 'First samgy with the girlies'},
    {'image': 'images/photo19.jpeg', 'desc': 'Another crazy one!'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEADCD4),
     
      appBar: AppBar(
        backgroundColor:const Color(0xFFB7A089),
        elevation: 0, 
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'Me, Myself, and My Memories',
            style: GoogleFonts.fredoka(
              fontSize: 45,
              fontWeight: FontWeight.w900,
              color: const Color.fromARGB(255, 39, 38, 38),
              
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 20),
            child: Column(
              children: [
                const HoverJellyButton(label: 'COLLECTIONS', isActive: true),
                const SizedBox(height: 15),
                HoverJellyButton(
                  label: 'BACK',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          
          Expanded(
            child: ListenableBuilder(
              listenable: favoritesProvider,
              builder: (context, child) {
                return GridView.builder(
                  padding: const EdgeInsets.only(right: 40, bottom: 60, top: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, 
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 30,
                    childAspectRatio: 1, 
                  ),
                  itemCount: memoryData.length,
                  itemBuilder: (context, index) {
                    final item = memoryData[index];
                    final isFav = favoritesProvider.isFavorite(item['image']!);

                    return Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    )
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    item['image']!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 5,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white.withOpacity(0.7),
                                  radius: 16,
                                  child: IconButton(
                                    iconSize: 16,
                                    icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                                    color: Colors.pink,
                                    onPressed: () => favoritesProvider.toggleFavorite(item),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item['desc']!,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.quicksand(
                            fontSize: 11, // Smaller font for the smaller grid
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 120, 50, 110),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// --- REUSED HOVER JELLY BUTTON (Ensure this is in your project) ---
class HoverJellyButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final bool isActive;

  const HoverJellyButton({super.key, required this.label, this.onTap, this.isActive = false});

  @override
  State<HoverJellyButton> createState() => _HoverJellyButtonState();
}

class _HoverJellyButtonState extends State<HoverJellyButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double currentScale = widget.isActive ? 1.1 : (_isHovered ? 1.05 : 1.0);
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: currentScale,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 160,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                colors: (widget.isActive || _isHovered)
                    ? [const Color(0xFFFFB6C1), const Color(0xFFD87093)]
                    : [const Color(0xFFE195AB), const Color(0xFFB1667A)],
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              widget.label,
              style: GoogleFonts.quicksand(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}