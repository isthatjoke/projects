# 2. Реализовать проект расчета суммарного расхода ткани на производство одежды.
# Основная сущность (класс) этого проекта — одежда, которая может иметь определенное название.
# К типам одежды в этом проекте относятся пальто и костюм. У этих типов одежды существуют параметры:
# размер (для пальто) и рост (для костюма). Это могут быть обычные числа: V и H, соответственно.
# Для определения расхода ткани по каждому типу одежды использовать формулы: для пальто (V/6.5 + 0.5),
# для костюма (2 * H + 0.3). Проверить работу этих методов на реальных данных.
# Реализовать общий подсчет расхода ткани. Проверить на практике полученные на этом уроке знания:
# реализовать абстрактные классы для основных классов проекта, проверить на практике работу декоратора @property.


class Cloth:
    def __init__(self, name):
        self.name = name

    def coat(self, V):
        self.coat_size = V / 6.5 + 0.5

    def suit(self, H):
        self.suit_size = 2 * H + 0.3

    def __add__(self, other):
        return self + other

    @property
    def result(self):
        return f'Расход ткани на пошив костюма - {self.suit_size}, пальто - {self.coat_size}'


a = Cloth('yow')
print(1)