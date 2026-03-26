import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'favorites_provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEADCD4),
     
      appBar: AppBar(
        backgroundColor:const Color(0xFFB7A089),
        elevation: 0, 
        title: Text('My Favorites 💖', style: GoogleFonts.fredoka(color: Colors.pink)),
      ),
      body: ListenableBuilder(
        listenable: favoritesProvider,
        builder: (context, child) {
          if (favoritesProvider.favorites.isEmpty) {
            return const Center(child: Text("No favorites yet!"));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
              childAspectRatio: 0.7,
            ),
            itemCount: favoritesProvider.favorites.length,
            itemBuilder: (context, index) {
              final item = favoritesProvider.favorites[index];
              return Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(item['image']!, fit: BoxFit.cover),
                    ),
                  ),
                  Text(item['desc']!, style: GoogleFonts.quicksand(fontSize: 12)),
                ],
              );
            },
          );
        },
      ),
    );
  }
}