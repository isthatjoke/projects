# Выполнить логические побитовые операции «И», «ИЛИ» и др. над числами 5 и 6.
# Выполнить над числом 5 побитовый сдвиг вправо и влево на два знака. Объяснить полученный результат.
# https://drive.google.com/file/d/1YCLhS-6C10v-gNm3RybBDDtheBF7c4Ns/view?usp=sharing
a = 5
b = 6
bit_and = a & b  # битовая операция "И"
bit_or = a | b  # битовая операция "ИЛИ"
bit_xor = a ^ b  # битовая операция "исключающее ИЛИ"
print(bin(5))
print(bin(6))
print(bin(a & b))
print(bin(a | b))
print(bin(a ^ b))
print(bit_and)
print(bit_or)
print(bit_xor)
a_right = a >> 2
print(bin(a_right))
'''
побитовый сдвиг вправо - 2 знака в битовом значении убирается справа.
было bin(5) = 0b101 , стало 0b1
'''
a_left = a << 2
print(bin(a_left))
'''
побитовый сдвиг влево - 2 знака 0 в битовом значении добавляется справа.
было bin(5) = 0b101 , стало 0b10100
'''
