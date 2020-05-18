# Посчитать, сколько раз встречается определенная цифра в введенной последовательности чисел.
# Количество вводимых чисел и цифра, которую необходимо посчитать, задаются вводом с клавиатуры.
# https://drive.google.com/file/d/1vl9Ss-Nae-SWATKWmHvlplc2ipKo0t82/view?usp=sharing

quantity = int(input('Сколько чисел будете вводить? '))
seek_int = input('Введите цифру, которую нужно найти: ')
int_count = 0
i = 0
val_enum = 1
while i != quantity:
    val = input(f'Введите {val_enum} натуральное число: ')
    for el in val:
        if el == seek_int:
            int_count += 1
    i += 1
    val_enum += 1
print(f'Число {seek_int} встретилось {int_count} раз')