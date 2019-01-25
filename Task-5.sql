-- Хайртдинова Марина 
-- Тестовое задание IBS, январь 2019

-- Задание 5
-- Напишите запрос, который вернёт данные из этой таблицы
--  в приведённом ниже формате:
-- (дата, количество перелётов, количество пассажиров). 
-- Данные должны быть отсортированы по дате.

CREATE TABLE FLIGHTS_REPORT_2
            (dt DATE,
             report_category VARCHAR(100),
             report_value NUMBER);            

INSERT INTO FLIGHTS_REPORT_2 VALUES ('12.12.18', 'Количество перелетов', 10);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('12.12.18', 'Количество пассажиров', 1080);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('15.12.18', 'Количество перелетов', 18);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('15.12.18', 'Количество пассажиров', 2100);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('17.12.18', 'Количество перелетов', 13);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('17.12.18', 'Количество пассажиров', 1000);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('18.12.18', 'Количество перелетов', 21);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('18.12.18', 'Количество пассажиров', 3000);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('21.12.18', 'Количество перелетов', 29);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('21.12.18', 'Количество пассажиров', 7700);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('24.12.18', 'Количество перелетов', 11);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('24.12.18', 'Количество пассажиров', 870);

SELECT *
FROM FLIGHTS_REPORT_2 
PIVOT(
    SUM(report_value) FOR report_category  
                      IN ('Количество перелетов' AS "FLIGHTS_COUNT", 
                          'Количество пассажиров' AS "PASSENGERS_COUNT"))
ORDER BY dt;