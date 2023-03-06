# ECS IsoBuilder

### Тестовое задание

Необходимо написать изометрическую игру на движке Defold с использованием ECS парадигмы программирования.
Библиотеку ECS можно брать любую на ваш вкус.

### Требования и фукнционал, который должен быть в Игре:
  - Размер игрового поля должен быть таким, чтобы на нем могло уместиться примерно 2000 Объектов
  - Размер Зданий в клетках может быть разный: 1x1, 1x2, 1x3, 2x1, 3x1, 2x2... и т.д.
  - В игре можно передвигать камеру по игровой сцене
  - На здание можно кликнуть, при клике проигрывается анимация взрыва, после чего Объект пропадает

### В окне интерфейса должны быть следующие кнопки:
  - Добавление +10, +100, + 1000 случайных Объектов разного размера на игровую сцену в случайную позицию. Важно учесть, что Объекты при генерации не должны пересекаться. В случае если нет возможности поставить новый Объект, выводить сообщение: "Нет места"
  - Удаление -10, -100, -1000 случайных Объектов с Игровой сцены
  - Счётчик текущего кол-ва Объектов на игровой сцене

## Зависимости:

  - [tiny_ecs](https://github.com/bakpakin/tiny-ecs)

  - [rendercam](https://github.com/rgrams/rendercam)

  - [dirtylarry](https://github.com/andsve/dirtylarry)

## Управление:

- `WASD` Движение камеры
- `Mouse Wheel` Приблизить/отдалить камеру
- `Mouse click` Взорвать построенное здание
