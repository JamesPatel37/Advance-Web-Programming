
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
