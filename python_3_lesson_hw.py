# 1. Реализовать функцию, принимающую два числа (позиционные аргументы) и
#  выполняющую их деление. Числа запрашивать у пользователя, предусмотреть обработку ситуации деления на ноль.



def int_diff():
    """Принимает на вход 2 значения, выдает результат их деления.

    Позиционные аргументы:
    a -- int
    b -- int

    """
    a = input("введите первое число ")
    b = input("введите второе число ")
    if a.isdigit() and b.isdigit() is True:
        try:
            print(int(int(a) / int(b)))
        except ZeroDivisionError:
            print("Деление на 0 невозможно")
    else:
        print("необходимо вводить цифры")


int_diff()



# 2. Реализовать функцию, принимающую несколько параметров, описывающих данные пользователя: имя, фамилия, год рождения,
#  город проживания, email, телефон. Функция должна принимать параметры как именованные аргументы.
#  Реализовать вывод данных о пользователе одной строкой.


user_data = {
    'name': 'Тимур',
    'surname': 'Зверев',
    'year': '1987',
    'city': 'Москва',
    'email': 'leniviy7@gmail.com',
    'phone': '+79629992220',
}


def user_info(**kwargs):
    print(f'{user_data.get("name", "")} {user_data.get("surname", "")} {user_data.get("year", "")} '
          f'{user_data.get("city", "")} {user_data.get("email", "")} {user_data.get("phone", "")}')


user_info(**user_data)


# 3. Реализовать функцию my_func(), которая принимает три позиционных аргумента,
# и возвращает сумму наибольших двух аргументов.



def my_func(*args):
    args = sorted(args)
    max1 = args[-1]
    max2 = args[-2]
    total_max = max1 + max2
    return total_max


print(my_func(3, 6, 9))



# 4. Программа принимает действительное положительное число x и целое отрицательное число y.
# Необходимо выполнить возведение числа x в степень y. Задание необходимо реализовать в виде функции my_func(x, y).
# При решении задания необходимо обойтись без встроенной функции возведения числа в степень.
# Подсказка: попробуйте решить задачу двумя способами. Первый — возведение в степень с помощью оператора **.
# Второй — более сложная реализация без оператора **, предусматривающая использование цикла.


#A


def my_pow(x, y):
    if y < 0:
        y = abs(y)
    return x ** y


print(my_pow(3, -3))


#B


def my_pow2(x, y):
    if y < 0:
        y = abs(y)
    i = 1
    pow_x = x
    while i < y:
        pow_x = pow_x * x
        i += 1
    return pow_x


print(my_pow2(3, -3))



# 5. Программа запрашивает у пользователя строку чисел, разделенных пробелом.
# При нажатии Enter должна выводиться сумма чисел. Пользователь может продолжить ввод чисел, разделенных пробелом и
# снова нажать Enter. Сумма вновь введенных чисел будет добавляться к уже подсчитанной сумме.
# Но если вместо числа вводится специальный символ, выполнение программы завершается.
# Если специальный символ введен после нескольких чисел, то вначале нужно добавить сумму этих чисел к
# полученной ранее сумме и после этого завершить программу.



my_sum = 0
user_input = ""
while True:
    try:
        user_input = input("введите числа через пробел ")
        my_list = user_input.split(" ")
        sum_int = [int(x) for x in my_list]
        sum_int = sum(sum_int)
        my_sum = sum_int + my_sum
        print(sum_int)
        print(my_sum)
    except ValueError:
        my_list = user_input.split(" ")
        my_list.pop(-1)
        sum_int = [int(x) for x in my_list]
        sum_int = sum(sum_int)
        my_sum = sum_int + my_sum
        print(sum_int)
        print(my_sum)
        break



# 6. Реализовать функцию int_func(), принимающую слово из маленьких латинских букв и возвращающую его же, но с
# прописной первой буквой. Например, print(int_func(‘text’)) -> Text.
# Продолжить работу над заданием. В программу должна попадать строка из слов, разделенных пробелом.
# Каждое слово состоит из латинских букв в нижнем регистре. Сделать вывод исходной строки, но каждое слово должно
# начинаться с заглавной буквы. Необходимо использовать написанную ранее функцию int_func().



def int_func(text):
    if text.isalpha:
        print(text.title())


int_func("hello how are you")