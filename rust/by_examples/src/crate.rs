// Crate -- единица компиляции. Возникает при компиляции файла:
// 1. Вставить в файл все подключенные модули
// 2. extern crate *name*; -- импортировать все имена в модуле name, а также слинковать
// с внешний crate *name*
// 3. В зависимости от типа crate создать crate-bin или crate-lib

// #![crate_type = "lib"]
// #![crate_name = "rary"]
// Или через флаги компилятора. Принято, чтобы названия библиотек начинались на lib.