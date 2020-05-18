# В программе генерируется случайное целое число от 0 до 100.
# Пользователь должен его отгадать не более чем за 10 попыток.
# После каждой неудачной попытки должно сообщаться, больше или меньше введенное пользователем
# число, чем то, что загадано. Если за 10 попыток число не отгадано, вывести правильный ответ.
# https://drive.google.com/file/d/1vl9Ss-Nae-SWATKWmHvlplc2ipKo0t82/view?usp=sharing


print('Вы открылы игру "Угадайка".\n'
      ' Компьютер загадывает случайно число от 0 до 100.\n'
      'У вас есть 10 попыток, чтобы его отгадать.')
from random import randint
value = randint(0, 100)
try_count = 0
answer = 0
MAX_TRY_COUNTS = 10
while try_count != MAX_TRY_COUNTS:
      answer = int(input(f'Осталось {MAX_TRY_COUNTS - try_count} попыток.\n'
                         'Введите число: '))
      try_count += 1
      if answer == value:
            print(f'Вы угадали! Верный ответ {value}')
            break
      elif answer < value:
            print('Введенное значение меньше загаданного')
      else:
            print('Введенное значение больше загаданного')

if try_count == MAX_TRY_COUNTS:
      print('Количество попыток исчерпано. Игра окончена')