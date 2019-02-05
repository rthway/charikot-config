var onBloodPressureChange = function (formName, formFieldValues) {
    var systolic = formFieldValues['BP data-Systolic data'];
    var diastolic = formFieldValues['Diastolic data'];
    if (systolic == null && diastolic == null) {
        return {
            disable: ["Posture"]
        }
    } else {
        return {
            enable: ["Posture"]
        }
    }
};
Bahmni.ConceptSet.FormConditions.rules = {
    'Diastolic data' : onBloodPressureChange,
    'BP data-Systolic data' : onBloodPressureChange
    /* 'Diabetes, Last A1C result known?' : function (formName, formFieldValues) {
        var a1c_known = formFieldValues['Diabetes, Last A1C result known?'];
        if (a1c_known) {
            return {
                enable: ["Diabetes, Last known A1C"]
            }
        } else {
            return {
                disable: ["Diabetes, Last known A1C"],
				error: "Please order A1C lab test if available"
            }
        }
    } */ 
};