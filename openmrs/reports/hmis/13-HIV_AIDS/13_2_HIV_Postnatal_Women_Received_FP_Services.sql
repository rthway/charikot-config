
            
            SELECT 
    COUNT(DISTINCT (o1.person_id)) AS 'HIV+ve postnatal women received FP services'
FROM
    obs o1
        INNER JOIN
    concept_name cn1 ON o1.concept_id = cn1.concept_id
        AND cn1.concept_name_type = 'FULLY_SPECIFIED'
        AND cn1.name = 'PMTCT, Family Planning services provided postpartum'
        AND o1.voided = 0
        AND cn1.voided = 0
        INNER JOIN
    encounter e ON o1.encounter_id = e.encounter_id
        INNER JOIN
    person p1 ON o1.person_id = p1.person_id
WHERE
    DATE(e.encounter_datetime) BETWEEN DATE('#startDate#') AND DATE('#endDate#')
        AND o1.value_coded IS NOT NULL