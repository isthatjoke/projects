# 2. Создайте собственный класс-исключение, обрабатывающий ситуацию деления на нуль. Проверьте его работу
# на данных, вводимых пользователем. При вводе пользователем нуля в качестве делителя программа должна
# корректно обработать эту ситуацию и не завершиться с ошибкой.


class MyOwnClass:
    def __init__(self):
        pass
    @staticmethod
    def __truediv__(a, b):
        if b == 0:
            raise ZeroSeparation()
        else:
            return (a / b)


class ZeroSeparation(Exception):
    def __init__(self, text="Деление на 0 невозможно"):
        self.text = text

    def __str__(self):
        return self.text

a = MyOwnClass()
print(1)