# 1. Реализовать класс Matrix (матрица). Обеспечить перегрузку конструктора класса (метод init()), который должен
# принимать данные (список списков) для формирования матрицы.
# Подсказка: матрица — система некоторых математических величин, расположенных в виде прямоугольной схемы.
# Примеры матриц вы найдете в методичке.
# Следующий шаг — реализовать перегрузку метода str() для вывода матрицы в привычном виде.
# Далее реализовать перегрузку метода add() для реализации операции сложения двух объектов класса Matrix (двух матриц).
# Результатом сложения должна быть новая матрица.
# Подсказка: сложение элементов матриц выполнять поэлементно — первый элемент первой строки первой матрицы складываем
# с первым элементом первой строки второй матрицы и т.д.


class Matrix:
    def __init__(self, *lst):
        self.lst = lst[0]
        self.count = len(self.lst)
        self.subcount = len(self.lst[0])


    def __str__(self):
        return '\n'.join(['\t'.join([str(j) for j in i]) for i in self.lst])


    def __add__(self, other):
        result = [[0 for i in range(self.subcount)] for i in range(self.count)]
        for i in range(self.count):
            for j in range(self.subcount):
                result[i][j] = self.lst[i][j] + other.lst[i][j]
        return Matrix(result)


m = Matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
n = Matrix([[11, 12, 13], [14, 15, 16], [17, 18, 19]])
c = n + m
print(1)

