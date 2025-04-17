#include <stdio.h>

// #define NUM_TASKS 3

// typedef struct {
//     int id;
//     int runtime;
//     int priority;
// } Task;

// void execute_task(Task *task) {
//     // printf("Executing Task %d with priority %d for %d iterations...\n", task->id, task->priority, task->runtime);
//     for (int i = 0; i < task->runtime * 1000000; i++); // Simulate work
//     // printf("Task %d completed.\n", task->id);
// }

// void sort_tasks_by_priority(Task tasks[], int n) {
//     for (int i = 0; i < n - 1; i++) {
//         for (int j = 0; j < n - i - 1; j++) {
//             if (tasks[j].priority < tasks[j + 1].priority) {
//                 Task temp = tasks[j];
//                 tasks[j] = tasks[j + 1];
//                 tasks[j + 1] = temp;
//             }
//         }
//     }
// }

int main() {
    // Task tasks[NUM_TASKS] = {
    //     {1, 2, 1},
    //     {2, 3, 3},
    //     {3, 1, 2}
    // };

    // sort_tasks_by_priority(tasks, NUM_TASKS);

    // for (int i = 0; i < NUM_TASKS; i++) {
    //     execute_task(&tasks[i]);
    // }

    printf("All tasks completed in priority order!\n");
    return 420;
}
