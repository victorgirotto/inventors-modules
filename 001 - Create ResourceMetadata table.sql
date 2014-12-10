/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.ResourceMetadata
	(
	Id int NOT NULL IDENTITY (1, 1),
	ResourceId int NOT NULL,
	Name nvarchar(50) NOT NULL,
	Value nvarchar(50) NOT NULL,
	DataType nvarchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ResourceMetadata ADD CONSTRAINT
	PK_ResourceMetadata PRIMARY KEY CLUSTERED 
	(
	Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)

GO
ALTER TABLE dbo.ResourceMetadata SET (LOCK_ESCALATION = TABLE)
GO
COMMIT