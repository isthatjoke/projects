# В массиве случайных целых чисел поменять местами минимальный и максимальный элементы.
import random

SIZE = 10
MIN_ITEM = 10
MAX_ITEM = 10000000
array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]
print(array)

i = 0
y = 0
z = array[0]
max_ind = 0
min_ind = 0
while i < len(array):
    tmp_1 = array[i]
    tmp_2 = array[i]
    if tmp_1 > y:
        y = tmp_1
        max_ind = i
    if tmp_2 < z:
        z = tmp_2
        min_ind = i
    i += 1

print(y)
print(max_ind)
print(z)
print(min_ind)
array[max_ind], array[min_ind] = array[min_ind], array[max_ind]
print(array)
