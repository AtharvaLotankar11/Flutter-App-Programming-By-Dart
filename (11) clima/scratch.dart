void main() {
  performTasks();
}

void performTasks() async {
  await task1();  // Use 'await' to ensure task1 completes before moving on
  String task2Result = await task2();  // Ensure task2 completes and its result is captured
  task3(task2Result);  // Pass the result of task2 to task3
}

Future<void> task1() async {
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);

  String result = '';  // Initialize result to an empty string

  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3(String task2Data) {
  print('Task 3 complete with $task2Data');
}
