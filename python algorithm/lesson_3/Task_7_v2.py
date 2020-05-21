# В одномерном массиве целых чисел определить два наименьших элемента.
# Они могут быть как равны между собой (оба являться минимальными), так и различаться.
import random

SIZE = 10
MIN_ITEM = 10
MAX_ITEM = 100
array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]
print(array)

min_1 = array[0]
min_2 = array[0]
for i in array:
    if i < min_1:
        min_1 = array.index(i)
if min_1 == 0:
    min_2 = array[1]
for i in array:
    if i < min_2 and array.index(i) != min_1:
        min_2 = array.index(i)
print(array[min_1], array[min_2])
