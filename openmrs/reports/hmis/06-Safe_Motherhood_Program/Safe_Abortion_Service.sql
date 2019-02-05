
SELECT final.`Safe abortion (SA) note Service`,
  sum(final.Medical) AS medical,
  IF(final.Surgical='NA','NA',sum(final.Surgical)) AS surgical
FROM
(SELECT
    'Post Abortion complications' AS 'Safe abortion (SA) note Service',
    SUM(IF(PAC_Compilications.Abortion_Name LIKE 'Medical Abortion%',PAC_Compilications.Count, 0)) AS 'Medical',
    SUM(IF(PAC_Compilications.Abortion_Name LIKE 'Surgical Abortion%', PAC_Compilications.Count, 0)) AS 'Surgical'
  FROM
    (
      SELECT t2.name AS Abortion_Name, 
	  COUNT(DISTINCT(t3.person_id)) AS 'Count'
      FROM obs t1
        INNER JOIN concept_name t2 ON t1.concept_id = t2.concept_id AND t2.concept_name_type = 'FULLY_SPECIFIED' AND t2.voided = 0 
		AND t2.name IN
					('Medical Abortion complications','Surgical Abortion-Immediate complications','Surgical Abortion, Late complications')
        INNER JOIN person t3 ON t1.person_id = t3.person_id
        INNER JOIN encounter t4 ON t1.encounter_id = t4.encounter_id
        INNER JOIN visit t5 ON t4.visit_id = t5.visit_id
      WHERE
        (DATE(t1.obs_datetime) BETWEEN '#startDate#' AND '#endDate#')
        AND
        t1.voided = 0
      GROUP BY t2.name) AS PAC_Compilications

 UNION ALL

  SELECT
    'Post Abortion Care Service Availed' AS 'Safe abortion (SA) note Service',
    PAC_Cause.Count AS 'Medical',
    'NA' AS 'Surgical'
  FROM
    (
      SELECT t2.name AS Cause, 
	  COUNT(DISTINCT(t3.person_id)) AS 'Count'
      FROM obs t1
        INNER JOIN concept_name t2 ON t1.concept_id = t2.concept_id AND t2.concept_name_type = 'FULLY_SPECIFIED' AND t2.voided = 0 AND t2.name IN
                                                                                                                                       ('PAC cause','Not applicable')
        INNER JOIN person t3 ON t1.person_id = t3.person_id
        INNER JOIN encounter t4 ON t1.encounter_id = t4.encounter_id
        INNER JOIN visit t5 ON t4.visit_id = t5.visit_id
      WHERE
        (DATE(t1.obs_datetime) BETWEEN '#startDate#' AND '#endDate#')
        AND
        t1.voided = 0
      GROUP BY t2.name) AS PAC_Cause
 UNION ALL SELECT 'Post Abortion Care Service Availed', 0 ,0
 UNION ALL SELECT 'Post Abortion complications', 0 ,0
) final
GROUP BY final.`Safe abortion (SA) note Service`
ORDER BY final.`Safe abortion (SA) note Service`
;