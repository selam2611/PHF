CREATE OR REPLACE PROCEDURE GenerateMinitermFragments(
    p_predicates_list VARCHAR2
)
IS
    TYPE predicate_type IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
    
    h_predicates_list predicate_type;
    
BEGIN
   
    h_predicates_list(1) := REPLACE(p_predicates_list, ',', CHR(1));
    
    FOR i IN 1..h_predicates_list.COUNT LOOP
        
        DECLARE
            h_fragment_name VARCHAR2(100) := REPLACE(h_predicates_list(i), CHR(1), ',');
        BEGIN
           
            DBMS_OUTPUT.PUT_LINE('Fragment ' || i || ':');
            DBMS_OUTPUT.PUT_LINE('\t- Predicate: ' || h_fragment_name);
        END;
    END LOOP;
END GenerateMinitermFragments;
/
