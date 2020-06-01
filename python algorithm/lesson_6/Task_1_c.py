# В одномерном массиве целых чисел определить два наименьших элемента.
# Они могут быть как равны между собой (оба являться минимальными), так и различаться.
# задание №7 урока 3
import random
import sys

SIZE = 10
MIN_ITEM = 10
MAX_ITEM = 100
array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]


def size(*values):
    summ = 0
    for el in values:
        summ += sys.getsizeof(el)
    return summ


def get_size(dict):
    summ = 0
    for i in dict:
        summ += sys.getsizeof(i)
    return f' code - {summ}'


SIZE = 10
MIN_ITEM = 10
MAX_ITEM = 100
array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]


def small_find(arr):
    num = arr[0]
    idx = 0
    for i in range(1, len(arr)):
        if arr[i] < num:
            num = arr[i]
            idx = i
    return idx


def new_arr(arr):
    my_arr = []
    for i in range(len(arr)):
        smallest = small_find(arr)
        my_arr.append(arr.pop(smallest))
    return my_arr


array = new_arr(array)

min_1 = array[0]
min_2 = array[1]
print(get_size(list(locals().items())))  # 1176
print(f'Для третьего решения - {size(min_1, min_2, array)}')  # 240

