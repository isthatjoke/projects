# В одномерном массиве найти сумму элементов, находящихся между минимальным и максимальным элементами.
# Сами минимальный и максимальный элементы в сумму не включать.
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

print(f'Минимальное число в списке - {array[min_ind]}')
print(f'Максимальное число в списке - {array[max_ind]}')

if min_ind >= max_ind:
    new_array = array[max_ind + 1:min_ind]
else:
    new_array = array[min_ind + 1:max_ind]

print(f'Новый список от минимального значение до максимального {new_array}')

total_sum = 0
if len(new_array) > 1:
    for i in new_array:
        total_sum += i
elif len(new_array) == 1:
    total_sum = new_array[0]

print(f'Сумма чисел в новом списке = {total_sum}')




