import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text == "1" && _passwordController.text == "1") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Username atau password salah!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Colors.blue[900],
              height: 120,
              alignment: Alignment.center,
              child: Text(
                "Koperasi Undiksha",
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Image.asset('assets/logo.png', height: 120),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: _login,
                    child: Text("Login", style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {}, child: Text("Daftar Mbanking")),
                      TextButton(onPressed: () {}, child: Text("Lupa Password?")),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text("copyright @2022 by Undiksha"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Koperasi Undiksha"),
        backgroundColor: Colors.blue[900],
        actions: [IconButton(icon: Icon(Icons.menu), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // Informasi Nasabah
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/user.jpg'),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nasabah", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("I Ketut Resika Arthana"),
                        Text("Total Saldo Anda: Rp. 1.200.000"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Grid Menu Utama
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 1,
                children: [
                  _menuItem(Icons.account_balance_wallet, "Cek Saldo"),
                  _menuItem(Icons.send, "Transfer"),
                  _menuItem(Icons.savings, "Deposito"),
                  _menuItem(Icons.payment, "Pembayaran"),
                  _menuItem(Icons.attach_money, "Pinjaman"),
                  _menuItem(Icons.receipt, "Mutasi"),
                ],
              ),
              SizedBox(height: 20),

              // Bantuan
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: Colors.blue),
                    SizedBox(width: 10),
                    Text("0878-1234-1024", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Footer Menu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _footerItem(Icons.settings, "Setting"),
                  _footerItem(Icons.qr_code, "QR Scan"),
                  _footerItem(Icons.person, "Profile"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  Widget _footerItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blue[900]),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
