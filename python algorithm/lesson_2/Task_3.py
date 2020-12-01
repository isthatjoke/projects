# Сформировать из введенного числа обратное по порядку входящих в него цифр и вывести на экран.
# Например, если введено число 3486, надо вывести 6843
# https://drive.google.com/file/d/1vl9Ss-Nae-SWATKWmHvlplc2ipKo0t82/view?usp=sharing

val = int(input('Введите целое положительное число: '))
# print(val[::-1])
rev_num = ''
while val != 0:
    x = val % 10
    rev_num += str(x)
    val //= 10
print(int(rev_num))
