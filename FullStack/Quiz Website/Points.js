let playerNameWidget = document.getElementById("playerName");
let difficultyLevelWidget = document.getElementById("diffLevel");
        
if (localStorage.getItem("playerName")) {                
playerNameWidget.value = localStorage.getItem("playerName");
difficultyLevelWidget.value = localStorage.getItem("difficultyLevel");
}
        
document.getElementById("saveBtn").addEventListener("click", function() {
localStorage.setItem("playerName", playerNameWidget.value);
localStorage.setItem("difficultyLevel", difficultyLevelWidget.value);
});
function GradingFunction(){

    //Checks if see if the two True/False Questions are checked and checks if the text box is empty
    //It will alert the user until all questions are answered. If not all questions are answered it will
    //Alert the user that not all questions have been answered. It will return false so that the user can 
    //continue the quiz without all fields refreshed.
    if ((!document.querySelector('input[name = "two"]:checked'))  || (!document.querySelector('input[name = "six"]:checked')) || (document.getElementById("HSUCity").value == "")){

        alert("You have not answer everything");
        return false
    }
    //Answer 1 and 2 uses parse int and it grabs the 1 or 0 value because of querySelector
    var Answer1 = parseInt(document.querySelector('input[name = "two"]:checked').value);	
    var Answer2 = parseInt(document.querySelector('input[name = "six"]:checked').value);
    //Declaring City Variable before doing a check on Arcata
    var City;
    //The variable that will be compared to is ARCATA, whatever the user types, as long as it is Arcata
    //Whether it is upper case or lower case, this will catch it
    //Anything the user types is set to all uppercase for easy equivalency.
    //If they are comparible, City is set to 1, otherwise City is Set to 0
    var arcata = "ARCATA";
    if ((document.getElementById( "HSUCity" ).value.toUpperCase()) == arcata.toUpperCase()){
        City = 1;
    }
    else{
        City = 0;
    }
    //result is calculated by adding Answer1, Answer2, and City (which is Answer 3)
    var result = Answer1 + Answer2 + City;
    //Result is set to the Element ID of Grade (which will show 0, 1, 2, or 3 depending on user answers)
    document.getElementById("grade").innerHTML = result;
    //If statement to output a string telling the user whether they are smart or not
    if (result == 0) {result2 = "Try Again!"};
    if (result == 1) {result2 = "Try Again"};
    if (result == 2) {result2 = "Almost!"};
    if (result == 3) {result2 = "You Did Great!"};
    //Result2 string is set based on result integer and sets it to the grade2 Element ID
    document.getElementById("grade2").innerHTML = result2;    
    //Used to prevent the page from reloading after getting the data and sending it back for the user to see.
    return false
    }