# В диапазоне натуральных чисел от 2 до 99 определить, сколько из них кратны каждому из чисел в
# диапазоне от 2 до 9.

array = [_ for _ in range(2, 100)]
seek_array = [_ for _ in range(2, 10)]
print(array)
print(seek_array)

for el in seek_array:
    count = 0
    for i in array:
        if i % el == 0:
           count += 1
    print(f'{el} = {count}')



