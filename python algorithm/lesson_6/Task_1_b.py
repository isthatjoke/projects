# В одномерном массиве целых чисел определить два наименьших элемента.
# Они могут быть как равны между собой (оба являться минимальными), так и различаться.
# задание №7 урока 3
import random
import sys

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
# print(array)

min_1 = array[0]
min_1_idx = 0
min_2 = array[0]
idx_1 = 0
for i in array:
    if i < min_1:
        min_1 = array[idx_1]
        min_1_idx = idx_1
    idx_1 += 1
if min_1 == array[0]:
    min_2 = array[1]
idx_2 = 0
for i in array:
    if i < min_2 and idx_2 != min_1_idx:
        min_2 = array[idx_2]
    idx_2 += 1
# print(min_1, min_2)
print(get_size(list(locals().items())))  # 1288
print(f'Для второго решения - {size(min_1, min_1_idx, min_2, idx_1, idx_2, i, array)}')  # 352

