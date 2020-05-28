# 0 1 2 3 4 5 6 7 8 9 A B C D E F

from collections import deque
num_1 = [_ for _ in input('Введите первое число в шестнадцатиричной системе: ').upper()]
num_2 = [_ for _ in input('Введите второе число в шестнадцатиричной системе: ').upper()]
hex_dict = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']
new_a = []
new_c = []
new_sum = deque()
total_sum = deque()
len_count = len(new_c)
answer = []
for i in num_1:
    count = 0
    for j in hex_dict:
        if i == j:
            new_a.append(count)
        count += 1
for i in num_2:
    count = 0
    for j in hex_dict:
        if i == j:
            new_c.append(count)
        count += 1
print(new_a)
print(new_c)
if len(new_a) < len(new_c):
    new_a, new_c = new_c, new_a

len_count = len(new_c)

for i in range(len_count):
    sum_ = new_a.pop() + new_c.pop()
    new_sum.append(sum_)

for i in range(len(new_a)):
    new_sum.append(new_a.pop())


def func(lst):
    if len(lst) > 1:
        if int(lst[0]) > 15:
            tmp = lst[0] % 16
            total_sum.append(tmp)
            lst.popleft()
            tmp2 = lst[0] + 1
            lst.popleft()
            lst.appendleft(tmp2)
            return func(lst)
        else:
            total_sum.append(new_sum[0])
            lst.popleft()
            return func(lst)
    else:
        if int(lst[0]) > 15:
            tmp = lst[0] % 16
            total_sum.append(tmp)
            lst.pop()
            lst.append(1)
            return func(lst)
        else:
            total_sum.append(lst[0])


def to_hex(data):
    for el in data:
        answer.append(hex_dict[el])


func(new_sum)
total_sum.reverse()
to_hex(total_sum)
print(''.join(answer))

# 3adc f3ad
