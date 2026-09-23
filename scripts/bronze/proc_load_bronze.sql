/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

-- Truncate & Insert - For Each of The Source Tables
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	-- Use variables to track execution time
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;

	-- Error-Handling - Try/Catch
	BEGIN TRY
		PRINT '==================================';
		PRINT 'Loading Bronze Layer';
		PRINT '==================================';
		
		-- CRM Tables
		PRINT '----------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '----------------------------------';

		-- Set Starting Time for Entire Batch
		SET @batch_start_time = GETDATE();

		-- Set Starting Time for Table Load
		SET @start_time = GETDATE();

		-- Truncate Table
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
	
		-- Bulk Insert Data from CSV
		PRINT '>> Inserting Data Into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\vivek\Downloads\Portfolio Projects\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,			-- Skips 1st Row of CSV File (Header Row) - Starts Insert From 2nd Row (1st Data Row)
			FIELDTERMINATOR = ',',	-- Specifies the delimiter of the values for each row in the file
			TABLOCK					-- Locks the entire table until Bulk Insert operation is complete
		);

		-- Set Ending Time for Table Load
		SET @end_time = GETDATE();

		-- Output Duration
		PRINT '>> Table Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------';

		-- Set Starting Time for Table Load
		SET @start_time = GETDATE();

		-- Truncate Table
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;

		-- Bulk Insert Data from CSV
		PRINT '>> Inserting Data Into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\vivek\Downloads\Portfolio Projects\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,			-- Skips 1st Row of CSV File (Header Row) - Starts Insert From 2nd Row (1st Data Row)
			FIELDTERMINATOR = ',',	-- Specifies the delimiter of the values for each row in the file
			TABLOCK					-- Locks the entire table until Bulk Insert operation is complete
		);

		-- Set Ending Time for Table Load
		SET @end_time = GETDATE();

		-- Output Duration
		PRINT '>> Table Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------';
	
		-- Set Starting Time for Table Load
		SET @start_time = GETDATE();

		-- Truncate Table
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
	
		-- Bulk Insert Data from CSV
		PRINT '>> Inserting Data Into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\vivek\Downloads\Portfolio Projects\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,			-- Skips 1st Row of CSV File (Header Row) - Starts Insert From 2nd Row (1st Data Row)
			FIELDTERMINATOR = ',',	-- Specifies the delimiter of the values for each row in the file
			TABLOCK					-- Locks the entire table until Bulk Insert operation is complete
		);
	
		-- Set Ending Time for Table Load
		SET @end_time = GETDATE();

		-- Output Duration
		PRINT '>> Table Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------';

		-- ERP Tables
		PRINT '----------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '----------------------------------';

		-- Set Starting Time for Table Load
		SET @start_time = GETDATE();

		-- Truncate Table
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
	
		-- Bulk Insert Data from CSV
		PRINT '>> Inserting Data Into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\vivek\Downloads\Portfolio Projects\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,			-- Skips 1st Row of CSV File (Header Row) - Starts Insert From 2nd Row (1st Data Row)
			FIELDTERMINATOR = ',',	-- Specifies the delimiter of the values for each row in the file
			TABLOCK					-- Locks the entire table until Bulk Insert operation is complete
		);

		-- Set Ending Time for Table Load
		SET @end_time = GETDATE();

		-- Output Duration
		PRINT '>> Table Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------';

		-- Set Starting Time for Table Load
		SET @start_time = GETDATE();

		-- Truncate Table
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
	
		-- Bulk Insert Data from CSV
		PRINT '>> Inserting Data Into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\vivek\Downloads\Portfolio Projects\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,			-- Skips 1st Row of CSV File (Header Row) - Starts Insert From 2nd Row (1st Data Row)
			FIELDTERMINATOR = ',',	-- Specifies the delimiter of the values for each row in the file
			TABLOCK					-- Locks the entire table until Bulk Insert operation is complete
		);

		-- Set Ending Time for Table Load
		SET @end_time = GETDATE();

		-- Output Duration
		PRINT '>> Table Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------';
	
		-- Set Starting Time for Table Load
		SET @start_time = GETDATE();

		-- Truncate Table
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		-- Bulk Insert Data from CSV
		PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\vivek\Downloads\Portfolio Projects\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,			-- Skips 1st Row of CSV File (Header Row) - Starts Insert From 2nd Row (1st Data Row)
			FIELDTERMINATOR = ',',	-- Specifies the delimiter of the values for each row in the file
			TABLOCK					-- Locks the entire table until Bulk Insert operation is complete
		);

		-- Set Ending Time for Table Load
		SET @end_time = GETDATE();

		-- Output Duration
		PRINT '>> Table Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------';

		-- Set Batch Ending Time
		SET @batch_end_time = GETDATE();

		-- Output Duration for Batch
		PRINT '==================================';
		PRINT 'Loading Bronze Layer Completed';
		PRINT '>> Batch Load Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '==================================';
	END TRY
	-- If an error was encountered during the data load
	BEGIN CATCH
		PRINT '==================================';
		PRINT 'ERROR OCCURRED DURING LOADING BRONZE LAYER';
		PRINT 'Error Message: ' + ERROR_MESSAGE();
		PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '==================================';
	END CATCH
END