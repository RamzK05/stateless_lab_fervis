
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Main colors for the campus directory design.
const Color teal = Color(0xFF117F87);
const Color darkTeal = Color(0xFF095B63);
const Color backgroundColor = Color(0xFFF3F6F8);
const Color headingColor = Color(0xFF20343B);
const Color secondaryText = Color(0xFF687981);
const Color borderColor = Color(0xFFE4EAED);

// Stores the details of one student.
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

// Five sample students required by the activity.
const List<Student> students = [
  Student(
    name: 'Ram Fervis',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'ram.fervis@school.edu',
  ),
  Student(
    name: 'Jezrel Carbonilla',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'jezrel.carbonilla@school.edu',
  ),
  Student(
    name: 'Jana Torino',
    course: 'BS Information Systems',
    yearLevel: 4,
    email: 'jana.torino@school.edu',
  ),
  Student(
    name: 'John Tengson',
    course: 'BS Computer Engineering',
    yearLevel: 1,
    email: 'john.tengson@school.edu',
  ),
  Student(
    name: 'Eunice Galon',
    course: 'BS Software Engineering',
    yearLevel: 3,
    email: 'eunice.galon@school.edu',
  ),
];

// Stateless because the section heading is provided by its constructor.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            // Customization 1: Teal heading creates visual hierarchy.
            color: teal,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        const Divider(
          color: Color(0xFFD5E5E7),
          thickness: 1.5,
          height: 1,
        ),
      ],
    );
  }
}

// Stateless because it only displays the supplied icon and text.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: teal,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: secondaryText,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// Stateless because it displays the Student passed by its parent.
class StudentCard extends StatelessWidget {
  final Student student;
  final double cardWidth;

  const StudentCard({
    super.key,
    required this.student,
    required this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardWidth,
      child: Card(
        // Customization 2: Rounded corners and subtle shadows improve appearance.
        elevation: 2,
        shadowColor: const Color(0x180D3038),
        color: Colors.white,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: borderColor,
            width: 0.7,
          ),
        ),
        child: Padding(
          // Customization 3: Interior padding keeps card content readable.
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: teal,
                    child: Text(
                      student.name.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          student.name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: headingColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Year ${student.yearLevel} Student',
                          style: const TextStyle(
                            fontSize: 12,
                            color: secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Divider(
                color: borderColor,
                height: 1,
              ),
              const SizedBox(height: 15),
              const Text(
                'COURSE',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: secondaryText,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                student.course,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: headingColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 18),
              InfoRow(
                icon: Icons.school,
                text: 'Year ${student.yearLevel}',
              ),
              const SizedBox(height: 12),
              InfoRow(
                icon: Icons.email,
                text: student.email,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Stateless because it displays the fixed directory data.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        // Customization 4: Deep teal header with a centered title and icon.
        backgroundColor: darkTeal,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.school, size: 25),
            SizedBox(width: 11),
            Text(
              'Campus Directory',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Calculate widths from the actual content area.
              final double horizontalPadding =
                  constraints.maxWidth < 600 ? 16 : 32;

              final double availableWidth =
                  constraints.maxWidth - (horizontalPadding * 2);

              final int columns = constraints.maxWidth >= 1000
                  ? 3
                  : constraints.maxWidth >= 600
                      ? 2
                      : 1;

              const double spacing = 20;

              final double cardWidth =
                  (availableWidth - spacing * (columns - 1)) / columns;

              return ListView(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  32,
                  horizontalPadding,
                  32,
                ),
                children: [
                  // Only the All Students heading remains.
                  // The extra directory title and descriptions are removed.
                  const SectionHeader(title: 'All Students'),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: [
                      for (final student in students)
                        StudentCard(
                          student: student,
                          cardWidth: cardWidth,
                        ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// Stateless because it configures the app theme and initial screen.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Directory',
      theme: ThemeData(
        // Customization 5: Material 3 creates a coordinated teal color scheme.
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: teal,
          primary: teal,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: darkTeal,
          foregroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: darkTeal,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: backgroundColor,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      home: const DirectoryScreen(),
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Sets the status and navigation bar colors on supported devices.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: darkTeal,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const DirectoryApp());
}
