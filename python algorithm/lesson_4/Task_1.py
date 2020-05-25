# задача №3 из урока №3
# В массиве случайных целых чисел поменять местами минимальный и максимальный элементы.
import random
import timeit
import cProfile


def func_1(size_):
    array = [random.randint(10, 1000000) for _ in range(size_)]
    i = 0
    y = 0
    z = array[0]
    max_ind = 0
    min_ind = 0
    while i < len(array):
        tmp_1 = array[i]
        tmp_2 = array[i]
        if tmp_1 > y:
            y = tmp_1
            max_ind = i
        if tmp_2 < z:
            z = tmp_2
            min_ind = i
        i += 1
    array[max_ind], array[min_ind] = array[min_ind], array[max_ind]


print(timeit.timeit('func_1(10)', number=100, globals=globals()))           # 0.001872716
print(timeit.timeit('func_1(100)', number=100, globals=globals()))          # 0.028981581999999995
print(timeit.timeit('func_1(1000)', number=100, globals=globals()))         # 0.160318691
print(timeit.timeit('func_1(10000)', number=100, globals=globals()))        # 1.568498435
print(timeit.timeit('func_1(100000)', number=100, globals=globals()))       # 15.190672176
cProfile.run('func_1(10000)')

"""
ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.027    0.027 <string>:1(<module>)
        1    0.003    0.003    0.027    0.027 Task_1.py:6(func_1)
        1    0.003    0.003    0.023    0.023 Task_1.py:7(<listcomp>)
    10000    0.008    0.000    0.015    0.000 random.py:200(randrange)
    10000    0.004    0.000    0.019    0.000 random.py:244(randint)
    10000    0.005    0.000    0.007    0.000 random.py:250(_randbelow_with_getrandbits)
        1    0.000    0.000    0.027    0.027 {built-in method builtins.exec}
    10001    0.001    0.000    0.001    0.000 {built-in method builtins.len}
    10000    0.001    0.000    0.001    0.000 {method 'bit_length' of 'int' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
    10492    0.001    0.000    0.001    0.000 {method 'getrandbits' of '_random.Random' objects}

"""

print('=' * 50)


def func_2(size_):
    array = [random.randint(10, 1000000) for _ in range(size_)]
    min_ = array[0]
    max_ = array[0]
    for i in array:
        if i > max_:
            max_ = i
        elif i < min_:
            min_ = i
    min_ = array.index(min_)
    max_ = array.index(max_)
    array[max_], array[min_] = array[min_], array[max_]


print(timeit.timeit('func_2(10)', number=100, globals=globals()))           # 0.001370027000000107
print(timeit.timeit('func_2(100)', number=100, globals=globals()))          # 0.012756365999997854
print(timeit.timeit('func_2(1000)', number=100, globals=globals()))         # 0.12766348400000282
print(timeit.timeit('func_2(10000)', number=100, globals=globals()))        # 1.290499049000001
print(timeit.timeit('func_2(100000)', number=100, globals=globals()))       # 12.937485678000002
cProfile.run('func_2(10000)')

"""
ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.025    0.025 <string>:1(<module>)
        1    0.001    0.001    0.025    0.025 Task_1.py:38(func_2)
        1    0.004    0.004    0.024    0.024 Task_1.py:39(<listcomp>)
    10000    0.008    0.000    0.016    0.000 random.py:200(randrange)
    10000    0.005    0.000    0.021    0.000 random.py:244(randint)
    10000    0.005    0.000    0.008    0.000 random.py:250(_randbelow_with_getrandbits)
        1    0.000    0.000    0.025    0.025 {built-in method builtins.exec}
    10000    0.001    0.000    0.001    0.000 {method 'bit_length' of 'int' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
    10489    0.002    0.000    0.002    0.000 {method 'getrandbits' of '_random.Random' objects}
        2    0.000    0.000    0.000    0.000 {method 'index' of 'list' objects}
"""

print('=' * 50)


def func_3(size_):
    array = [random.randint(10, 1000000) for _ in range(size_)]
    min_num = min(array)
    max_num = max(array)
    idx_min = array.index(min_num)
    idx_max = array.index(max_num)
    array[idx_min], array[idx_max] = array[idx_max], array[idx_min]


print(timeit.timeit('func_3(10)', number=100, globals=globals()))           # 0.0015200130000003753
print(timeit.timeit('func_3(100)', number=100, globals=globals()))          # 0.012718979000002406
print(timeit.timeit('func_3(1000)', number=100, globals=globals()))         # 0.12597090499999908
print(timeit.timeit('func_3(10000)', number=100, globals=globals()))        # 1.3930805419999963
print(timeit.timeit('func_3(100000)', number=100, globals=globals()))       # 13.340424888000001
cProfile.run('func_3(10000)')

"""
ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.023    0.023 <string>:1(<module>)
        1    0.000    0.000    0.023    0.023 Task_1.py:62(func_3)
        1    0.003    0.003    0.023    0.023 Task_1.py:63(<listcomp>)
    10000    0.008    0.000    0.015    0.000 random.py:200(randrange)
    10000    0.004    0.000    0.019    0.000 random.py:244(randint)
    10000    0.005    0.000    0.007    0.000 random.py:250(_randbelow_with_getrandbits)
        1    0.000    0.000    0.023    0.023 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.max}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.min}
    10000    0.001    0.000    0.001    0.000 {method 'bit_length' of 'int' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
    10518    0.001    0.000    0.001    0.000 {method 'getrandbits' of '_random.Random' objects}
        2    0.000    0.000    0.000    0.000 {method 'index' of 'list' objects}
"""

# Вывод - все 3 вариации кода работают в линейной прогрессии О(n), можно выбирать любой для применения

