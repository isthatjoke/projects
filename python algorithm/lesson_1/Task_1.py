# Найти сумму и произведение цифр трехзначного числа, которое вводит пользователь.
# https://drive.google.com/file/d/1YCLhS-6C10v-gNm3RybBDDtheBF7c4Ns/view?usp=sharing
print('Введите трехзначное число')
val = int(input())
a = val // 100
b = val // 10 % 10
c = val % 10
print(f'Сумма цифр = {a + b + c}')
print(f'Произведение цифр = {a * b * c}')
