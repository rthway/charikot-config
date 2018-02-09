SELECT DISTINCT
      -- o1.person_id,
			  ifnull(count( Distinct( o1.person_id)),0) as total_ear_infection_chd_count
            -- cn1.concept_id AS question
    FROM
        obs o1
    INNER JOIN concept_name cn1 ON o1.concept_id = cn1.concept_id
        AND cn1.concept_name_type = 'FULLY_SPECIFIED'
        AND cn1.name IN ('Childhood Illness (2-59)-Ear Infection-Acute Ear Infection',
        'Childhood Illness (2-59)-Ear Infection-Chronic Ear Infection',
        'Childhood Illness (2-59)-Ear Infection-Mastoiditis')
        
        AND o1.voided = 0
        AND cn1.voided = 0
    INNER JOIN concept_name cn2 ON o1.value_coded = cn2.concept_id
        AND cn2.concept_name_type = 'FULLY_SPECIFIED'
        AND cn2.voided = 0
    INNER JOIN encounter e ON o1.encounter_id = e.encounter_id
    INNER JOIN person p1 ON o1.person_id = p1.person_id
    WHERE

     -- DATE(e.encounter_datetime) BETWEEN DATE('2017-01-01') AND DATE('2018-11-30')
	DATE(e.encounter_datetime)BETWEEN DATE('#startDate#') AND DATE('#endDate#')
