# Определить, какое число в массиве встречается чаще всего
import random

SIZE = 100
MIN_ITEM = 10
MAX_ITEM = 100
array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]
print(array)

num = array[0]
count = 0
i = 0
for el in array:
    temp_count = 0
    for itm in range(0, len(array)):
        if array[itm] == el:
            temp_count += 1
        if temp_count > count:
            count = temp_count
            num = array[itm]



print(f'Больше всего встретилось число {num} - {count}' if count > 1 else f'Всех чисел по 1 экземпляру')


