import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Banking',
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
  final String nim = '2315091039'; // Ganti dengan NIM Anda

  void _login() {
    if (_usernameController.text == nim && _passwordController.text == nim) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Username atau password salah')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username (NIM)'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password (NIM)'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
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
        backgroundColor: Colors.blue,
        title: Text('Koperasi Undiksha'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/user.png'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nasabah', style: TextStyle(color: Colors.white, fontSize: 16)),
                    Text('Ni Komang Ayu Trisna Dewi', style: TextStyle(color: Colors.white, fontSize: 14)),
                    Text('Total Saldo Anda', style: TextStyle(color: Colors.white, fontSize: 12)),
                    Text('Rp. 1.200.000.000', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(16),
              crossAxisCount: 3,
              children: [
                menuItem(Icons.account_balance_wallet, 'Cek Saldo'),
                menuItem(Icons.send, 'Transfer'),
                menuItem(Icons.savings, 'Deposito'),
                menuItem(Icons.payment, 'Pembayaran'),
                menuItem(Icons.request_page, 'Pinjaman'),
                menuItem(Icons.receipt, 'Mutasi'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[200],
            child: Column(
              children: [
                Text('Butuh Bantuan?', style: TextStyle(fontSize: 16)),
                Text('0878-1234-1024', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Icon(Icons.phone, color: Colors.blue, size: 30),
              ],
            ),
          ),
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
              BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ],
      ),
    );
  }

  Widget menuItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        SizedBox(height: 5),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }
}