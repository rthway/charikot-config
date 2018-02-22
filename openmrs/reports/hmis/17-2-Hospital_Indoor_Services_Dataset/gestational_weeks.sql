SELECT 
    gestational_weeks.weeks as gestational_weeks,
    count(distinct(ip)) as count_mothers
FROM
    (SELECT '22 - 27 weeks' AS weeks UNION SELECT '28 - 36 weeks' AS weeks UNION SELECT '37 - 41 weeks' AS weeks 
    UNION SELECT '≥ 42 weeks' AS weeks) gestational_weeks 
        LEFT  JOIN
    (SELECT 
        pi.identifier AS ip,
        o.value_numeric as Gestation_period,

            o.value_numeric AS age,
            CASE
                WHEN  o.value_numeric > 21 and o.value_numeric < 28 THEN '22 - 27 weeks'
                
                WHEN  o.value_numeric > 27 and o.value_numeric < 37 THEN '28 - 36 weeks'
                
                WHEN  o.value_numeric > 36 and o.value_numeric < 42 THEN '37 - 41 weeks'
                
                WHEN  o.value_numeric > 41 THEN '≥ 42 weeks'
            END AS weeks
    FROM
        obs o
    INNER JOIN concept_name cn1 ON o.concept_id = cn1.concept_id
        AND cn1.concept_name_type = 'FULLY_SPECIFIED'
        AND cn1.name = 'Delivery Note, Gestation period'
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
        (o.value_numeric IS NOT NULL)
            -- AND DATE(e.encounter_datetime) BETWEEN @dt1 AND @dt2) a ON a.weeks = gestational_weeks.weeks
            AND DATE(e.encounter_datetime) BETWEEN DATE('#startDate#') AND DATE('#endDate#')) a ON a.weeks = gestational_weeks.weeks
GROUP BY gestational_weeks.weeks order by gestational_weeks.weeks;
