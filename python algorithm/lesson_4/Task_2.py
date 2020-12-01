import timeit
import cProfile


def sieve_(x):
    new_sieve = []
    rng = 100
    start = 2
    while True:
        for i in range(start, rng):
            if i % 2 != 0 and i % 3 != 0 and i % 4 != 0 and i % 5 != 0 and i % 6 != 0 and i % 7 != 0 and i % 8 != 0 \
                    and i % 9 != 0 or i == 2 or i == 3 or i == 5 or i == 7:
                new_sieve.append(i)
            start = i
        rng += 100
        if len(new_sieve) >= x:
            return f'{x} по счету из списка {new_sieve} будет {new_sieve[x - 1]}'

# print(sieve_(200))


print(timeit.timeit('sieve_(20)', number=100, globals=globals()))           # 0.003431365999999998
print(timeit.timeit('sieve_(200)', number=100, globals=globals()))          # 0.03455040899999999
print(timeit.timeit('sieve_(2000)', number=100, globals=globals()))         # 0.29220989999999997
print(timeit.timeit('sieve_(20000)', number=100, globals=globals()))        # 2.855310547
print(timeit.timeit('sieve_(200000)', number=100, globals=globals()))       # 28.758453232999997
cProfile.run('sieve_(200)')
'''
ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.000    0.000 <string>:1(<module>)
        1    0.000    0.000    0.000    0.000 Task_2.py:5(sieve_)
        1    0.000    0.000    0.000    0.000 {built-in method builtins.exec}
        9    0.000    0.000    0.000    0.000 {built-in method builtins.len}
      214    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
'''

print('x' * 100)


def func_(x):
    import math
    n = x * math.log2(x)
    n = int(n) + 5 # сделал такой ход, чтобы избежать ошибки при малом запрошенном числе
    sieve = [i for i in range(n)]  # квадратные скобки (массив) в рамках алгоритма, но не для использования в ПЗ
    sieve[1] = 0

    for i in range(2, n):
        if sieve[i] != 0:
            j = i + i
            while j < n:
                sieve[j] = 0
                j += i
    res = [i for i in sieve if i != 0]
    return f'{x} по счету из списка {res} будет {res[x - 1]}'


# print(func_(200))


print(timeit.timeit('func_(20)', number=100, globals=globals()))            # 0.009307348999996634
print(timeit.timeit('func_(200)', number=100, globals=globals()))           # 0.055954540999998414
print(timeit.timeit('func_(2000)', number=100, globals=globals()))          # 0.9004800700000004
print(timeit.timeit('func_(20000)', number=100, globals=globals()))         # 15.494302751
print(timeit.timeit('func_(200000)', number=100, globals=globals()))        # 222.623319746
cProfile.run('func_(200)')

'''
ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.001    0.001 <string>:1(<module>)
        1    0.000    0.000    0.001    0.001 Task_2.py:33(func_)
        1    0.000    0.000    0.000    0.000 Task_2.py:37(<listcomp>)
        1    0.000    0.000    0.000    0.000 Task_2.py:46(<listcomp>)
        1    0.000    0.000    0.001    0.001 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {built-in method math.log2}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
'''

# Вывод - первая функция работает очевидно быстрее с линейной прогрессией