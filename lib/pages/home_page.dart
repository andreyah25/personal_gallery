import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_page.dart';
import 'collections_page.dart';
import 'favorites_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8C3A5) ,
     
      appBar: AppBar(
        backgroundColor:const Color(0xFFB7A089),
        elevation: 0, 
        toolbarHeight: 100, 
        title: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'Me, Myself, and My Memories', 
            style: GoogleFonts.fredoka(
              fontSize: 38, 
              fontWeight: FontWeight.w900,
              color: const Color(0xFF3E3A39),
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
                Column(
                 children: [
                  HoverJellyButton(label: 'HOME', onTap: () {}),
                  const SizedBox(height: 50), 
                   HoverJellyButton(
                     label: 'COLLECTIONS', 
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CollectionsPage())),
                      ),
                    const SizedBox(height: 50),
                    HoverJellyButton(
                      label: 'FAVORITES', 
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FavoritesPage())),
                    ),
                    const SizedBox(height: 50),
                    HoverJellyButton(
                      label: 'PROFILE', 
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage())),
                    ),
                  ],
                ),
                const SizedBox(width: 40),
                // Image Grid
                Expanded(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: List.generate(
                      8,
                      (index) => _buildGalleryImage('images/photo${index + 1}.jpeg'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryImage(String assetPath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.white60,
            child: const Icon(Icons.image, color: Color.fromARGB(255, 10, 10, 10), size: 20),
          ),
        ),
      ),
    );
  }
}

class HoverJellyButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const HoverJellyButton({super.key, required this.label, required this.onTap});

  @override
  State<HoverJellyButton> createState() => _HoverJellyButtonState();
}

class _HoverJellyButtonState extends State<HoverJellyButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : (_isHovered ? 1.05 : 1.0),
          duration: const Duration(milliseconds: 100),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 160,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: _isHovered
                    ? [const Color(0xFFFFB6C1), const Color(0xFFD87093)]
                    : [const Color(0xFFE195AB), const Color(0xFFB1667A)],
              ),
              boxShadow: [
                BoxShadow(
                  color: _isHovered
                      ? const Color.fromARGB(255, 24, 23, 23).withOpacity(0.3)
                      : Colors.black.withOpacity(0.15),
                  offset: _isHovered ? const Offset(0, 6) : const Offset(0, 4),
                  blurRadius: _isHovered ? 12 : 4,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              widget.label,
              style: GoogleFonts.quicksand( 
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}