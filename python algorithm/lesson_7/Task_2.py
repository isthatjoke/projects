# Отсортируйте по возрастанию методом слияния одномерный вещественный массив, заданный
# случайными числами на промежутке [0; 50). Выведите на экран исходный и отсортированный массивы.

from random import random
MAX = 49.99
SIZE = 10
array = [round(random() * MAX, 2) for i in range(SIZE)]
print(array)


def cut_arr(arr):
    if len(arr) < 2:
        return arr
    mid = len(arr) // 2
    left_side = cut_arr(arr[:mid])
    right_side = cut_arr(arr[mid:])
    return sort_arr(left_side, right_side)


def sort_arr(x, y):
    new_list = []
    idx_x = 0
    idx_y = 0
    for _ in range(len(x) + len(y)):
        if idx_x < len(x) and idx_y < len(y):
            if x[idx_x] <= y[idx_y]:
                new_list.append(x[idx_x])
                idx_x += 1
            else:
                new_list.append(y[idx_y])
                idx_y += 1
        elif len(x) == idx_x:
            new_list.append(y[idx_y])
            idx_y += 1
        elif len(y) == idx_y:
            new_list.append(x[idx_x])
            idx_x += 1
    return new_list


print(cut_arr(array))

