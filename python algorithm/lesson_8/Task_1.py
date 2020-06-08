# Определение количества различных подстрок с использованием хеш-функции.
# Пусть на вход функции дана строка. Требуется вернуть количество различных подстрок в этой строке.
# Примечание: в сумму не включаем пустую строку и строку целиком.


def count_letters(val):
    searched = []
    start = 0
    for el in val:
        j = ''
        for i in range(start, len(val)):
            j += val[i]
            if hash(j) not in searched and len(j) != len(val):
                searched.append(hash(j))
        start += 1
    return len(searched)


print(count_letters('sova'))