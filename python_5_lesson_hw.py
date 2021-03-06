# 1. Создать программно файл в текстовом формате, записать в него построчно данные,
# вводимые пользователем. Об окончании ввода данных свидетельствует пустая строка.


while True:
    user_input = input("enter your text ")
    if user_input == "":
        break
    my_file = open("new_file.txt", "a", encoding="utf-8")
    my_file.writelines(user_input + "\n")
    my_file.close()


# 2. Создать текстовый файл (не программно), сохранить в нем несколько строк, выполнить
# подсчет количества строк, количества слов в каждой строке.

i = 1
with open("new_file.txt", encoding="utf-8") as my_file:
    content = my_file.readlines()
    print("количество строк в файле ", len(content))
    for el in content:
        my_el = el.split(" ")
        my_str = len(my_el)
        print(f'количество символов в {i} строке - {my_str}')
        i += 1


# 3. Создать текстовый файл (не программно), построчно записать фамилии сотрудников и величину их окладов.
# Определить, кто из сотрудников имеет оклад менее 20 тыс., вывести фамилии этих сотрудников.
# Выполнить подсчет средней величины дохода сотрудников.


with open("new_file.txt", "r", encoding="utf-8") as my_file:
    my_f = list(my_file)
    employee_list = []
    for line in my_f:
        s = line.rstrip().split(" ")
        if s[1].isdigit and float(s[1]) < 20000:
            employee_list.append(s[0])
    print(employee_list)


# 4. Создать (не программно) текстовый файл со следующим содержимым:
# One — 1
# Two — 2
# Three — 3
# Four — 4
# Необходимо написать программу, открывающую файл на чтение и считывающую построчно данные.
# При этом английские числительные должны заменяться на русские.
# Новый блок строк должен записываться в новый текстовый файл.

lib = {'One': 'Один',
       'Two': 'Два',
       'Three': 'Три',
       'Four': 'Четыре',
       }

with open("new.txt", encoding="utf-8") as file:
    my_f = list(file)
    my_file = []
    for line in my_f:
        tmp1 = lib.get(line[:(line.find(" "))])
        with open("last.txt", "a", encoding="utf-8") as new_file:
            new_file.write(line.replace(line[:(line.find(" "))], tmp1))


# 5. Создать (программно) текстовый файл, записать в него программно набор чисел, разделенных пробелами.
# Программа должна подсчитывать сумму чисел в файле и выводить ее на экран.

user_input = input("введите цифры через пробел ")
if user_input.isalpha() or user_input.isspace():
    print("Неверный ввод")
else:
    with open("file.txt", "w") as file:
        file.write(user_input)

with open("file.txt") as file:
    temp = (file.read()).split(" ")
    total_sum = 0
    for el in temp:
        total_sum = total_sum + int(el)
    print(total_sum)


# 6. Необходимо создать (не программно) текстовый файл, где каждая строка описывает учебный предмет и наличие
# лекционных, практических и лабораторных занятий по этому предмету и их количество. Важно, чтобы для каждого предмета
# не обязательно были все типы занятий. Сформировать словарь, содержащий название предмета и общее количество занятий
# по нему. Вывести словарь на экран.
# Примеры строк файла:
# Информатика: 100(л) 50(пр) 20(лаб).
# Физика: 30(л) — 10(лаб)
# Физкультура: — 30(пр) —
#
# Пример словаря:
# {“Информатика”: 170, “Физика”: 40, “Физкультура”: 30}
import re
my_list = []
my_dict = {}

with open("file.txt", encoding="utf-8") as file:
    for line in file:
        my_list.append(line.rstrip())
    for line in my_list:
        fnd = line.find(":")
        dlt = line[:fnd]
        dig = map(int, re.findall('\d+', line))
        my_dict.update({dlt: sum(dig)})
print(my_dict)


# 7. Создать (не программно) текстовый файл, в котором каждая строка должна содержать данные о фирме:
# название, форма собственности, выручка, издержки.
# Пример строки файла: firm_1 ООО 10000 5000.
# Необходимо построчно прочитать файл, вычислить прибыль каждой компании, а также среднюю прибыль.
# Если фирма получила убытки, в расчет средней прибыли ее не включать.
# Далее реализовать список. Он должен содержать словарь с фирмами и их прибылями, а также словарь со средней прибылью.
# Если фирма получила убытки, также добавить ее в словарь (со значением убытков).
# Пример списка: [{“firm_1”: 5000, “firm_2”: 3000, “firm_3”: 1000}, {“average_profit”: 2000}].
# Итоговый список сохранить в виде json-объекта в соответствующий файл.
# Пример json-объекта:
# [{"firm_1": 5000, "firm_2": 3000, "firm_3": 1000}, {"average_profit": 2000}]
#
# Подсказка: использовать менеджеры контекста.

import json
firms = {}
ave = []
ave_profit = {}
full_list = [firms, ave_profit]
with open("my_file.txt", encoding="utf-8") as file:
    for line in file:
        tmp = line[:(line.find(" "))]
        a = (line.rstrip()).split(" ")
        if int(a[2]) > int(a[3]):
            tmp2 = int(a[2]) - int(a[3])
            firms.update({tmp: tmp2})
            ave.append(tmp2)
ave_profit.update({"average_profit": (sum(ave))})

with open("my_file.json", "w", encoding="utf-8") as j_file:
    json.dump(full_list, j_file)

