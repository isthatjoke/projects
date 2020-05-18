# Сформировать из введенного числа обратное по порядку входящих в него цифр и вывести на экран.
# Например, если введено число 3486, надо вывести 6843
# https://drive.google.com/file/d/1vl9Ss-Nae-SWATKWmHvlplc2ipKo0t82/view?usp=sharing

def func(x):
    if len(str(x)) == 1:
        return f'{x}'
    elif len(str(x)) > 1:
        y = x % 10
        return f'{y}{func(x // 10)}'


val = int(input('Введите целое положительное число: '))
answer = func(val)
print(int(answer))
