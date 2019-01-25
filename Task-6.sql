-- Хайртдинова Марина 
-- Тестовое задание IBS, январь 2019

-- Задание 6
-- Напишите запрос, который вернёт список пунктов назначения
--  с отступами согласно уровню иерархии. 
-- Данные должны быть отсортированы по наименованию в пределах одного уровня.

CREATE TABLE DIC_DESTINATION
            (dic_id NUMBER PRIMARY KEY,
             parent_id NUMBER,
             s_name VARCHAR2(200),
             CONSTRAINT fk_dest FOREIGN KEY (parent_id)
                        REFERENCES DIC_DESTINATION (dic_id));
                        
INSERT INTO DIC_DESTINATION (dic_id, s_name) VALUES (1, 'Великобритания');
INSERT INTO DIC_DESTINATION VALUES (2, 1, 'Англия');
INSERT INTO DIC_DESTINATION VALUES (3, 1, 'Шотландия');
INSERT INTO DIC_DESTINATION VALUES (4, 2, 'Лондон');
INSERT INTO DIC_DESTINATION VALUES (5, 2, 'Манчертер');
INSERT INTO DIC_DESTINATION VALUES (6, 3, 'Глазго');
INSERT INTO DIC_DESTINATION (dic_id, s_name) VALUES (7, 'ЕАЭС');
INSERT INTO DIC_DESTINATION VALUES (8, 7, 'Белоруссия');
INSERT INTO DIC_DESTINATION VALUES (9, 8, 'Минск');
INSERT INTO DIC_DESTINATION VALUES (10, 8, 'Бобруйск');

DECLARE 
    -- все корни дерева 
    CURSOR start_destinations IS 
        SELECT dic_id             
        FROM  DIC_DESTINATION 
        WHERE parent_id IS NULL;
    
    -- все потомки start_destination (включая корень)
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