use hw_1007;

db.createCollection('users');

db.users.insertMany([
    { id: 1, name: "Анатолий", age: 28, gender: "m" },
    { id: 2, name: "Светлана", age: 25, gender: "f" },
    { id: 3, name: "Никита", age: 33, gender: "m" },
    { id: 4, name: "Ольга", age: 22, gender: "f" }
]);

// Вывести данные о всех представительницах женского пола
db.users.find({ gender: "f" });

// Вывести данные о всех представительницах женского пола и людях старше 30 лет
db.users.find({ $or: [{ gender: "f" }, { age: { $gt: 30 } }] });

// Вывести всех пользователей, у которых имя входит в список (Анатолий, Дмитрий, Ольга, Семен)
db.users.find({ name: { $in: ["Анатолий", "Дмитрий", "Ольга", "Семен"] } });

// Вывести пользователя с идентификатором 3
db.users.findOne({ id: 3 });

// Вывести пользователей в возрасте от 30 до 40 (включая концы)
db.users.find({ age: { $gte: 30, $lte: 40 } });
