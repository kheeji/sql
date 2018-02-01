HR@orcl> create or replace package emppack as
  2  type empinfotyp is ref cursor;
  3  procedure empinforpt (emp_cv in out empinfotyp);
  4  end emppack;
  5  /

Package created.

HR@orcl> create or replace package body emppack as procedure
  2  empinforpt (emp_cv in out empinfotyp) as
  3  begin
  4  open emp_cv for select employee_id,salary
  5  from emp_details_view
  6  where job_id='SA_MAN';
  7  end;
  8  end;
  9  /

Package body created.

HR@orcl> /

Package body created.

HR@orcl> ed
Wrote file afiedt.buf

  1  create or replace package body emppack as procedure
  2  empinforpt (emp_cv in out empinfotyp) as
  3  begin
  4  open emp_cv for select employee_id,salary
  5  from emp_details_view
  6  where job_id='SA_MAN';
  7  end;
  8* end;
HR@orcl> variable cv refcursor
HR@orcl> execute emppack.empinforpt(:cv)

PL/SQL procedure successfully completed.

HR@orcl> print cv

EMPLOYEE_ID     SALARY                                                                              
----------- ----------                                                                              
        145      14000                                                                              
        146      13500                                                                              
        147      12000                                                                              
        148      11000                                                                              
        149      10500                                                                              

HR@orcl> spool off
