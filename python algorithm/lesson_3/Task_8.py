# Матрица 5x4 заполняется вводом с клавиатуры, кроме последних элементов строк.
# Программа должна вычислять сумму введенных элементов каждой строки и записывать ее в
# последнюю ячейку строки. В конце следует вывести полученную матрицу.
import random

# SIZE = 10
# MIN_ITEM = 10
# MAX_ITEM = 10000000
# array = [[random.randint(MIN_ITEM, MAX_ITEM) for _ in range(SIZE)] for _ in range(SIZE)]
# print(*array, sep='\n')
LINE = 5  # количество строк
LEN_LINE = 3  # длина строки

matrix = []
while len(matrix) != LINE:
    temp = [int(input('Введите число: ')) for _ in range(LEN_LINE)]
    total_sum = 0
    for i in temp:
        total_sum += i
    temp.append(total_sum)
    matrix.append(temp)

print(*matrix, sep='\n')



