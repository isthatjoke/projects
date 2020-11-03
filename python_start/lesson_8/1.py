# 1. Реализовать класс «Дата», функция-конструктор которого должна принимать дату в виде строки формата
# «день-месяц-год».
# В рамках класса реализовать два метода. Первый, с декоратором @classmethod, должен извлекать число, месяц, год и
# преобразовывать их тип к типу «Число». Второй, с декоратором @staticmethod, должен проводить валидацию числа,
# месяца и года (например, месяц — от 1 до 12). Проверить работу полученной структуры на реальных данных.

class Date_:
    def __init__(self, date_):
        self.date_ = date_

    @staticmethod
    def correct_date(value: str):
        check_date = [int(i) for i in (value.split("-"))]
        if check_date[0] not in range(1, 31):
            print('Неверная дата')
        elif check_date[1] not in range(1, 12):
            print('Неверно указан месяц')
        elif check_date[2] not in range(1, 2021):
            print('Неверно указан год')
        else:
            print('Все ок')



    @classmethod
    def get_int(cls, date_):
        return [int(i) for i in (date_.split("-"))]

print(1)
