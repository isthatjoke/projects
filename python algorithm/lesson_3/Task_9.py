# Найти максимальный элемент среди минимальных элементов столбцов матрицы.
import random

SIZE = 3
MIN_ITEM = 10
MAX_ITEM = 100
matrix = [[random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)] for _ in range(3)]
print(*matrix, sep='\n')

# max_num = 0
# for line in array:
#     min_num = line[0]
#     for el in line:
#         if el < min_num:
#             min_num = el
#     print(min_num)
#     if min_num > max_num:
#         max_num = min_num
# print(f'Максимальное значение из минимальных значений строк матрицы - {max_num}')
temp_matrix = [random.randint(MIN_ITEM, MAX_ITEM) for _ in range(3)]
print(temp_matrix)

for line in matrix:
    for i, el in enumerate(line):
        if el < temp_matrix[i]:
            temp_matrix[i] = el

max_ = temp_matrix[0]
for i, el in enumerate(temp_matrix):
    if el > max_:
        max_ = el
print(max_)





