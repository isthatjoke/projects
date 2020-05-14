# Пользователь вводит номер буквы в алфавите. Определить, какая это буква.
# https://drive.google.com/file/d/1YCLhS-6C10v-gNm3RybBDDtheBF7c4Ns/view?usp=sharing
letter_number = int(input('Введите номер буквы от 1 до 26: '))
letter_value = chr(64 + letter_number)
print(f'Под цифрой {letter_number} в латинском алфавите идет буква {letter_value}')
