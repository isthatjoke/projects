# В массиве случайных целых чисел поменять местами минимальный и максимальный элементы.
import random

SIZE = 10
MIN_ITEM = 10
MAX_ITEM = 10000000
array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]
print(array)

min_ = array[0]
max_ = array[0]
for i in array:
    if i > max_:
        max_ = i
    elif i < min_:
        min_ = i

min_ = array.index(min_)
max_ = array.index(max_)
print(min_)
print(max_)
array[max_], array[min_] = array[min_], array[max_]
print(array)
