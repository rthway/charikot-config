SET @dt1 = date('2017-01-3');
SET @dt2 = date('2017-01-9');
SELECT 
    age_years_grp.age_years as mother_age_years,
    count(distinct(ip)) as count_mothers
FROM
    (SELECT '< 20 years' AS age_years UNION SELECT '20 - 34 years' AS age_years UNION SELECT '> 34 years' AS age_years) age_years_grp
        LEFT  JOIN
    (SELECT 
        pi.identifier AS ip,
            TIMESTAMPDIFF(YEAR, p.birthdate, o.value_datetime) AS age,
            CASE
                WHEN TIMESTAMPDIFF(YEAR, p.birthdate, o.value_datetime) < 20 THEN '< 20 years'
                WHEN
                    TIMESTAMPDIFF(YEAR, p.birthdate, o.value_datetime) > 19
                        AND TIMESTAMPDIFF(YEAR, p.birthdate, o.value_datetime) < 35
                THEN
                    '20 - 34 years'
                WHEN TIMESTAMPDIFF(DAY, p.birthdate, v.date_started) > 34 THEN '> 34 years'
            END AS agegroup,
            DATE(e.encounter_datetime),
            DATE(o.value_datetime) AS 'Date of delivery'
    FROM
        obs o
    INNER JOIN concept_name cn1 ON o.concept_id = cn1.concept_id
        AND cn1.concept_name_type = 'FULLY_SPECIFIED'
        AND cn1.name = 'Delivery Note, Delivery date and time'
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
        (o.value_datetime IS NOT NULL)
            AND DATE(e.encounter_datetime)
            BETWEEN DATE('#startDate#') AND DATE('#endDate#') ) a ON a.agegroup = age_years_grp.age_years
           -- BETWEEN @dt1 AND @dt2) a ON a.agegroup = age_years_grp.age_years
GROUP BY age_years_grp.age_years order by age_years_grp.age_years;
