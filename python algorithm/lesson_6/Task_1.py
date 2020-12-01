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


i = 0
z = array[0]
min_ind = 0
while i < len(array):
    tmp_1 = array[i]
    if tmp_1 < z:
        z = tmp_1
        min_ind = i
    i += 1

i = 0

if array[0] == array[min_ind]:
    y = array[1]
    tmp_2 = array[1]
else:
    y = array[0]
    tmp_2 = array[0]

while i < len(array):
    if i != min_ind:
        tmp_2 = array[i]
    if tmp_2 < y:
        y = tmp_2
    i += 1


# print(f'Два минимальный числа списка {array} - {z} и {y}')
print(get_size(list(locals().items())))  # 1288
print(f'Для первого решения - {size(y, z, min_ind, tmp_1, tmp_2, i, array)}')  # 352

# Код Варианта С использует меньше памяти для переменных


