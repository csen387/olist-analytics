# Olist E-commerce Analytics

End-to-end analysis of the Brazilian Olist e-commerce dataset (about 100k orders, 2016-2018): data cleaning, SQL analysis and RFM customer segmentation.

**Dataset:** https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

**Tools:** Python (pandas), SQLite, SQL, Jupyter

## Files
- `notebooks/01_load_and_clean.ipynb`: load CSVs into SQLite, clean dates, missing values, duplicates, categories
- `notebooks/02_sql_analysis.ipynb`: business questions in SQL, plus RFM segmentation
- `sql/`: one SQL query per business question

## Key findings
1. **Top categories:** health_beauty (R$1.26M, 9.3%), watches_gifts (8.9%), bed_bath_table (7.7%).
2. **States:** SP has 40,501 delivered orders (about 42%). The northeast has the worst delays: AL 21.4% late, MA 17.4%, SE 15.2%. RJ is 12.1% late vs SP 4.5%.
3. **Repeat-customer rate:** 3.04% (2,888 of 94,990 customers).
4. **Payment types:** credit card 73.9%, boleto 19.0%, voucher 5.6%, debit card 1.5%.
5. **Reviews vs late delivery:** late orders average 2.27 stars vs 4.29 on time. Correlation between late delivery and review score is -0.31. This is correlation, not proof of cause.

## RFM segmentation
- Only 1,241 customers (1.3%) are recent repeat buyers.
- About half of revenue (R$8.8M) comes from one-time big spenders.
- The 13,965 "at risk big spenders" (R$4.3M) are the best win-back target.

## How to reproduce
1. Download the dataset from Kaggle into `data/raw/`
2. Run `01_load_and_clean.ipynb`, then `02_sql_analysis.ipynb`
