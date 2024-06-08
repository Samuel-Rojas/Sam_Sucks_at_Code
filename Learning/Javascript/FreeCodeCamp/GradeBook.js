// GETS THE AVERAGE SCORES OF THE STUDENT

function getAverage(scores){
    let average = 0;
    let sum = 0;

    for(let i = 0; i < scores.length; i++){
        sum = sum + scores[i];
    }
    average = sum / scores.length;
    return average;
}


// GETS THE GRADE OF THE STUDENT BASED ON THE SCORE OF SINGULAR TEST


function getGrade(score){
    let grade = "";
    if(score >= 99){
        grade = "A++";
    }else if (score >= 90 && score <= 99){
        grade = "A";
    }else if (score >= 80 && score <= 89){
        grade = "B";
    }else if (score >= 70 && score <= 79){
        grade = "C";
    }else if (score >= 60 && score <= 69){
        grade = "D";
    } else {
        grade = "F";
    }
    return grade;
}



// CHECKS IF THE STUDENT IS PASSING BASED ON THE PREVIOUS FUNCTION 

function hasPassingGrade(score){
    let checker = getGrade(score);
    let isPassing = true;
    if(checker !== "F"){
        isPassing = true;
    } else{
        isPassing = false;
    }
        return isPassing;
}


// PRINTS THE MESSAGE OF THE STUDENT BASED ON THE PREVIOUS FUNCTIONS

function studentMsg(totalScores, studentScore){
    let msg = "";
    let checkAverage = getAverage(totalScores);
    let checkScore = getGrade(studentScore);

    if(hasPassingGrade(studentScore)){
        msg = "Class average: " + checkAverage + ". " + "Your grade: " + checkScore + ". " + "You have passed the class!";
    } else{
        msg = "Class average: " + checkAverage + ". " + "Your grade: " + checkScore + ". " + "You have failed the class.";
    }
    return msg;
    
}
