-- ����Ŭ ����� ���� --



create user TEST_USER identified by TEST_USER

default tablespace TEST_TABLESPACE;



grant create session to TEST_USER;

--������ ���� ���� �ο�

alter DEFAULT TABLESPACE USERS TO SCOTT2;

grant CONNECT, DBA, RESOURCE to SCOTT2;





--�̹� CREATE �ع��� �� �� �����ֱ�
alter user SCOTT2 DEFAULT TABLESPACE USERS;

alter user SCOTT2 TEMPORARY TABLESPACE TEMP;