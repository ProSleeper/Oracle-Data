-- 오라클 사용자 생성 --



create user TEST_USER identified by TEST_USER

default tablespace TEST_TABLESPACE;



grant create session to TEST_USER;

--데이터 생성 권한 부여

alter DEFAULT TABLESPACE USERS TO SCOTT2;

grant CONNECT, DBA, RESOURCE to SCOTT2;





--이미 CREATE 해버린 후 두 권한주기
alter user SCOTT2 DEFAULT TABLESPACE USERS;

alter user SCOTT2 TEMPORARY TABLESPACE TEMP;