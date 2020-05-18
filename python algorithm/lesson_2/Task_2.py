# Посчитать четные и нечетные цифры введенного натурального числа.
# Например, если введено число 34560, в нем 3 четные цифры (4, 6 и 0) и 2 нечетные (3 и 5).
# https://drive.google.com/file/d/1vl9Ss-Nae-SWATKWmHvlplc2ipKo0t82/view?usp=sharing

val = input('Введите целое положительное число: ')
even = 0
not_even = 0
for i in val:
    if int(i) == 0:
        even += 1
    elif int(i) % 2 == 0:
        even += 1
    else:
        not_even += 1

print(f'В вашем числе четных и нечетных цифр соответственно : {even} и {not_even}')

