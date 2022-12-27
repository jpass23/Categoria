# Categoria
This was a project I did for [@appteamcarolina](https://github.com/appteamcarolina) with a classmate of mine. It is a trivia game where the user gets 5 questions in a category of their choice.

## Screenshots:
<div align=left>

<img src="https://raw.githubusercontent.com/jpass23/Categoria/main/Screenshots/PlayScreen.png" alt="drawing" width="200"/>

<img src="https://raw.githubusercontent.com/jpass23/Categoria/main/Screenshots/QuestionScreen.png" width="200"/>

<img src="https://raw.githubusercontent.com/jpass23/Categoria/main/Screenshots/EndScreen.png" width="200"/>

<img src="https://raw.githubusercontent.com/jpass23/Categoria/main/Screenshots/ScoreScreen.png" width="200"/>

</div>

## Description
The from the landing screen, the user can choose a category. This makes a request to the [Open Trivia Database API](https://opentdb.com/api_config.php) and once it returns, a play button appears. Clicking this brings the user to a tab view of 5 questions. Once they have all been answered, the last screen is a score of how well they did that round. 

Back on the landing screen, a button in the top right corner saves the cumulative scores in each category to the phone's local storage.

## Design Structure

This uses an object oriented programming structure along with a Model View View-Model (MVVM) design pattern.
