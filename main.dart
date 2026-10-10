import 'package:flutter/material.dart';

void main() => runApp(const ForexApp());

class ForexApp extends StatelessWidget {
  const ForexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forex Afaan Oromoo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B8F70),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0B1220),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class Lesson {
  final String titleOm, titleEn, bodyOm, example, question;
  final List<String> options;
  final int correct;
  const Lesson({
    required this.titleOm, required this.titleEn, required this.bodyOm,
    required this.example, required this.question, required this.options,
    required this.correct,
  });
}

const lessons = <Lesson>[
  Lesson(
    titleOm: 'Forex jechuun maali?',
    titleEn: 'What is Forex?',
    bodyOm: 'Forex jechuun gabaa keessatti maallaqa biyya tokkoo maallaqa biyya biraatiin jijjiiruu ykn daldaluudha.',
    example: 'EUR/USD = Euro tokko Doolaara Ameerikaa meeqa akka ta’e agarsiisa.',
    question: 'EUR/USD keessatti EUR maal jedhama?',
    options: ['Base currency (maallaqa jalqabaa)', 'Quote currency (maallaqa lammaffaa)', 'Spread'],
    correct: 0,
  ),
  Lesson(
    titleOm: 'Pip fi Spread',
    titleEn: 'Pips and Spread',
    bodyOm: 'Pip jijjiirama gatii safaruuf fayyada. Spread garaagarummaa gatii Bid fi Ask ti.',
    example: 'EUR/USD 1.1000 irraa gara 1.1005 yoo deeme, pip 5 ol ka’eera (pairs idilee keessatti).',
    question: 'Spread jechuun maal?',
    options: ['Bu’aa daldalaa', 'Garaagarummaa Bid fi Ask', 'Maallaqa account keessa jiru'],
    correct: 1,
  ),
  Lesson(
    titleOm: 'Candlestick fi Trend',
    titleEn: 'Candlesticks and Trends',
    bodyOm: 'Candlestick gatii yeroo murtaa’e keessatti banuu, olka’uu, gadi bu’uu fi cufamuu agarsiisa. Uptrend keessatti gatiin yeroo baay’ee ol ka’aa deema.',
    example: 'Higher highs fi higher lows yeroo walitti fufan uptrend ta’uu danda’a.',
    question: 'Uptrend maal agarsiisa?',
    options: ['Gatiin yeroo baay’ee ol ka’aa jira', 'Gatiin yeroo hunda dhaabbateera', 'Gabaan cufameera'],
    correct: 0,
  ),
  Lesson(
    titleOm: 'Support fi Resistance',
    titleEn: 'Support and Resistance',
    bodyOm: 'Support naannoo gatiin itti deebi’ee ol ka’uu danda’uudha. Resistance naannoo gatiin itti gufachuu ykn gadi deebi’uu danda’uudha.',
    example: 'Support fi resistance wabii miti; gatiin naannoo kana cabsuu danda’a.',
    question: 'Resistance jechuun maal?',
    options: ['Naannoo gatiin itti ol ka’uu danda’u', 'Naannoo gatiin itti gufachuu ykn gadi deebi’uu danda’u', 'Spread'],
    correct: 1,
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tab = 0;
  int completed = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      _home(),
      const LessonsScreen(),
      const RiskScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forex Afaan Oromoo'),
        subtitle: const Text('Learn • Practice • Manage Risk'),
      ),
      body: pages[tab],
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (v) => setState(() => tab = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book), label: 'Lessons'),
          NavigationDestination(icon: Icon(Icons.shield_outlined), selectedIcon: Icon(Icons.shield), label: 'Risk'),
        ],
      ),
    );
  }

  Widget _home() => ListView(
    padding: const EdgeInsets.all(18),
    children: [
      Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF123B48), Color(0xFF1B8F70)]),
          borderRadius: BorderRadius.circular(22),
        ),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.trending_up, size: 42),
          SizedBox(height: 12),
          Text('Forex barachuu har’a jalqabi!', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text('Start learning Forex step by step in Afaan Oromoo + English.'),
        ]),
      ),
      const SizedBox(height: 18),
      Text('Barnoota / Lessons: $completed of ${lessons.length} quizzes passed',
        style: Theme.of(context).textTheme.titleMedium),
      const SizedBox(height: 12),
      ...List.generate(lessons.length, (i) => Card(
        child: ListTile(
          leading: CircleAvatar(child: Text('${i + 1}')),
          title: Text(lessons[i].titleOm),
          subtitle: Text(lessons[i].titleEn),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (_) => LessonScreen(index: i, onPassed: () => setState(() => completed++))),
          ),
        ),
      )),
      const SizedBox(height: 12),
      const Text('Hubachiisa: App kun barnootaaf qofa. Gatii live ykn daldala maallaqa dhugaa hin qabu.',
        style: TextStyle(color: Colors.white70)),
    ],
  );
}

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});
  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(16),
    children: [
      const Text('Barnoota / Lessons', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      ...List.generate(lessons.length, (i) => Card(
        child: ListTile(
          leading: const Icon(Icons.menu_book),
          title: Text(lessons[i].titleOm),
          subtitle: Text(lessons[i].titleEn),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LessonScreen(index: i))),
        ),
      )),
    ],
  );
}

class LessonScreen extends StatefulWidget {
  final int index;
  final VoidCallback? onPassed;
  const LessonScreen({super.key, required this.index, this.onPassed});
  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  int? selected;
  bool checked = false, passed = false;

  @override
  Widget build(BuildContext context) {
    final l = lessons[widget.index];
    return Scaffold(
      appBar: AppBar(title: Text('Lesson ${widget.index + 1}')),
      body: ListView(padding: const EdgeInsets.all(18), children: [
        Text(l.titleOm, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        Text(l.titleEn, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 18),
        Text(l.bodyOm, style: const TextStyle(fontSize: 17, height: 1.5)),
        const SizedBox(height: 18),
        Card(color: const Color(0xFF17243A), child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Fakkeenya / Example', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8), Text(l.example),
          ]),
        )),
        const SizedBox(height: 20),
        Text(l.question, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ...List.generate(l.options.length, (i) => RadioListTile<int>(
          value: i, groupValue: selected, title: Text(l.options[i]),
          onChanged: checked ? null : (v) => setState(() => selected = v),
        )),
        FilledButton(
          onPressed: selected == null || checked ? null : () {
            setState(() { checked = true; passed = selected == l.correct; });
            if (selected == l.correct) widget.onPassed?.call();
          },
          child: const Text('Deebii mirkaneessi / Check answer'),
        ),
        if (checked) Card(
          color: passed ? const Color(0xFF124638) : const Color(0xFF542A2A),
          child: Padding(padding: const EdgeInsets.all(14), child: Text(
            passed ? 'Sirrii dha! / Correct!' : 'Deebii sirrii: ${l.options[l.correct]}',
          )),
        ),
      ]),
    );
  }
}

class RiskScreen extends StatefulWidget {
  const RiskScreen({super.key});
  @override
  State<RiskScreen> createState() => _RiskScreenState();
}

class _RiskScreenState extends State<RiskScreen> {
  final balanceController = TextEditingController(text: '100');
  double risk = 1.0;

  @override
  void dispose() {
    balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final balance = double.tryParse(balanceController.text) ?? 0;
    final riskAmount = balance > 0 ? balance * risk / 100 : 0;
    return ListView(padding: const EdgeInsets.all(20), children: [
      const Text('Risk Calculator', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      const Text('Balaa daldala tokkoof shallagi / Estimate risk per trade.'),
      const SizedBox(height: 20),
      TextField(
        controller: balanceController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: const InputDecoration(labelText: 'Account balance (USD)', border: OutlineInputBorder()),
        onChanged: (_) => setState(() {}),
      ),
      const SizedBox(height: 22),
      Text('Risk: ${risk.toStringAsFixed(1)}%'),
      Slider(
        value: risk, min: 0.5, max: 3, divisions: 5,
        label: '${risk.toStringAsFixed(1)}%',
        onChanged: (v) => setState(() => risk = v),
      ),
      const SizedBox(height: 16),
      Card(color: const Color(0xFF123B32), child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Balaa tilmaamame / Estimated risk'),
          const SizedBox(height: 8),
          Text('\$${riskAmount.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
          Text('${risk.toStringAsFixed(1)}% of account balance'),
        ]),
      )),
      const SizedBox(height: 18),
      const Text('Hubachiisa: Kun tilmaama barnootaa qofa. Slippage, fees fi gap irraa kan ka’e kasaaraan shallaggii kana caaluu danda’a. Forex keessatti maallaqa dhabuu ni dandeessa.',
        style: TextStyle(color: Colors.white70, height: 1.5)),
    ]);
  }
}
