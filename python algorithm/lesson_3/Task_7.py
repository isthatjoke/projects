# В одномерном массиве целых чисел определить два наименьших элемента.
# Они могут быть как равны между собой (оба являться минимальными), так и различаться.
import random

SIZE = 10
MIN_ITEM = 10
MAX_ITEM = 100
array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]


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


print(f'Два минимальный числа списка {array} - {z} и {y}')