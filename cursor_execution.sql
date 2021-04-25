DECLARE
  refcur_local SYS_REFCURSOR;
  mdate date;
  fs int;
  fi int;
  stat varchar2(20);
BEGIN
  refcur_local:=add_fine('102');
  LOOP
  FETCH refcur_local into mdate,fs,fi,stat;
    EXIT WHEN  refcur_local%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Date fees fine status: ' || mdate || ' '|| fs || ' '|| fi || ' '|| stat || ' ');
  END LOOP;
END;