-- ����������� ������
-- �������� ������� IBS, ������ 2019

-- ������� 1
-- �������� ������, 
-- ������� ����� 3 ������� � ���, �����, ���������� ��������, ���������� ������ 
-- ���������� ��������� ������ ������ ������, ��� ������� flag = 1).

-- ��������� ������� ������ ���� ������������ ������� �� ����, ����� �� ������.

CREATE TABLE CDD_PAID (
                pdate DATE, 
                cnt NUMBER,
                flag NUMBER(1) not null);

INSERT INTO CDD_PAID VALUES ('13.12.2017', 5, 1);
INSERT INTO CDD_PAID VALUES ('2.11.2017', 15, 0);
INSERT INTO CDD_PAID VALUES ('22.11.2017', 12, 1);
INSERT INTO CDD_PAID VALUES ('29.11.2017', 6, 1);
INSERT INTO CDD_PAID VALUES ('3.12.2017', 17, 0);
INSERT INTO CDD_PAID VALUES ('23.12.2017', 8, 1);
INSERT INTO CDD_PAID VALUES ('13.01.2018', 5, 1);
INSERT INTO CDD_PAID VALUES ('16.12.2018', 5, 1);
                
SELECT 
    p_year AS "REPORT_YEAR",
    p_month AS "REPORT_MONTH",    
    SUM(cnt) AS "TOTAL_CLIENTS_PAID"    
FROM (SELECT 
        TO_CHAR(pdate, 'mm') AS "P_MONTH",
        TO_CHAR(pdate, 'yyyy') AS "P_YEAR",
        cnt
      FROM CDD_PAID
      WHERE flag = 1)
GROUP BY p_year, p_month
ORDER BY p_year, p_month;