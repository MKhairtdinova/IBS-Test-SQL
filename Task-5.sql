-- ����������� ������ 
-- �������� ������� IBS, ������ 2019

-- ������� 5
-- �������� ������, ������� ����� ������ �� ���� �������
--  � ���������� ���� �������:
-- (����, ���������� ��������, ���������� ����������). 
-- ������ ������ ���� ������������� �� ����.

CREATE TABLE FLIGHTS_REPORT_2
            (dt DATE,
             report_category VARCHAR(100),
             report_value NUMBER);            

INSERT INTO FLIGHTS_REPORT_2 VALUES ('12.12.18', '���������� ���������', 10);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('12.12.18', '���������� ����������', 1080);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('15.12.18', '���������� ���������', 18);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('15.12.18', '���������� ����������', 2100);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('17.12.18', '���������� ���������', 13);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('17.12.18', '���������� ����������', 1000);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('18.12.18', '���������� ���������', 21);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('18.12.18', '���������� ����������', 3000);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('21.12.18', '���������� ���������', 29);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('21.12.18', '���������� ����������', 7700);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('24.12.18', '���������� ���������', 11);
INSERT INTO FLIGHTS_REPORT_2 VALUES ('24.12.18', '���������� ����������', 870);

SELECT *
FROM FLIGHTS_REPORT_2 
PIVOT(
    SUM(report_value) FOR report_category  
                      IN ('���������� ���������' AS "FLIGHTS_COUNT", 
                          '���������� ����������' AS "PASSENGERS_COUNT"))
ORDER BY dt;