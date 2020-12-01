# 4. Начните работу над проектом «Склад оргтехники». Создайте класс, описывающий склад.
# А также класс «Оргтехника», который будет базовым для классов-наследников.
# Эти классы — конкретные типы оргтехники (принтер, сканер, ксерокс). В базовом классе определить параметры,
# общие для приведенных типов. В классах-наследниках реализовать параметры, уникальные для каждого типа оргтехники.
# 5. Продолжить работу над первым заданием. Разработать методы, отвечающие за приём оргтехники на склад и
# передачу в определенное подразделение компании. Для хранения данных о наименовании и количестве единиц
# оргтехники, а также других данных, можно использовать любую подходящую структуру, например словарь
# 6. Продолжить работу над вторым заданием. Реализуйте механизм валидации вводимых пользователем данных.
# Например, для указания количества принтеров, отправленных на склад, нельзя использовать строковый тип данных.


class Storehouse:
    def __init__(self, name):
        self.name = name
        self.count = 0
        self.lib = []
        self.dict = {}

    def __str__(self):
        return [self.name for i in self.lib]

    def names_in_store(self, value):
        if value.name not in self.lib:
            return self.lib.append(value.name)

    def add(self, quantity):
        self.count += quantity
        return self.count

    def add_to_store(self, stuff, quantity, dept='none'):
        try:
            self.add(quantity)
            self.names_in_store(stuff.name)
            self.dict[stuff.name] = [stuff.color, stuff.made_country, stuff.model_year, stuff.model, quantity, dept]
        except TypeError:
            print('Вводить количество техники можно только цифрами')


class OfficeEquip:
    _all_stuff = []
    _stuff_count = 0

    def __init__(self, name, color, made_country, model_year, model):
        self.name = name
        self.color: str = color
        self.made_country: str = made_country
        self.model_year: int = model_year
        self.model = model
        OfficeEquip._stuff_count += 1
        OfficeEquip._all_stuff.append(self)

    def __str__(self):
        return f'{type}'


class Printer(OfficeEquip):
    def __init__(self, name, color, made_country, model_year, model, print_speed, type):
        super().__init__(name, color, made_country, model_year, model)
        self.print_speed = print_speed
        self.type = type

    def __str__(self):
        return f'{self.name}'


class Scanner(OfficeEquip):
    def __init__(self, name, color, made_country, model_year, model, scan_speed):
        super().__init__(name, color, made_country, model_year, model)
        self.scan_speed = scan_speed

    def __str__(self):
        return f'{self.name}'


class Xerox(OfficeEquip):
    def __init__(self, name, color, made_country, model_year, model, copy_speed):
        super().__init__(name, color, made_country, model_year, model)
        self.copy_speed = copy_speed

    def __str__(self):
        return f'{self.name}'


ms = Storehouse('mystore')
a = Printer('panasonic', 'grey', 'china', 2019, 'p-23', '100 per min', 'laser')
b = Scanner('epson', 'black', 'korea', 2020, 'ep-12', '35 per min')
print(1)