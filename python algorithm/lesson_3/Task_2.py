# Во втором массиве сохранить индексы четных элементов первого массива.
# Например, если дан массив со значениями 8, 3, 15, 6, 4, 2, второй массив надо
# заполнить значениями 0, 3, 4, 5, (индексация начинается с нуля), т.к. именно
# в этих позициях первого массива стоят четные числа.
import random

SIZE = 10
MIN_ITEM = 10
MAX_ITEM = 100
array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]
print(array)

new_array = []
i = 0
for el in array:
    if array[i] % 2 == 0:
        new_array.append(i)
    i += 1
print(new_array)

