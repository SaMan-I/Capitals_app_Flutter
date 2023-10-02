import 'package:capitals_game/models/question.dart';
import 'package:capitals_game/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';

class HomeDetailView extends StatefulWidget {
  const HomeDetailView(this.tests, {super.key});

  final List<Test> tests;

  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  int index = 0;

  List<bool> answers = [];

  void checkAnswer(bool isTrue) {
    if (answers.length < widget.tests.length) {
      answers.add(isTrue);
      if (index + 1 < widget.tests.length) {
        index++;
      } else {
        resultShouDialog();
      }
      setState(() {});
    }
  }

  void resultShouDialog() {
    List<bool> tureAnwers = [];
    List<bool> falseAnwers = [];
    answers.map((e) => e == true ? tureAnwers.add(e) : null).toList();
    answers.map((e) => e == false ? falseAnwers.add(e) : null).toList();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Responses: ',
          ),
          content: Text(
            'Сorrect answers: ${tureAnwers.length}, \nWrong answers: ${falseAnwers.length}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Ok',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitle(tittle: 'A test about capitals!'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            widget.tests[index].questionText,
            style: const TextStyle(fontSize: 38),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.network(
              widget.tests[index].imageUrl,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.fitHeight,
            ),
          ),
          Row(
            children: [
              OptionButton(
                text: widget.tests[index].variant1.text,
                onPressed: () {
                  checkAnswer(widget.tests[index].variant1.isTrue);
                },
              ),
              OptionButton(
                text: widget.tests[index].variant2.text,
                onPressed: () {
                  checkAnswer(widget.tests[index].variant2.isTrue);
                },
              ),
            ],
          ),
          Row(
            children: [
              OptionButton(
                text: widget.tests[index].variant3.text,
                onPressed: () {
                  checkAnswer(widget.tests[index].variant3.isTrue);
                },
              ),
              OptionButton(
                text: widget.tests[index].variant4.text,
                onPressed: () {
                  checkAnswer(widget.tests[index].variant4.isTrue);
                },
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: answers.length,
                itemBuilder: (BuildContext context, int index) {
                  final answer = answers[index];
                  return Icon(
                    Icons.star,
                    color: answer ? Colors.green : Colors.red,
                    size: 30,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(double.infinity, 70),
            textStyle: const TextStyle(fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Color(0xFF000000),
                width: 0.1,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
          ),
          child: Text(text, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
