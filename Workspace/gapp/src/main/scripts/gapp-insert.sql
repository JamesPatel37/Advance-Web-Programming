    
    
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
    
    
    INSERT INTO public.students(
            id, birthday, cin, citizenship, gender, phone, user_id)
    VALUES (1, '1991-12-11', 304380562, 'India', 'Male', 6264786869, 4);

    
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
    
        INSERT INTO public.application(
            id, gpa, gre, term, toefl, transcript, department_id, program_id, 
            user_id)
    VALUES (1, 4, 299, 'Fall 2016', 109, null, 1, 1, 
            4);

                        INSERT INTO public.additionalfield(
            id, file, name, number, required, text, dept_id)
    VALUES (1, null, 'GRE', 299, null, null, 1);
                         INSERT INTO public.additionalfield(
            id, file, name, number, required, text, dept_id)
    VALUES (2, null, 'GMAT', 300, null, null, 2);
                         INSERT INTO public.additionalfield(
            id, file, name, number, required, text, dept_id)
    VALUES (3, null, 'TOEFL', 109, null, null, 1);
                         INSERT INTO public.additionalfield(
            id, file, name, number, required, text, dept_id)
    VALUES (4, null, 'TOEFL', 99, null, null, 3);
                         INSERT INTO public.additionalfield(
            id, file, name, number, required, text, dept_id)
    VALUES (5, null, 'GRE', 100, null, null, 4);
    
    
    INSERT INTO public.edubackground(
            id, colgname, degree, major, timeperiod1, timeperiod2, studentid)
    VALUES (1, 'Nirma', 'BE', 'IT', '2009-11-12', '2013-11-12', 1);

    

INSERT INTO public.app_status(
            id, admit, admitwithcondition, denied, new, pending, comment, 
            date, application_id)
    VALUES (null, null, null, null, null, null, null, 
            null, null);
            

    
    