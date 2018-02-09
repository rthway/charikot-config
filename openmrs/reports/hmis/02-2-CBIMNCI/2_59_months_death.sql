 select
ifnull(( case when lower(causes_for_death) like'%pneumonia%' then cause_count else 0 end),0) as count_ari_death,
ifnull(sum( case when lower(causes_for_death) like'%diarrhea%' then cause_count else 0 end),0) as count_diarrhea_death,
ifnull(sum( case when lower(causes_for_death)  not like '%pneumonia%' and lower(causes_for_death)  not like '%diarrhea%' then
		cause_count else 0 end),0) as count_others_death 
 
from

(SELECT DISTINCT
             count(distinct o1.person_id) as cause_count,
             (select distinct name from concept_name where concept_id=cn2.concept_id limit 1) as causes_for_death
    FROM
        obs o1
    INNER JOIN concept_name cn1 ON o1.concept_id = cn1.concept_id
        AND cn1.concept_name_type = 'FULLY_SPECIFIED'
        AND cn1.name IN ('Death Note, Primary Cause of Death',
        'Death Note, Secondary Cause of Death',
        'Death Note, Tertiary Cause of Death')
        AND o1.voided = 0
        AND cn1.voided = 0
    INNER JOIN concept_name cn2 ON o1.value_coded = cn2.concept_id
        AND cn2.concept_name_type = 'FULLY_SPECIFIED'
        AND cn2.voided = 0
    INNER JOIN encounter e ON o1.encounter_id = e.encounter_id
    INNER JOIN person p1 ON o1.person_id = p1.person_id
	INNER JOIN visit v ON v.visit_id = e.visit_id

    WHERE
		 TIMESTAMPDIFF(MONTH, p1.birthdate, v.date_started) > 2 
		AND TIMESTAMPDIFF(MONTH, p1.birthdate, v.date_started) <60
        -- AND DATE(e.encounter_datetime) BETWEEN DATE('2016-01-01') AND DATE('2018-11-30')
		AND DATE(e.encounter_datetime)  BETWEEN DATE('#startDate#') AND DATE('#endDate#')
 

        group by causes_for_death) a;