-- Хайртдинова Марина 
-- Тестовое задание IBS, январь 2019

-- Задание 4
-- Напишите запрос, который вернёт данные из этой таблицы
--  в приведённом ниже формате (дата, категория, значение). 
-- Данные должны быть отсортированы по дате.

-- Названия категорий: «количество пассажиров», «количество перелётов».

CREATE TABLE FLIGHTS_REPORT
            (dt DATE,
             flights_count NUMBER,
             passengers_count NUMBER);
          
INSERT INTO FLIGHTS_REPORT VALUES ('12.12.2018', 10, 1080);
INSERT INTO FLIGHTS_REPORT VALUES ('15.12.2018', 18, 2100);
INSERT INTO FLIGHTS_REPORT VALUES ('18.12.2018', 21, 3000);
INSERT INTO FLIGHTS_REPORT VALUES ('21.12.2018', 29, 7700);
INSERT INTO FLIGHTS_REPORT VALUES ('24.12.2018', 11, 870);
INSERT INTO FLIGHTS_REPORT VALUES ('17.12.2018', 13, 1000);

-- Первый вариант (менее эффективный, т.к. несколько обращений к таблице)
SELECT 
    dt AS "Date",
    'Количество пассажиров' AS "Category",
    passengers_count AS "Total"
FROM flights_report
UNION 
SELECT 
    dt,
    'Количество перелетов', 
    flights_count
FROM FLIGHTS_REPORT;

-- Второй вариант 
SELECT 
    dt AS "DATE",
    CASE report_category
        WHEN 'PASSENGERS_COUNT' THEN 'Количество пассажиров' 
        WHEN 'FLIGHTS_COUNT' THEN 'Количество перелетов'
        END AS "REPORT_CATEGORY",
    report_totals
FROM FLIGHTS_REPORT
UNPIVOT (
    report_totals FOR report_category IN (passengers_count, flights_count))
ORDER BY dt;            