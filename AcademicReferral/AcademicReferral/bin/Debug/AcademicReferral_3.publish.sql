﻿/*
Deployment script for AcademicReferral

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "AcademicReferral"
:setvar DefaultFilePrefix "AcademicReferral"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Starting rebuilding table [dbo].[Instructor]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Instructor] (
    [InstructorId] CHAR (6)     NOT NULL,
    [FirstName]    VARCHAR (30) NOT NULL,
    [LastName]     VARCHAR (30) NOT NULL,
    [Department]   CHAR (6)     NOT NULL,
    PRIMARY KEY CLUSTERED ([InstructorId] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Instructor])
    BEGIN
        INSERT INTO [dbo].[tmp_ms_xx_Instructor] ([InstructorId], [FirstName], [LastName], [Department])
        SELECT   [InstructorId],
                 [FirstName],
                 [LastName],
                 [Department]
        FROM     [dbo].[Instructor]
        ORDER BY [InstructorId] ASC;
    END

DROP TABLE [dbo].[Instructor];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Instructor]', N'Instructor';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[Reason]...';


GO
CREATE TABLE [dbo].[Reason] (
    [ReasonId]     UNIQUEIDENTIFIER NOT NULL,
    [ReasonName]   VARCHAR (30)     NOT NULL,
    [CategoryName] VARCHAR (30)     NOT NULL,
    PRIMARY KEY CLUSTERED ([ReasonId] ASC)
);


GO
PRINT N'Creating [dbo].[Referral]...';


GO
CREATE TABLE [dbo].[Referral] (
    [ReferralId]       INT              IDENTITY (1, 1) NOT NULL,
    [StudentId]        CHAR (6)         NOT NULL,
    [CourseGuid]       UNIQUEIDENTIFIER NOT NULL,
    [InstructorId]     CHAR (6)         NOT NULL,
    [ReferralDate]     DATE             NOT NULL,
    [LetterGrade]      VARCHAR (2)      NOT NULL,
    [MeetingRequested] BIT              NULL,
    [Comments]         TEXT             NULL,
    PRIMARY KEY CLUSTERED ([ReferralId] ASC)
);


GO
PRINT N'Creating [dbo].[ReferralReason]...';


GO
CREATE TABLE [dbo].[ReferralReason] (
    [ReferralId] INT              IDENTITY (1, 1) NOT NULL,
    [ReasonId]   UNIQUEIDENTIFIER NOT NULL,
    [Checked]    BIT              NOT NULL,
    PRIMARY KEY CLUSTERED ([ReferralId] ASC, [ReasonId] ASC)
);


GO
PRINT N'Creating unnamed constraint on [dbo].[Referral]...';


GO
ALTER TABLE [dbo].[Referral] WITH NOCHECK
    ADD FOREIGN KEY ([StudentId]) REFERENCES [dbo].[Students] ([StudentId]);


GO
PRINT N'Creating unnamed constraint on [dbo].[Referral]...';


GO
ALTER TABLE [dbo].[Referral] WITH NOCHECK
    ADD FOREIGN KEY ([CourseGuid]) REFERENCES [dbo].[Courses] ([CourseGuid]);


GO
PRINT N'Creating unnamed constraint on [dbo].[Referral]...';


GO
ALTER TABLE [dbo].[Referral] WITH NOCHECK
    ADD FOREIGN KEY ([InstructorId]) REFERENCES [dbo].[Instructor] ([InstructorId]);


GO
PRINT N'Creating unnamed constraint on [dbo].[ReferralReason]...';


GO
ALTER TABLE [dbo].[ReferralReason] WITH NOCHECK
    ADD FOREIGN KEY ([ReferralId]) REFERENCES [dbo].[Referral] ([ReferralId]);


GO
PRINT N'Creating unnamed constraint on [dbo].[ReferralReason]...';


GO
ALTER TABLE [dbo].[ReferralReason] WITH NOCHECK
    ADD FOREIGN KEY ([ReasonId]) REFERENCES [dbo].[Reason] ([ReasonId]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
CREATE TABLE [#__checkStatus] (
    id           INT            IDENTITY (1, 1) PRIMARY KEY CLUSTERED,
    [Schema]     NVARCHAR (256),
    [Table]      NVARCHAR (256),
    [Constraint] NVARCHAR (256)
);

SET NOCOUNT ON;

DECLARE tableconstraintnames CURSOR LOCAL FORWARD_ONLY
    FOR SELECT SCHEMA_NAME([schema_id]),
               OBJECT_NAME([parent_object_id]),
               [name],
               0
        FROM   [sys].[objects]
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.Referral'), OBJECT_ID(N'dbo.ReferralReason'))
               AND [type] IN (N'F', N'C')
                   AND [object_id] IN (SELECT [object_id]
                                       FROM   [sys].[check_constraints]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0
                                       UNION
                                       SELECT [object_id]
                                       FROM   [sys].[foreign_keys]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0);

DECLARE @schemaname AS NVARCHAR (256);

DECLARE @tablename AS NVARCHAR (256);

DECLARE @checkname AS NVARCHAR (256);

DECLARE @is_not_trusted AS INT;

DECLARE @statement AS NVARCHAR (1024);

BEGIN TRY
    OPEN tableconstraintnames;
    FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
    WHILE @@fetch_status = 0
        BEGIN
            PRINT N'Checking constraint: ' + @checkname + N' [' + @schemaname + N'].[' + @tablename + N']';
            SET @statement = N'ALTER TABLE [' + @schemaname + N'].[' + @tablename + N'] WITH ' + CASE @is_not_trusted WHEN 0 THEN N'CHECK' ELSE N'NOCHECK' END + N' CHECK CONSTRAINT [' + @checkname + N']';
            BEGIN TRY
                EXECUTE [sp_executesql] @statement;
            END TRY
            BEGIN CATCH
                INSERT  [#__checkStatus] ([Schema], [Table], [Constraint])
                VALUES                  (@schemaname, @tablename, @checkname);
            END CATCH
            FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
        END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') >= 0
    CLOSE tableconstraintnames;

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') = -1
    DEALLOCATE tableconstraintnames;

SELECT N'Constraint verification failed:' + [Schema] + N'.' + [Table] + N',' + [Constraint]
FROM   [#__checkStatus];

IF @@ROWCOUNT > 0
    BEGIN
        DROP TABLE [#__checkStatus];
        RAISERROR (N'An error occurred while verifying constraints', 16, 127);
    END

SET NOCOUNT OFF;

DROP TABLE [#__checkStatus];


GO
PRINT N'Update complete.';


GO