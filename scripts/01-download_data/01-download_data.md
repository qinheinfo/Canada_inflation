# Download Data from the Statistic Canada
Navigate to Statistics Canada's [https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810000501](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1810000413) data set. 


## Step 1: Customize data
The first step is to open the data set's full customization table. Below the "customize table" window, click "Add/Remove data". 

[![Step 1](Home/Downloads/Canada_Inflation/scripts/01-download_data/images/step1.png)](Canada_Inflation/scripts/01-download_data/images/step1.png)


## Step 2: Set the reference period
After selecting the desired products, click on the "Reference period" tab to select a date range. Although data is available for 2023, as of this paper's writing, the year is incomplete and thus will not me meaningful in a year-over-year analysis. Select the "from" date as "January 2017" and the "to" date as "December 2022". 

[![Step 2](https://raw.githubusercontent.com/seb646/groceries-and-inflation/main/guides/images/00-step_4.png)](https://raw.githubusercontent.com/seb646/groceries-and-inflation/main/guides/images/00-step_4.png)


## Step 3: Apply the changes
This is an important step as it refreshes the fetched data to reflect all of the changes we made in the previous step. 

Click the "Apply" button at the bottom of the "Customize table" window. 


## Step 4: Download the dataset
Once you've applied the changes, double check that the changes you made are reflected in the displayed data. After confirming, you may download the data set. 

Click the "Download options" button above the data and below the "Customize table" window. This will open a pop-up window, shown below, with various download options.

Select the first download option, titled "CSV Download as displayed". Ensure this is the very first option. 

[![Step 4](https://raw.githubusercontent.com/seb646/groceries-and-inflation/main/guides/images/00-step_6.png)](https://raw.githubusercontent.com/seb646/groceries-and-inflation/main/guides/images/00-step_6.png) 


## Step 5: Preview CSV file 
After downloading the CSV file, open it in your preferred CSV editor (like Microsoft Excel) and ensure it matches the example a below. If it does not, repeat this process until it does or open an issue. 

[![Step 5](https://raw.githubusercontent.com/seb646/groceries-and-inflation/main/guides/images/00-step_7.png)](https://raw.githubusercontent.com/seb646/groceries-and-inflation/main/guides/images/00-step_7.png) 

## Step 6: Move file into repository
After confirming the file displays accurate information, move it into the `inputs/data` folder. 
