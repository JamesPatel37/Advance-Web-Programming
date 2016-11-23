
    create table additionalField (
        id int8 not null,
        file bytea,
        name varchar(255),
        number int8,
        required boolean,
        text varchar(255),
        dept_id int8,
        primary key (id)
    );

    create table app_status (
        id int8 not null,
        Admit boolean not null,
        AdmitWithCondition boolean not null,
        Denied boolean not null,
        New boolean not null,
        Pending boolean not null,
        comment varchar(255),
        date timestamp,
        primary key (id)
    );

    create table application (
        id int8 not null,
        date timestamp,
        gpa float8,
        gre int8,
        Submitted boolean not null,
        term varchar(255),
        toefl int8,
        transcript varchar(255),
        department_id int8,
        program_id int8,
        status_id int8,
        user_id int8,
        primary key (id)
    );

    create table departments (
        id int8 not null,
        name varchar(255) not null,
        primary key (id)
    );

    create table eduBackground (
        id int8 not null,
        colgName varchar(255),
        degree varchar(255),
        major varchar(255),
        timePeriod1 date,
        timePeriod2 date,
        user_id int8,
        primary key (id)
    );

    create table programs (
        id int8 not null,
        program_name varchar(255) not null,
        department_id int8,
        primary key (id)
    );

    create table students (
        birthday date,
        cin int8,
        citizenship varchar(255),
        gender varchar(255),
        phone int8,
        id int8 not null,
        primary key (id)
    );

    create table users (
        id int8 not null,
        email varchar(255),
        firstname varchar(255),
        lastname varchar(255),
        password varchar(255),
        user_type varchar(255),
        primary key (id)
    );

    alter table departments 
        add constraint UK_j6cwks7xecs5jov19ro8ge3qk unique (name);

    alter table additionalField 
        add constraint FK_nkeqax7hrwcyt6qy50ri54vdp 
        foreign key (dept_id) 
        references departments;

    alter table application 
        add constraint FK_tn727fhfb356bi15ccvq11g6s 
        foreign key (department_id) 
        references departments;

    alter table application 
        add constraint FK_ebwjyxl8e37r6fw1sq8xkj8jy 
        foreign key (program_id) 
        references programs;

    alter table application 
        add constraint FK_5yrcnwlc91l320nm4do3c4nk2 
        foreign key (status_id) 
        references app_status;

    alter table application 
        add constraint FK_dkr6bo95o1seayk7xddr9g7n5 
        foreign key (user_id) 
        references users;

    alter table eduBackground 
        add constraint FK_qfm55nfbeurqs847y26020s4 
        foreign key (user_id) 
        references users;

    alter table programs 
        add constraint FK_t38cee5jtiwtw07papp2rjlca 
        foreign key (department_id) 
        references departments;

    alter table students 
        add constraint FK_l5bb7vny60l3tuedi5yktqro3 
        foreign key (id) 
        references users;

    create sequence hibernate_sequence;


    
    	INSERT INTO public.users(
            id, email, firstname, lastname, password, user_type)
    VALUES (1, 'admin@localhost.localdomain', 'admin', 'admin', 'abcd', 'admin');
    INSERT INTO public.users(
            id, email, firstname, lastname, password, user_type)
    VALUES (2, 'staff1@localhost.localdomain', 'staff1', 'staff1', 'abcd', 'staff');
    INSERT INTO public.users(
            id, email, firstname, lastname, password, user_type)
    VALUES (3, 'staff2@localhost.localdomain', 'staff2', 'staff2', 'abcd', 'staff');
    INSERT INTO public.users(
            id, email, firstname, lastname, password, user_type)
    VALUES (4, 'student1@localhost.localdomain', 'student1', 'student1', 'abcd', 'student');
    INSERT INTO public.users(
            id, email, firstname, lastname, password, user_type)
    VALUES (5, 'student2@localhost.localdomain', 'student2', 'student2', 'abcd', 'student');
        INSERT INTO public.users(
            id, email, firstname, lastname, password, user_type)
    VALUES (6, 'james.patel37@gmail.com', 'Jaymin', 'Patel', 'jaymin', 'student');
        
        INSERT INTO public.students(
          birthday, cin, citizenship, gender, phone, id)
    VALUES ('1991-11-12', 444444, 'India', 'Male', 6264786869, 4);
        INSERT INTO public.students(
          birthday, cin, citizenship, gender, phone, id)
    VALUES ('1991-11-12', 555555, 'India', 'Female', 6264786869, 5);
    INSERT INTO public.students(
          birthday, cin, citizenship, gender, phone, id)
    VALUES ('1991-11-12', 304380562, 'India', 'Male', 6264786869, 6);
    
     INSERT INTO public.departments(
            id, name)
    VALUES (1, 'Computer Science Department');
INSERT INTO public.departments(
            id, name)
    VALUES (2, 'Electrical Engineering');
    INSERT INTO public.departments(
            id, name)
    VALUES (3, 'Accounting Department');
    INSERT INTO public.departments(
            id, name)
    VALUES (4, 'Mechanical Department');
    
    
    INSERT INTO public.programs(
            id, program_name, department_id)
    VALUES (1, 'Software Engineering', 1);
 	INSERT INTO public.programs(
            id, program_name, department_id)
    VALUES (2, 'MS in Computer Science', 1);
     	INSERT INTO public.programs(
            id, program_name, department_id)
    VALUES (3, 'Information Security', 1);
     	INSERT INTO public.programs(
            id, program_name, department_id)
    VALUES (4, 'Power Electronics', 2);
     	INSERT INTO public.programs(
            id, program_name, department_id)
    VALUES (5, 'System Engineering', 2);
     	INSERT INTO public.programs(
            id, program_name, department_id)
    VALUES (6, 'Accounting', 3);
    	INSERT INTO public.programs(
            id, program_name, department_id)
    VALUES (7, 'Machine Engineering', 4);
    
        INSERT INTO public.app_status(
            id, admit, admitwithcondition, denied, new, pending, comment, 
            date)
    VALUES (1, false, false, false, false, false, null, 
            '2016-11-12 00:00:00');
        INSERT INTO public.app_status(
            id, admit, admitwithcondition, denied, new, pending, comment, 
            date)
    VALUES (2, false, false, false, false, false, null, 
            null);
            
    INSERT INTO public.application(
       id, date, gpa, gre, submitted, term, toefl, transcript, department_id, program_id, 
    	status_id, user_id)
    VALUES (1, '1991-11-12 00:00:00', 4, 299, true, 'Fall 2016', 109, 'jaymin.txt', 1, 1, 1, 6);
    INSERT INTO public.application(
       id, date, gpa, gre, submitted, term, toefl, transcript, department_id, program_id, 
    	status_id, user_id)
    VALUES (2, '1991-11-12 00:00:00', 3.5, 300, false, 'Spring 2016', 109, 'jaymin.txt', 1, 2, 2, 4);
    

    
                        INSERT INTO public.additionalfield(
            id, file, name, number, required, text, dept_id)
    VALUES (1, null, 'GRE', 299, true, null, 1);
                         INSERT INTO public.additionalfield(
            id, file, name, number, required, text, dept_id)
    VALUES (2, null, 'GMAT', 300, true, null, 2);
                         INSERT INTO public.additionalfield(
            id, file, name, number, required, text, dept_id)
    VALUES (3, null, 'TOEFL', 109, true, null, 1);
                         INSERT INTO public.additionalfield(
            id, file, name, number, required, text, dept_id)
    VALUES (4, null, 'TOEFL', 99, true, null, 3);
                         INSERT INTO public.additionalfield(
            id, file, name, number, required, text, dept_id)
    VALUES (5, null, 'GRE', 100, true, null, 4);


     INSERT INTO public.edubackground(
            id, colgname, degree, major, timeperiod1, timeperiod2, user_id)
    VALUES (1, 'IIT Bombay', 'B.Tech', 'Information Technology', '2009-11-12', '2013-11-12', 6);
