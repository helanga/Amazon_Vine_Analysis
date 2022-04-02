# Amazon_Vine_Analysis

## Overview of the analysis

Since your work with Jennifer on the SellBy project was so successful, you’ve been tasked with another, larger project: analyzing Amazon reviews written by members of the paid Amazon Vine program. The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. Companies like SellBy pay a small fee to Amazon and provide products to Amazon Vine members, who are then required to publish a review.

In this project, you’ll have access to approximately 50 datasets. Each one contains reviews of a specific product, from clothing apparel to wireless products. You’ll need to pick one of these datasets and use PySpark to perform the ETL process to extract the dataset, transform the data, connect to an AWS RDS instance, and load the transformed data into pgAdmin. Next, you’ll use PySpark, Pandas, or SQL to determine if there is any bias toward favorable reviews from Vine members in your dataset. Then, you’ll write a summary of the analysis for Jennifer to submit to the SellBy stakeholders.

### Dataset :https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Software_v1_00.tsv.gz


## Results

- How many Vine reviews and non-Vine reviews were there?
 
  - created a new table to rereive all the rows where the total_votes count is equal to or greater than 20 to pick reviews that are more likely to be helpful and to avoid having division by zero errors later on.

    
        ![total votes greater than 20](https://github.com/helanga/Amazon_Vine_Analysis/blob/main/images/totvotesgreat20.PNG)


   - Filter the new table created in above step to create table to retreive all the rows where the number of helpful_votes divided by total_votes is equal to or greater than 50%.


   - Filter the newly created table that retreives all the rows where a review written as part of the Vine program(paid),vine == Y


   - Repeat the above step  but this time retreive all the rows where the review was not part of the Vine program(paid), vine == N

- How many Vine reviews were 5 stars? How many non-Vine reviews were 5 stars?

  - Vine 5 star reviews


  - Non-Vine 5 star reviews

- What percentage of Vine reviews were 5 stars? What percentage of non-Vine reviews were 5 stars?

  - precentage of vine reviews with 5 stars

  - precentage of non-vine reviews with 5 star

## Summary

In your summary, state if there is any positivity bias for reviews in the Vine program. Use the results of your analysis to support your statement. Then, provide one additional analysis that you could do with the dataset to support your statement.
