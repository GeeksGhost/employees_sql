-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Vmw6q5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Employees] (
    [emp_no] INTEGER  NOT NULL ,
    [emp_title] VARCHAR  NOT NULL ,
    [emp_dob] DATE  NOT NULL ,
    [emp_first] VARCHAR  NOT NULL ,
    [emp_last] VARCHAR  NOT NULL ,
    [emp_start] DATE  NOT NULL ,
    [emp_sex] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Jobs] (
    [dept_no] INTEGER  NOT NULL ,
    [emp_no] INTEGER  NOT NULL ,
    CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED (
        [dept_no] ASC,[emp_no] ASC
    )
)

CREATE TABLE [Managers] (
    [dept_no] INTEGER  NOT NULL ,
    [emp_no] INTEGER  NOT NULL ,
    CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED (
        [dept_no] ASC,[emp_no] ASC
    )
)

CREATE TABLE [Salary] (
    [emp_no] INTEGER  NOT NULL ,
    [salary] INTEGER  NOT NULL ,
    CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Titles] (
    [title_id] INTEGER  NOT NULL ,
    [emp_title] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

CREATE TABLE [Department] (
    [dept_no] INTEGER  NOT NULL ,
    [dept_name] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

ALTER TABLE [Jobs] WITH CHECK ADD CONSTRAINT [FK_Jobs_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Department] ([dept_no])

ALTER TABLE [Jobs] CHECK CONSTRAINT [FK_Jobs_dept_no]

ALTER TABLE [Jobs] WITH CHECK ADD CONSTRAINT [FK_Jobs_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Jobs] CHECK CONSTRAINT [FK_Jobs_emp_no]

ALTER TABLE [Managers] WITH CHECK ADD CONSTRAINT [FK_Managers_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Department] ([dept_no])

ALTER TABLE [Managers] CHECK CONSTRAINT [FK_Managers_dept_no]

ALTER TABLE [Managers] WITH CHECK ADD CONSTRAINT [FK_Managers_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Managers] CHECK CONSTRAINT [FK_Managers_emp_no]

ALTER TABLE [Salary] WITH CHECK ADD CONSTRAINT [FK_Salary_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Salary] CHECK CONSTRAINT [FK_Salary_emp_no]

ALTER TABLE [Titles] WITH CHECK ADD CONSTRAINT [FK_Titles_emp_title] FOREIGN KEY([emp_title])
REFERENCES [Employees] ([emp_title])

ALTER TABLE [Titles] CHECK CONSTRAINT [FK_Titles_emp_title]

COMMIT TRANSACTION QUICKDBD