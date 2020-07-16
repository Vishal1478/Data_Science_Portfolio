# Exploration of Air Quality Data

## Objective:
Finding out how different parameters like Ozone, Wind, Solar effect Temperature

## About Data:
**Ozone**: Mean Ozone in parts per billion from 1300 to 1500 hours at Roosevelt Island.<br><br>
**Solar**: Solar radiation in Langleys in the frequency band 4000-7700 Angstroms from 0800 to 1200 hours at Central Park.<br><br>
**Wind**: Avergae wind speed in miles per hour at 0700 and 1000 hours at LaGuardia Airport.<br><br>
**Temp**: Maximum daily temperature in degrees Fahrenheit at LaGuardia Airport.

## Aim:
To create an interactive dashboard in Tableau

## Procedure:
1.Creating histogram for different paramters and seeing how they are distributed
2.Plotting scatter plot of temperature along with different parameters and fitting trend line
3.Creating automated dashboard

## Analysis:
- Ozone attribute is right skewwed in the histogram
- Parameters like Solar and Temperature are left skewwed
- Gaussian distribution is seen in the wind parametter

- Positive Correlation of 0.69 is seen between Ozone and Temperature with R2 value of 0.48
- Decent Positive Correlation of 0.27 is seen between Solar and Temperature with R2 value of 0.07
- Negative Correlation of -0.4 is seen between Wind and Temperature with R2 value of 0.2

## Summary:
- Ozone seems to be a strong predictor of temperature<br><br>
- Wind and Solar have decent correlation but are not so strong predictor of Temperature

## Output:
![](https://github.com/Vishal1478/Data_Science_Portfolio/blob/master/Tableau/Air_Quality/Air_Quality_Dashbord.png)
