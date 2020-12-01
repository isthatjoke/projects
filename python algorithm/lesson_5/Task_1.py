# Пользователь вводит данные о количестве предприятий, их наименования и прибыль за 4 квартала (т.е. 4 числа)
# для каждого предприятия. Программа должна определить среднюю прибыль (за год для всех предприятий) и
# отдельно вывести наименования предприятий, чья прибыль выше среднего и ниже среднего.

from collections import defaultdict

data_ = defaultdict(list)
quest_dict = {
    0: 'Укажите название компании: ',
    1: 'Укажите прибыль за первый квартал: ',
    2: 'Укажите прибыль за второй квартал: ',
    3: 'Укажите прибыль за третий квартал: ',
    4: 'Укажите прибыль за четвертый квартал: ',
}
num_of_companies = int(input('Информацию по какому количеству компаний будем заносить? '))
comp_count = 1
key_count = 1
max_key_count = 4
while_count = max_key_count * num_of_companies
temp_list = []
while comp_count <= while_count:
    if key_count > max_key_count:
        key_count = 1
    if key_count == 1:
        comp_name = input(quest_dict.get(0))
    profit = float(input(quest_dict.get(key_count)))
    temp_list.append((comp_name, profit))
    key_count += 1
    comp_count += 1

for name, profit in temp_list:
    data_[name].append(profit)

total_sum = 0
for i in data_:
    total_sum += sum(data_.get(i))

print(f'Средняя прибыль за год для {num_of_companies} компаний - {"%.2f" % (total_sum / num_of_companies)}')

for i in data_:
    if sum(data_.get(i)) >= total_sum / num_of_companies:
        print(f'Компания {i} является прибыльной - {"%.2f" % sum(data_.get(i))}')
    else:
        print(f'Компания {i} является убыточной - {"%.2f" % sum(data_.get(i))}')
