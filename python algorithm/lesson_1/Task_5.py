# Пользователь вводит две буквы. Определить, на каких местах алфавита они стоят,
# и сколько между ними находится букв.
# https://drive.google.com/file/d/1YCLhS-6C10v-gNm3RybBDDtheBF7c4Ns/view?usp=sharing
first_letter = input('Введите букву латинского алфавита: ')
second_letter = input('Введите букву латинского алфавита: ')
print(f'Буква {first_letter} находится на {ord(first_letter.upper()) - 64} месте в алфавите')
print(f'Буква {second_letter} находится на {ord(second_letter.upper()) - 64} месте в алфавите')

if ord(first_letter.upper()) > ord(second_letter.upper()):
    print(f'Разница между буквами составляет'
          f' {ord(first_letter.upper()) - ord(second_letter.upper())}')
else:
    print(f'Разница между буквами составляет'
          f' {ord(second_letter.upper()) - ord(first_letter.upper())}')
