import 'package:flutter/material.dart';

class AboutMePage extends StatefulWidget {
	const AboutMePage({
    super.key
  });

	@override
	State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
			@override
			Widget build(BuildContext context) {
				return Scaffold(
					body: SafeArea(
						child: SingleChildScrollView(
							padding: const EdgeInsets.all(24.0),
							child: Align(
								alignment: Alignment.topCenter,
								child: ConstrainedBox(
									constraints: const BoxConstraints(maxWidth: 600),
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.center,
										children: [
                      // Profilbild mit Dialog
                      Builder(
                        builder: (context) {
                          final double screenHeight = MediaQuery.of(context).size.height;
                          double avatarRadius;
                          if (screenHeight > 1000) {
                            avatarRadius = (screenHeight * 0.15).clamp(0, 120);
                          } else {
                            avatarRadius = (screenHeight * 0.13).clamp(0, 80);
                          }
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Dialog(
                                      backgroundColor: Colors.transparent,
                                      insetPadding: EdgeInsets.zero,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Center(
                                          child: ConstrainedBox(
                                            constraints: const BoxConstraints(maxWidth: 800, maxHeight: 800),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(24),
                                              child: Image.asset('assets/images/kaya.jpeg', fit: BoxFit.contain),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: CircleAvatar(
                              radius: avatarRadius,
                              backgroundImage: const AssetImage('assets/images/kaya.jpeg'),
                            ),
                          );
                        },
                      ),
                                const SizedBox(height: 24),
                                // Name
                                const Text(
                                  'Kaya Müller',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                // Beruf
                                const Text(
                                  'Fotograf',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                // Datum
                                const Text(
                                  'Stand: September 2025',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 24),
                                // Beschreibung
                                const Text(
                                  'Mein Name ist Kaya Müller, ein Fotograf im Alter von 32 Jahren, der die Welt durch die Linse entdeckt. Mit einem Hintergrund in der visuellen Kunst und jahrelanger Erfahrung in der Fotografie habe ich einen Blick für die Schönheit im Alltäglichen entwickelt. Meine Spezialität liegt in der Sport- und Naturfotografie, wo ich das Spiel von Licht und Schatten einfange, um emotionale und aussagekräftige Bilder zu schaffen.\n\nIch glaube daran, dass jeder Moment einzigartig ist und seine eigene Geschichte erzählt. In meinen Arbeiten strebe ich danach, diese Geschichten visuell zu interpretieren und sie durch kreative Kompositionen und Nuancen zum Leben zu erwecken. Meine fotografische Reise hat mich durch verschiedene Länder geführt, wo ich die Vielfalt der Kulturen und Landschaften festhalte, immer auf der Suche nach neuen Perspektiven und Herausforderungen.\n\nMein Anspruch ist es, mit meinen Bildern nicht nur zu dokumentieren, sondern auch zu inspirieren und zu berühren. Jeder Auftrag und jedes Projekt ist für mich eine Möglichkeit, meine Leidenschaft und mein Können zu zeigen und eine Verbindung zwischen dem Betrachter und dem Bild herzustellen.',
                                  style: TextStyle(fontSize: 16, height: 1.5),
                                  textAlign: TextAlign.start,
                                ),
                              ], // Ende children
                            ), // Ende Column
                          ), // Ende ConstrainedBox
                        ), // Ende Align
                      ), // Ende SingleChildScrollView
                    ), // Ende SafeArea
                  ); // Ende Scaffold
                }
            }
