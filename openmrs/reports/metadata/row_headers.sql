CREATE TABLE row_header_name_map(
id INT PRIMARY KEY AUTO_INCREMENT,
name_key VARCHAR(255) NOT NULL,
name_value VARCHAR(255) NOT NULL,
report_group_name VARCHAR(255) NOT NULL,
sort_order INT NOT NULL DEFAULT 0
);



INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('New patients', 'Total Additions - New cases never registered earlier', 'Leprosy-Total Additions', 1); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Relapse', 'Total Additions - Relapsed cases', 'Leprosy-Total Additions', 2); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Re-starter', 'Total Additions - Retreatment cases', 'Leprosy-Total Additions', 3); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Transfer in','Total Additions - Transferred in cases',  'Leprosy-Total Additions', 4); 

INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Release from Treatment – RFT','Total Deducted - No of patients released from treatment (RFT)',  'Leprosy-Total Deducted', 1); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Transfer Out-TO', 'Total Deducted - No of patients transferred elsewhere', 'Leprosy-Total Deducted', 2); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Defaulter – DF', 'Total Deducted - Defaulters', 'Leprosy-Total Deducted', 3); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Other Deduction-OD','Total Deducted - Other deducted from treatment',  'Leprosy-Total Deducted', 4);
            
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('PV - Indigenous', 'Plasmodium vivax - Indigenous', 'Types of Malaria note', 1); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('PV - Imported', 'Plasmodium vivax - Imported', 'Types of Malaria note', 2);  
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('PF - Indigenous', 'Plasmodium falciparum - Indigenous', 'Types of Malaria note', 3);  
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('PF - Imported', 'Plasmodium falciparum - Imported', 'Types of Malaria note', 4);  
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('PM - Indigenous', 'Plasmodium mixed - Indigenous', 'Types of Malaria note', 5);  
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('PM - Imported', 'Plasmodium mixed - Imported', 'Types of Malaria note', 6);  
            
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Suspected / probable', 'No. of Malaria note cases - Suspected/Probable', 'Malaria note-No of malaria cases', 1);             
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Confirmed uncomplicated', 'No. of Malaria note cases - Confirmed uncomplicated', 'Malaria note-No of malaria cases', 2);             
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Probable severe', 'No. of Malaria note cases - Probable severe', 'Malaria note-No of malaria cases', 3);             
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Confirmed severe', 'No. of Malaria note cases - Confirmed severe', 'Malaria note-No of malaria cases', 4);             

INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Suspected / probable', 'Treatment of Malaria note - Suspected/Probable', 'Malaria note-Treatment of Malaria note', 1);             
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Confirmed uncomplicated', 'Treatment of Malaria note - Confirmed uncomplicated', 'Malaria note-Treatment of Malaria note', 2);             
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Probable severe', 'Treatment of Malaria note - Probable severe','Malaria note-Treatment of Malaria note', 3);             
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Confirmed severe', 'Treatment of Malaria note - Confirmed severe', 'Malaria note-Treatment of Malaria note', 4);     
            
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Pulmonary BC', 'Pulmonary (BC)', 'Tuberculosis-Case Registration', 1);
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Pulmonary CD', 'Pulmonary (CD)', 'Tuberculosis-Case Registration', 2);
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Extra pulmonary', 'Extra Pulmonay (BC or CD)', 'Tuberculosis-Case Registration', 3);

INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('New diagnosis', 'All New', 'Tuberculosis-Registration', 1);
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Relapse', 'All Relapse', 'Tuberculosis-Registration', 2);
            
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Community', 'Referred by Community', 'Tuberculosis-Referral', 1);
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Private health facility', 'Referred/Diagnosed by Private HF', 'Tuberculosis-Referral', 2);
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Diagnosed by contact tracing', 'Diagnosed by Contact Tracing', 'Tuberculosis-Referral', 3);

INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('M', 'Male', 'Generic', 1);
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('F', 'Female', 'Generic', 2);
            
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('New diagnosis', 'PBC - New', 'Tuberculosis-PBC Treatment outcome', 1);            
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Relapse', 'PBC - Relapse', 'Tuberculosis-PBC Treatment outcome', 2);            
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Treatment after failure', 'PBC - Treatment After Failure', 'Tuberculosis-PBC Treatment outcome', 3);            
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Treatment after loss to follow up', 'PBC - Treatment After Lost to Follow up', 'Tuberculosis-PBC Treatment outcome', 4);            
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Other previously treated', 'PBC - Others previously treated', 'Tuberculosis-PBC Treatment outcome', 5);            
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Previous treatment history unknown', 'PBC - Previous Treatment History Unknown ', 'Tuberculosis-PBC Treatment outcome', 6);        
            
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('New diagnosis', 'PCD - New', 'Tuberculosis-PCD Treatment outcome', 1);   
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Relapse', 'PCD - Others', 'Tuberculosis-PCD Treatment outcome', 2);
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Treatment after failure', 'PCD - Others', 'Tuberculosis-PCD Treatment outcome', 2); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Treatment after loss to follow up', 'PCD - Others', 'Tuberculosis-PCD Treatment outcome', 2); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Other previously treated', 'PCD - Others', 'Tuberculosis-PCD Treatment outcome', 2); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Previous treatment history unknown', 'PCD - Others', 'Tuberculosis-PCD Treatment outcome', 2);             
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Transfer in', 'PCD - Others', 'Tuberculosis-PCD Treatment outcome', 2);             

INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('New diagnosis', 'EP (BC or CD) - New', 'Tuberculosis-EP Treatment outcome', 1); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Relapse', 'EP (BC or CD) - Others', 'Tuberculosis-EP Treatment outcome', 2); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Treatment after failure', 'EP (BC or CD) - Others', 'Tuberculosis-EP Treatment outcome', 2); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Treatment after loss to follow up', 'EP (BC or CD) - Others', 'Tuberculosis-EP Treatment outcome', 2); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Other previously treated', 'EP (BC or CD) - Others', 'Tuberculosis-EP Treatment outcome', 2); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Previous treatment history unknown', 'EP (BC or CD) - Others', 'Tuberculosis-EP Treatment outcome', 2); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Transfer in', 'EP (BC or CD) - Others', 'Tuberculosis-EP Treatment outcome', 2); 


INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('New diagnosis', 'New', 'DRTuberculosis-Case Registration', 1); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Relapse', 'Relapse', 'DRTuberculosis-Case Registration', 2); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Treatment after loss to follow up', 'Treatment after loss to follow up', 'DRTuberculosis-Case Registration', 3); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Treatment after failure category I', 'Treatment After Failure (Cat I)', 'DRTuberculosis-Case Registration', 4); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Treatment after failure category II', 'Treatment After Failure (Cat II)', 'DRTuberculosis-Case Registration', 5); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Transfer in', 'Transfer in', 'DRTuberculosis-Case Registration', 5); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Still under treatment', 'Others', 'DRTuberculosis-Case Registration', 6); 
INSERT INTO row_header_name_map(name_key, name_value, report_group_name, sort_order)
			VALUES('Others', 'Others', 'DRTuberculosis-Case Registration', 6); 
            
select * from row_header_name_map;