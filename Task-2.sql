-- ����������� ������ 
-- �������� ������� IBS, ������ 2019

-- ������� 2
-- �������� ������, ������� ����� 4 �������:
-- id ������, �������� ������, 
-- ���������� ��������, ����������� �� ����� ������, 
-- ���������� ����������, ����������� �� ����� ������.

-- � ����� ������� ������ ���� ��������� ������ ������ 
-- � ����������� �������� � ����������� ���������� �� ���� �������.

CREATE TABLE CITIES 
        (CITY_ID NUMBER, 
        CITY_TITLE VARCHAR2(400), 
        CONSTRAINT PK_CT PRIMARY KEY (city_id));
        
CREATE TABLE FLIGHTS
        (flight_id NUMBER, 
        flight_date DATE, 
        city_id NUMBER, 
        passengers_count NUMBER, 
        CONSTRAINT fk_ps_tt FOREIGN KEY (city_id) 
                   REFERENCES cities (city_id));

INSERT INTO CITIES VALUES (1, '�����');
INSERT INTO CITIES VALUES (2, '������');
INSERT INTO CITIES VALUES (3, '�����-���������');

INSERT INTO FLIGHTS VALUES (1, '29.12.2018', 1, 50);
INSERT INTO FLIGHTS VALUES (2, '29.12.2018', 1, 120);
INSERT INTO FLIGHTS VALUES (3, '30.12.2018', 1, 60);
INSERT INTO FLIGHTS VALUES (4, '31.12.2018', 1, 50);
INSERT INTO FLIGHTS VALUES (5, '01.01.2019', 2, 50);
INSERT INTO FLIGHTS VALUES (6, '11.01.2019', 2, 200);
INSERT INTO FLIGHTS VALUES (7, '31.12.2018', 2, 250);
INSERT INTO FLIGHTS VALUES (8, '31.12.2018', 3, 250);
INSERT INTO FLIGHTS VALUES (9, '14.01.2019', 3, 125);

-- ���������� �������� �����������
WITH FLIGHTS_TOTAL AS
    (SELECT 
        CASE 
            WHEN GROUPING(city_id) = 1 THEN 'Total'
            ELSE TO_CHAR(city_id) -- to_char, ������ ��� 'total' ����� ������� ��������� ���
            END AS "CITY_ID",
            SUM(passengers_count) AS "TOTAL_PASSENGERS",
            COUNT(flight_id) AS "TOTAL_FLIGHTS"
     FROM flights
     GROUP BY ROLLUP (city_id))
SELECT -- ������������� �������� �������
    FLIGHTS_TOTAL.city_id AS "DESTINATION_ID",
    city_title AS "DESTINATION_NAME",
    total_flights, 
    total_passengers 
FROM FLIGHTS_TOTAL LEFT JOIN CITIES ON FLIGHTS_TOTAL.city_id = TO_CHAR(CITIES.city_id)
    

        
