import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

// Flag Switch Widget
class FlagSwitch extends StatefulWidget {
  final Function(bool)? onChanged;
  final bool value;

  const FlagSwitch({
    Key? key,
    this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  State<FlagSwitch> createState() => _FlagSwitchState();
}

class _FlagSwitchState extends State<FlagSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      height: 44,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,  // Animasi pergerakan
            child: Container(
              width: widget.value ? 58 : 58,  // Lebar berbeda untuk kiri dan kanan
              height: 44,  // Tinggi tetap
              decoration: BoxDecoration(
                color: widget.value ? Color.fromARGB(255, 212, 134, 8) : Color.fromARGB(255, 212, 134, 8),  // Warna berbeda untuk kiri dan kanan
                borderRadius: widget.value 
                    ? BorderRadius.only(  // Sudut berbeda saat di kanan
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(22),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(22),
                      )
                    : BorderRadius.only(  // Sudut berbeda saat di kiri
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(0),
                      ),
              ),
            ),
          ),
          Row(
            children: [
              // US Flag
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (widget.onChanged != null) widget.onChanged!(false);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 11,
                      right: 11,
                      top: 4,
                      bottom: 4,
                    ),
                    child: ClipOval(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/1920px-Flag_of_the_United_States.svg.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Indonesian Flag
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (widget.onChanged != null) widget.onChanged!(true);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 11,
                      right: 11,
                      top: 4,
                      bottom: 4,
                    ),
                    child: ClipOval(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Flag_of_Indonesia.svg/1920px-Flag_of_Indonesia.svg.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  bool _switchValue = false; // Untuk flag switch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 33, 37),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [

              // Flag Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlagSwitch(
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ],
              ),

              // Logo
              Image.asset(
                'images/UNDIKNAS.png',
                height: 270,
              ),
              
              // Email Field dengan ukuran kustom
              Container(
                width: 550,
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: _switchValue ? 'Email' : 'E-mail',
                    hintStyle: TextStyle(
                      height: 1.7,
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                    prefixIcon: const Icon(
                      Icons.email, 
                      color: Color.fromARGB(255, 231, 175, 80)),
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              
              // Password Field
              Container(
                width: 550,
                child: TextField(
                  obscureText: _obscureText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText:'Password',
                    hintStyle: TextStyle(
                      height: 1.7,
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                    prefixIcon: const Icon(
                      Icons.key, 
                      color: Color.fromARGB(255, 231, 175, 80)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              
              // Login Button
              Container(
                width: 550,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 25, 47, 89),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    _switchValue ? 'Masuk' : 'Login',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              
              // New Students Link
              Container(
                width: 550,
                height: 35,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 21, 21, 21),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    _switchValue ? 'Mahasiswa baru ? Klik disini' : 'New students ? Click here',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 4),

              Container(
                width: 550,
                height: 35,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 21, 21, 21),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    _switchValue ? 'Lupa Password' : 'Forgot the password',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}