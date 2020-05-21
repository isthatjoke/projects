# В массиве найти максимальный отрицательный элемент. Вывести на экран его значение и позицию в массиве.
import random

SIZE = 10
MIN_ITEM = -10
MAX_ITEM = 10
array = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)]
print(array)
i = 0
temp = 0
num = 0
pos = 0
for el in array:
    if el < 0 and num >= 0:
        num = el
        pos = i
    if el < 0 and el > num:
        num = el
        pos = i
    i += 1

print(num, pos)
