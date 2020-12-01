# Определить, является ли год, который ввел пользователь, високосным или не високосным.
# https://drive.google.com/file/d/1YCLhS-6C10v-gNm3RybBDDtheBF7c4Ns/view?usp=sharing
year = int(input('Введите год: '))

if (year % 4 == 0) and (year % 100 != 0) or (year % 400 == 0):
    print(f'{year} - Високосный год')
else:
    print(f'{year} - Не високосный год')
