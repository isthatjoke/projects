# Массив размером 2m + 1, где m — натуральное число, заполнен случайным образом.
# Найдите в массиве медиану. Медианой называется элемент ряда, делящий его на две равные части:
# в одной находятся элементы, которые не меньше медианы, в другой — не больше медианы.
# Примечание: задачу можно решить без сортировки исходного массива. Но если это слишком сложно,
# используйте метод сортировки, который не рассматривался на уроках (сортировка слиянием также недопустима).

from random import randint
SIZE = 11
MIN = 0
MAX = 100
array = [randint(MIN, MAX) for i in range(SIZE)]
print(array)


arr_len = len(array)
count = 0
guess_num = 0
middle_num = len(array) // 2 + len(array) % 2
exit_code = 0
while exit_code != 1:
    for el in array:
        if el <= array[guess_num]:
            count += 1
        if count == middle_num:
            print(el)
            exit_code = 1
            break
    count = 0
    guess_num += 1












