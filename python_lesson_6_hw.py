# 1. Создать класс TrafficLight (светофор) и определить у него один атрибут color (цвет) и метод running (запуск).
# Атрибут реализовать как приватный. В рамках метода реализовать переключение светофора в режимы: красный, желтый,
# зеленый. Продолжительность первого состояния (красный) составляет 7 секунд, второго (желтый) — 2 секунды,
# третьего (зеленый) — на ваше усмотрение. Переключение между режимами должно осуществляться только в указанном
# порядке (красный, желтый, зеленый). Проверить работу примера, создав экземпляр и вызвав описанный метод.
# Задачу можно усложнить, реализовав проверку порядка режимов, и при его нарушении выводить соответствующее сообщение
# и завершать скрипт.

from time import sleep


class TrafficLight:
    __color = ["красный", "желтый", "зеленый"]

    def running(self):
        print(f'Цвет светофора {self.__color[0]}')
        sleep(7)
        print(f'Цвет светофора {self.__color[1]}')
        sleep(2)
        print(f'Цвет светофора {self.__color[2]}')
        sleep(20)


tr = TrafficLight()
tr.running()


# 2. Реализовать класс Road (дорога), в котором определить атрибуты: length (длина), width (ширина).
# Значения данных атрибутов должны передаваться при создании экземпляра класса. Атрибуты сделать защищенными.
# Определить метод расчета массы асфальта, необходимого для покрытия всего дорожного полотна.
# Использовать формулу: длинаширинамасса асфальта для покрытия одного кв метра дороги асфальтом,
# толщиной в 1 см*число см толщины полотна. Проверить работу метода.
# Например: 20м*5000м*25кг*5см = 12500


class Road:
    _length: int = 20
    _width: int = 5000

    def full_weight(self, depth):
        weight: int = 25
        print((self._length * self._width * weight * depth) / 1000)


Road().full_weight(2)
#к сожалению, пока не продумал защиту от ввода индекса, отличающегося от цифры

# 3. Реализовать базовый класс Worker (работник), в котором определить атрибуты: name, surname, position (должность),
# income (доход). Последний атрибут должен быть защищенным и ссылаться на словарь, содержащий элементы: оклад и премия,
# например, {"wage": wage, "bonus": bonus}. Создать класс Position (должность) на базе класса Worker. В классе Position
# реализовать методы получения полного имени сотрудника (get_full_name) и дохода с учетом премии (get_total_income).
# Проверить работу примера на реальных данных (создать экземпляры класса Position, передать данные, проверить значения
# атрибутов, вызвать методы экземпляров).
my_dict = {
    "wage": 50000,
    "bonus": 10000,
}


class Worker:
    name: str = None
    surname: str = None
    position: str = None
    _income = my_dict


class Position(Worker):

    def __init__(self, name, surname, position):
        super().__init__()
        self.name = name
        self.surname = surname
        self.position = position

    def get_full_name(self):
        print(f'{self.name} {self.surname}')

    def get_total_income(self):
        print(f'{self.name} {self.surname} заработал {self._income.get("wage") + self._income.get("bonus")}')

worker_1 = Position('Petya', 'Vasin', 'worker1')
worker_2 = Position('Andrey', 'Shein', 'worker2')

worker_1.get_total_income()
worker_1.get_full_name()



# 4. Реализуйте базовый класс Car. У данного класса должны быть следующие атрибуты: speed, color, name, is_police
# (булево). А также методы: go, stop, turn(direction), которые должны сообщать, что машина поехала, остановилась,
# повернула (куда). Опишите несколько дочерних классов: TownCar, SportCar, WorkCar, PoliceCar. Добавьте в базовый
# класс метод show_speed, который должен показывать текущую скорость автомобиля. Для классов TownCar и WorkCar
# переопределите метод show_speed. При значении скорости свыше 60 (TownCar) и 40 (WorkCar) должно выводиться
# сообщение о превышении скорости.
# Создайте экземпляры классов, передайте значения атрибутов. Выполните доступ к атрибутам, выведите результат.
# Выполните вызов методов и также покажите результат.

import random
class Car:
    speed = None
    color = None
    name = None
    is_police = bool

    def __init__(self, name=None, is_police=None):
        self.speed = random.randint(1, 100)
        self.color = random.choice(('black', 'green', 'blue', 'white', 'silver', 'red'))
        self.name = name
        self.is_police = is_police


    def go(self):
        print(f'автомобиль {self.name} начал движение')

    def stop(self):
        print(f'автомобиль {self.name} остановился')

    def turn_direction(self, direction):
        print(f'автомобиль {self.name} повернул на {direction}')

    def show_speed(self):
        print(f'автомобиль движется со скоростью {self.speed}')
        if towncar.speed > 60 or workcar.speed > 40:
            print('Превышение скорости!')
        else:
            pass


class TownCar(Car):
    pass

class SportCar(Car):
    pass

class WorkCar(Car):
    pass

class PoliceCar(Car):
    pass

towncar = TownCar()
workcar = WorkCar()
sportcar = SportCar()
policecar = PoliceCar(is_police=True)


# 5. Реализовать класс Stationery (канцелярская принадлежность). Определить в нем атрибут title (название) и
# метод draw (отрисовка). Метод выводит сообщение “Запуск отрисовки.” Создать три дочерних класса Pen (ручка),
# Pencil (карандаш), Handle (маркер). В каждом из классов реализовать переопределение метода draw.
# Для каждого из классов методы должен выводить уникальное сообщение. Создать экземпляры классов и проверить,
# что выведет описанный метод для каждого экземпляра.


class Stationery:
    title = None

    def draw(self):
        print('Запуск отрисовки')

class Pen(Stationery):
    def draw(self):
        print('отрисовка ручкой')
class Pencil(Stationery):
    def draw(self):
        print('отрисовка карандашом')
class Handle(Stationery):
    def draw(self):
        print('отрисовка маркером')

pen = Pen()
pencil = Pencil()
handle = Handle()