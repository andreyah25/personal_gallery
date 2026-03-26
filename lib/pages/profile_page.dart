import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = "Andrea S. Concepcion";
  String age = "20";
  String bio =
      "Hi there! Welcome to my personal gallery. I love collecting memories and making the best out of them!!";

  void _editProfile() {
    final nameController = TextEditingController(text: name);
    final ageController = TextEditingController(text: age);
    final bioController = TextEditingController(text: bio);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Profile"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(labelText: "Age"),
                ),
                TextField(
                  controller: bioController,
                  decoration: const InputDecoration(labelText: "Bio"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  name = nameController.text;
                  age = ageController.text;
                  bio = bioController.text;
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFFFD1D1),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(230, 177, 133, 187),
        elevation: 0,
        toolbarHeight: 100,
        title: Row(
          children: [
            const SizedBox(width: 10),
            CircleAvatar(
              radius: 25,
              backgroundImage: const AssetImage('images/photo17.jpeg'),
            ),
            const SizedBox(width: 15),
            Text(
              "My Profile <33",
              style: GoogleFonts.fredoka(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: const Color.fromARGB(255, 22, 22, 22),
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            Column(
              children: [
                _sideButton("HOME", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomePage()));
                }),
                const SizedBox(height: 20),
                _sideButton("SETTINGS", () {}),
                const SizedBox(height: 20),
                _sideButton("THEME", () {}),
                const SizedBox(height: 20),
                _logoutButton("LOG OUT"),
              ],
            ),

            const SizedBox(width: 40),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 211, 154, 208).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 128, 87, 93),
                                  Color.fromARGB(255, 204, 144, 164)
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -30,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 70,
                                  backgroundImage:
                                      const AssetImage('images/photo17.jpeg'),
                                ),
                                const SizedBox(height: 8),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Change Photo 📷",
                                    style: GoogleFonts.poppins(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 70),

                     
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Age: $age",
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        bio,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),

                      const SizedBox(height: 20),

                      Wrap(
                        spacing: 15,
                        runSpacing: 10,
                        children: [
                          _chip("Photography 📸"),
                          _chip("Travel ✈️"),
                          _chip("Coffee ☕"),
                          _chip("Coding 💻"),
                          _chip("Reading 📚"),
                          _chip("Music 🎵"),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // --- FAVORITE QUOTE ---
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "“Collect moments, not things.”",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Edit Button
                      ElevatedButton(
                        onPressed: _editProfile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 224, 223, 224),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Edit Profile ✏️",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _infoCard("Memories", "120"),
                          _infoCard("Favorites", "35"),
                          _infoCard("Collections", "8"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _sideButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
            colors: [Color(0xFFE195AB), Color(0xFFB1667A)],
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _logoutButton(String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 140,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.redAccent,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Container(
      width: 130,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color.fromARGB(255, 114, 75, 107), Color.fromARGB(255, 213, 138, 216)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: const Color.fromARGB(255, 29, 28, 28),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color.fromARGB(255, 43, 42, 42),
            ),
          ),
        ],
      ),
    );
  }


  Widget _chip(String text) {
    return Chip(
      label: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 12),
      ),
      backgroundColor: const Color.fromARGB(255, 106, 226, 112),
    );
  }
}