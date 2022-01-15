#Libraries
import pandas as pd
import yfinance as yf

asset = 'IVV' #Defining the security 
security = yf.Ticker(asset).history(period="max") #Getting the data from Yahoo Finance
returns = security['Close'].pct_change().dropna() #Calculating the returns
returns.to_excel(asset + '.xlsx') #Saving it in a Excel File
