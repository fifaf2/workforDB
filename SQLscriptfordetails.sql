use details;


-- 1. Номера изделий, для которых детали полностью поставляет поставщик (S1)
SET @param_post = 'S1'; 

SELECT num_izdel 
FROM spj 
GROUP BY num_izdel 
HAVING COUNT(DISTINCT num_post) = 1 AND MAX(num_post) = @param_post;

-- ---------------------------------------------------------

-- 2. Общее количество деталей (P1), поставляемых поставщиком (S1)
SET @param_det = 'P1';
SET @param_post = 'S1';

SELECT SUM(Count) 
FROM spj 
WHERE num_Det = @param_det AND num_post = @param_post;

-- ---------------------------------------------------------

-- 3. Номера изделий, использующих только детали, поставляемые поставщиком (S1)
SET @param_post = 'S1';

SELECT DISTINCT num_izdel 
FROM spj t1
WHERE NOT EXISTS (
    SELECT * FROM spj t2 
    WHERE t2.num_izdel = t1.num_izdel AND t2.num_post <> @param_post
);

-- ---------------------------------------------------------

-- 4. Общее число изделий, для которых поставляет детали поставщик (S1)
SET @param_post = 'S1';

SELECT COUNT(DISTINCT num_izdel) 
FROM spj 
WHERE num_post = @param_post;

-- ---------------------------------------------------------

-- 5. Номера изделий, детали для которых поставляет каждый поставщик, поставляющий деталь цвета (Красный)
SET @param_color = 'Красный';

SELECT DISTINCT num_izdel
FROM spj Main
WHERE NOT EXISTS (
    SELECT DISTINCT num_post 
    FROM spj 
    JOIN p ON spj.num_Det = p.num_Det 
    WHERE p.Color = @param_color
    AND num_post NOT IN (
        SELECT num_post FROM spj Sub WHERE Sub.num_izdel = Main.num_izdel
    )
);

-- ---------------------------------------------------------

-- 6. Полный список деталей для всех изделий, изготавливаемых в городе (Лондон)
SET @param_city = 'Лондон';

SELECT DISTINCT p.*
FROM p
JOIN spj ON p.num_Det = spj.num_Det
JOIN j ON spj.num_izdel = j.num_izdel
WHERE j.City = @param_city;

-- ---------------------------------------------------------

-- 7. Номера деталей, поставляемых каким-либо поставщиком из города (Лондон)
SET @param_city = 'Лондон';

SELECT DISTINCT spj.num_Det
FROM spj
JOIN s ON spj.num_post = s.num_post
WHERE s.City = @param_city;

-- ---------------------------------------------------------

-- 8. Список поставок, количество деталей в которых в диапазоне (300 - 750)
SET @range_min = 300;
SET @range_max = 750;

SELECT *
FROM spj
WHERE Count BETWEEN @range_min AND @range_max;

-- ---------------------------------------------------------

-- 9. Номера и названия деталей, поставляемых для изделия из города (Лондон)
SET @param_city = 'Лондон';

SELECT DISTINCT p.num_Det, p.Name
FROM p
JOIN spj ON p.num_Det = spj.num_Det
JOIN j ON spj.num_izdel = j.num_izdel
WHERE j.City = @param_city;

-- ---------------------------------------------------------

-- 10. Цвета деталей, поставляемых поставщиком (S1)
SET @param_post = 'S1';

SELECT DISTINCT p.Color
FROM p
JOIN spj ON p.num_Det = spj.num_Det
WHERE spj.num_post = @param_post;

-- ---------------------------------------------------------

-- 11. Поставщики, поставляющие деталь (P1) больше среднего объема для этого изделия
SET @param_det = 'P1';

SELECT DISTINCT s.num_post, s.Family
FROM s
JOIN spj ON s.num_post = spj.num_post
WHERE spj.num_Det = @param_det
AND spj.Count > (
    SELECT AVG(Sub.Count)
    FROM spj AS Sub
    WHERE Sub.num_Det = @param_det AND Sub.num_izdel = spj.num_izdel
);

-- ---------------------------------------------------------

-- 12. Названия изделий, для которых поставляются детали поставщиком (S1)
SET @param_post = 'S1';

SELECT DISTINCT j.Name
FROM j
JOIN spj ON j.num_izdel = spj.num_izdel
WHERE spj.num_post = @param_post;