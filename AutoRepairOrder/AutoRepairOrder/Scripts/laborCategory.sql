use AutoRepairOrder;

INSERT INTO labor (laborId, categoryName)
VALUES
(newid(), 'Lube'),
(newid(), 'Oil Change'),
(newid(), 'Flush Transmission'),
(newid(), 'Flush Differential'),
(newid(), 'Wash'),
(newid(), 'Polish')
GO