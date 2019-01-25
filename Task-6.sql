-- ����������� ������ 
-- �������� ������� IBS, ������ 2019

-- ������� 6
-- �������� ������, ������� ����� ������ ������� ����������
--  � ��������� �������� ������ ��������. 
-- ������ ������ ���� ������������� �� ������������ � �������� ������ ������.

CREATE TABLE DIC_DESTINATION
            (dic_id NUMBER PRIMARY KEY,
             parent_id NUMBER,
             s_name VARCHAR2(200),
             CONSTRAINT fk_dest FOREIGN KEY (parent_id)
                        REFERENCES DIC_DESTINATION (dic_id));
                        
INSERT INTO DIC_DESTINATION (dic_id, s_name) VALUES (1, '��������������');
INSERT INTO DIC_DESTINATION VALUES (2, 1, '������');
INSERT INTO DIC_DESTINATION VALUES (3, 1, '���������');
INSERT INTO DIC_DESTINATION VALUES (4, 2, '������');
INSERT INTO DIC_DESTINATION VALUES (5, 2, '���������');
INSERT INTO DIC_DESTINATION VALUES (6, 3, '������');
INSERT INTO DIC_DESTINATION (dic_id, s_name) VALUES (7, '����');
INSERT INTO DIC_DESTINATION VALUES (8, 7, '����������');
INSERT INTO DIC_DESTINATION VALUES (9, 8, '�����');
INSERT INTO DIC_DESTINATION VALUES (10, 8, '��������');

DECLARE 
    -- ��� ����� ������ 
    CURSOR start_destinations IS 
        SELECT dic_id             
        FROM  DIC_DESTINATION 
        WHERE parent_id IS NULL;
    
    -- ��� ������� start_destination (������� ������)
    CURSOR child_destinations (start_destination_id DIC_DESTINATION.dic_id%TYPE) IS
        SELECT LPAD(s_name, LENGTH(s_name) + LEVEL*2-2, '_') AS "DESTINATION"
        FROM DIC_DESTINATION
        START WITH dic_id = start_destination_id
        CONNECT BY PRIOR dic_id = parent_id;
BEGIN
    FOR dest IN start_destinations
    LOOP
        FOR child IN child_destinations(dest.dic_id) 
        LOOP
            DBMS_OUTPUT.PUT_LINE(child.destination);
        END LOOP;
    END LOOP;    
END; 