SELECT 
    gender_group.gender,
    count(distinct(a.ip)) as referred_count
FROM
    (SELECT 'M' AS gender UNION SELECT 'F' AS gender) gender_group
        LEFT OUTER JOIN
   
        (SELECT 
			p1.person_id as ip,
            p1.gender AS gender
    FROM
        obs o1
    INNER JOIN concept_name cn1 ON o1.concept_id = cn1.concept_id
        AND cn1.concept_name_type = 'FULLY_SPECIFIED'
        AND o1.voided = 0
        AND cn1.voided = 0
    INNER JOIN concept_name cn2 ON o1.value_coded = cn2.concept_id
        AND cn2.concept_name_type = 'FULLY_SPECIFIED'
        AND cn2.name IN ('Referred for Investigations' , 'Referred for Further Care', 'Referred for Surgery')
        AND cn2.voided = 0
    INNER JOIN encounter e ON o1.encounter_id = e.encounter_id
    INNER JOIN visit v1 ON v1.visit_id = e.visit_id
    INNER JOIN person p1 ON o1.person_id = p1.person_id
    WHERE
        -- DATE(v1.date_stopped) BETWEEN '2017-01-01' AND '2017-12-30' ) a ON a.gender = gender_group.gender
        DATE(v1.date_stopped) BETWEEN '#startDate#' AND '#endDate#') a ON a.gender = gender_group.gender
       group by gender_group.gender;