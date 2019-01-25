-- Хайртдинова Марина 
-- Тестовое задание IBS, январь 2019

-- Задание 3
-- Задача 1: напишите запрос, который вернёт список из ТОП 5 пассажиров, 
-- которые купили больше всего билетов.

--Задача 2: напишите запрос, который вернёт имена пассажиров, 
--кто купил билеты дороже средней цены за весь период

CREATE TABLE PASSENGERS 
            (passenger_id NUMBER,
             passenger_name VARCHAR2(300), 
             CONSTRAINT pk_ps PRIMARY KEY (passenger_id));
             
CREATE TABLE TICKETS
            (ticket_id NUMBER, 
             ticket_date DATE,
             passenger_id NUMBER,
             price NUMBER,
             CONSTRAINT fk_ps_t FOREIGN KEY (passenger_id) 
                                 REFERENCES PASSENGERS (passenger_id));
                                 
INSERT INTO PASSENGERS VALUES (1, 'Иванов Иван Иванович');
INSERT INTO PASSENGERS VALUES (2, 'Петров Петр Петрович');
INSERT INTO PASSENGERS VALUES (3, 'Семенов Семен Семенович');
INSERT INTO PASSENGERS VALUES (4, 'Федоров Федор Федорович');
INSERT INTO PASSENGERS VALUES (5, 'Смирнов Петр Олегович');
INSERT INTO PASSENGERS VALUES (6, 'Алексеев Иван Николаевич');

INSERT INTO TICKETS VALUES (1, '12.12.18', 1, 3100);
INSERT INTO TICKETS VALUES (2, '25.10.18', 1, 13600);
INSERT INTO TICKETS VALUES (3, '28.11.18', 1, 14000);
INSERT INTO TICKETS VALUES (4, '15.10.18', 2, 13200);
INSERT INTO TICKETS VALUES (5, '11.04.18', 2, 53600);
INSERT INTO TICKETS VALUES (6, '15.10.18', 2, 7900);
INSERT INTO TICKETS VALUES (7, '15.10.18', 3, 11900);
INSERT INTO TICKETS VALUES (8, '26.03.18', 3, 41000);
INSERT INTO TICKETS VALUES (9, '27.02.18', 3, 14600);
INSERT INTO TICKETS VALUES (10, '15.10.18', 4, 11300);
INSERT INTO TICKETS VALUES (11, '12.10.18', 4, 21600);
INSERT INTO TICKETS VALUES (12, '16.10.18', 4, 12200);
INSERT INTO TICKETS VALUES (13, '16.10.18', 5, 14300);
INSERT INTO TICKETS VALUES (14, '26.04.18', 5, 12100);
INSERT INTO TICKETS VALUES (15, '27.04.18', 5, 5500);
INSERT INTO TICKETS VALUES (16, '13.06.18', 1, 7200);
INSERT INTO TICKETS VALUES (18, '18.08.18', 6, 5200);
INSERT INTO TICKETS VALUES (18, '18.08.18', 6, 5200);

-- Задача 1
WITH COUNT_TICKETS AS
    (SELECT 
        passenger_id,
        COUNT(ticket_id) AS "TOTAL_TICKETS"
    FROM TICKETS 
    GROUP BY passenger_id 
    ORDER BY COUNT(ticket_id) DESC)
SELECT 
    passenger_name
FROM 
    COUNT_TICKETS LEFT JOIN PASSENGERS
        ON COUNT_TICKETS.passenger_id = PASSENGERS.passenger_id
WHERE ROWNUM <= 5
ORDER BY total_tickets;

-- Задача 2
SELECT 
    passenger_name 
FROM 
    TICKETS LEFT JOIN PASSENGERS
        ON TICKETS.passenger_id = PASSENGERS.passenger_id
WHERE price > (SELECT AVG(price)
                FROM tickets);
    
    

