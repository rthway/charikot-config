SELECT 
    reporting_age_group.name AS age_group,
    answer.concept_full_name AS answer_concept_name,
    gender.gender AS gender,
    result.total_count
FROM
    concept_view AS question
        INNER JOIN
    concept_answer ON question.concept_id = concept_answer.concept_id
        AND question.concept_full_name IN ('Tuberculosis, Treatment Type')
        INNER JOIN
    concept_view AS answer ON answer.concept_id = concept_answer.answer_concept
        INNER JOIN
    (SELECT DISTINCT
        value_reference AS type
    FROM
        visit_attribute) visit_type
        INNER JOIN
    reporting_age_group ON reporting_age_group.report_group_name = 'Tuberculosis Treatment Category'
        INNER JOIN
    (SELECT 'M' AS gender UNION SELECT 'F' AS gender) AS gender
        LEFT OUTER JOIN
    (SELECT 
        obs.value_coded AS answer_concept_id,
            obs.concept_id AS question_concept_id,
            person.gender AS gender,
            visit_attribute.value_reference AS visit_type,
            reporting_age_group.name AS age_group,
            COUNT(*) AS total_count
    FROM
        obs
    INNER JOIN concept_view question ON obs.concept_id = question.concept_id
        AND question.concept_full_name IN ('Tuberculosis, Treatment Type')
    INNER JOIN person ON obs.person_id = person.person_id
    INNER JOIN encounter ON obs.encounter_id = encounter.encounter_id
    INNER JOIN visit ON encounter.visit_id = visit.visit_id
    INNER JOIN visit_attribute ON visit.visit_id = visit_attribute.visit_id
    INNER JOIN visit_attribute_type ON visit_attribute_type.visit_attribute_type_id = visit_attribute.attribute_type_id
        AND visit_attribute_type.name = 'Visit Status'
    INNER JOIN reporting_age_group ON CAST(obs.obs_datetime AS DATE) BETWEEN (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL reporting_age_group.min_years YEAR), INTERVAL reporting_age_group.min_days DAY)) AND (DATE_ADD(DATE_ADD(person.birthdate, INTERVAL reporting_age_group.max_years YEAR), INTERVAL reporting_age_group.max_days DAY))
        AND reporting_age_group.report_group_name = 'Tuberculosis Treatment Category'
    WHERE
        CAST(visit.date_stopped AS DATE) BETWEEN '2018-03-01' AND '2018-03-19'
    GROUP BY obs.concept_id , obs.value_coded , reporting_age_group.name , person.gender , visit_attribute.value_reference) result ON question.concept_id = result.question_concept_id
        AND answer.concept_id = result.answer_concept_id
        AND gender.gender = result.gender
        AND visit_type.type = result.visit_type
        AND result.age_group = reporting_age_group.name
GROUP BY answer.concept_full_name , gender.gender , reporting_age_group.name
ORDER BY reporting_age_group.sort_order,answer.concept_full_name ,gender.gender ;
