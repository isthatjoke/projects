# В одномерном массиве найти сумму элементов, находящихся между минимальным и максимальным элементами.
# Сами минимальный и максимальный элементы в сумму не включать.
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

print(f'Минимальное число в списке - {array[min_]}')
print(f'Максимальное число в списке - {array[max_]}')

if min_ >= max_:
    new_array = array[max_ + 1:min_]
else:
    new_array = array[min_ + 1:max_]

print(f'Новый список от минимального значение до максимального {new_array}')

total_sum = 0
if len(new_array) > 1:
    for i in new_array:
        total_sum += i
elif len(new_array) == 1:
    total_sum = new_array[0]

print(f'Сумма чисел в новом списке = {total_sum}')