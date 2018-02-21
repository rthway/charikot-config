SET @dt1 = date('2017-01-3');
SET @dt2 = date('2017-02-9');
SELECT 
    gender.gender as gender,
    count(distinct(ip)) as count_major_surgeries
FROM
    (SELECT 'M' AS gender UNION SELECT 'F' AS gender ) gender 
        LEFT  JOIN
    (SELECT 
        pi.identifier AS ip,
		p.gender as gender
    FROM
        obs o
    INNER JOIN concept_name cn1 ON o.concept_id = cn1.concept_id
        AND cn1.concept_name_type = 'FULLY_SPECIFIED'
        AND cn1.name = 'Operative Notes, Procedure'
        AND o.voided = 0
        AND cn1.voided = 0
    INNER JOIN encounter e ON o.encounter_id = e.encounter_id
    INNER JOIN visit v ON v.visit_id = e.visit_id
    INNER JOIN person p ON o.person_id = p.person_id
        AND p.voided = 0
    INNER JOIN patient_identifier pi ON pi.patient_id = p.person_id
        AND pi.identifier != 'BAH200052'
        AND pi.voided = '0'
    WHERE
         (o.value_coded IS NOT NULL)
        AND DATE(e.encounter_datetime) BETWEEN @dt1 AND @dt2) a ON a.gender = gender.gender
            -- AND DATE(e.encounter_datetime) BETWEEN DATE('#startDate#') AND DATE('#endDate#')) a ON a.gender = gestational_gender.gender
GROUP BY gender.gender order by gender.gender;
