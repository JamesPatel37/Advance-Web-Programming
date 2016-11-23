
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
        Admit boolean,
        AdmitWithCondition boolean,
        Denied boolean,
        New boolean,
        Pending boolean,
        comment varchar(255),
        date timestamp,
        application_id int8,
        primary key (id)
    );

    create table application (
        id int8 not null,
        gpa float8,
        gre int8,
        term varchar(255),
        toefl int8,
        transcript bytea,
        department_id int8,
        program_id int8,
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
        timePeriod1 varchar(255),
        timePeriod2 varchar(255),
        studentId int8,
        primary key (id)
    );

    create table programs (
        id int8 not null,
        program_name varchar(255) not null,
        department_id int8,
        primary key (id)
    );

    create table students (
        id int8 not null,
        birthday varchar(255),
        cin int8,
        citizenship varchar(255),
        gender varchar(255),
        phone int8,
        user_id int8,
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

    alter table app_status 
        add constraint FK_ix85mj039ugqltsjddvpos25f 
        foreign key (application_id) 
        references application;

    alter table application 
        add constraint FK_tn727fhfb356bi15ccvq11g6s 
        foreign key (department_id) 
        references departments;

    alter table application 
        add constraint FK_ebwjyxl8e37r6fw1sq8xkj8jy 
        foreign key (program_id) 
        references programs;

    alter table application 
        add constraint FK_dkr6bo95o1seayk7xddr9g7n5 
        foreign key (user_id) 
        references users;

    alter table eduBackground 
        add constraint FK_eo1fll6xvu0c1el9p0ngg6qes 
        foreign key (studentId) 
        references students;

    alter table programs 
        add constraint FK_t38cee5jtiwtw07papp2rjlca 
        foreign key (department_id) 
        references departments;

    alter table students 
        add constraint FK_g4fwvutq09fjdlb4bb0byp7t 
        foreign key (user_id) 
        references users;

    create sequence hibernate_sequence;
