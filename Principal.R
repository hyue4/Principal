library(readr)
require(quantmod) 
require(PerformanceAnalytics) #MAIN PACKAGE USED#
require(xtable) #export of tables in Latex
require(corrplot) #correlation matrix with heat map
require(scatterplot3d) #3D scatterplot
require(factoextra) #fancy screeplots
require(tseries) #creation of syntetic portfolios returns
require(randomcoloR) #palette
require(bigmemory)
require(GA)
require(FRAPO)
# get libraries of routines – these packages need to be installed

suppressPackageStartupMessages(require (timeSeries))
suppressPackageStartupMessages(require (fPortfolio)) # may also require installing the package require(slam)
suppressPackageStartupMessages(require(quantmod))
suppressPackageStartupMessages(require(caTools))


#Read in data 
data1 <- read_csv("../GRP3_2010-2017_msci_acwi_r1k_sp_pmi.csv")

#We are only using the data since using the entirety of the data is not computationally possible on my desktop
if(FALSE){
  data1 <- stream_in(gzcon(data1))
  all.equal(data1, as.data.frame(data1))


#Make subset of the data

idx = sample(nrow(data1), 50000)
stock_sample = data1[idx,]

}
############################################################################################################
# cleaning ----


stock_sample = stock_sample[1:100,]
####fetch stocks' tickers into a list####
tickers<-c(stock_sample$TICKER)

##Explore Dataset
ncol(stock_sample)
str(stock_sample)
dim(stock_sample)
stock.return <- stock_sample[, 6:18]
stock.return.pca <- prcomp(stock.return,
                 center = TRUE,
                 scale. = TRUE) 
#Check missing values #data.table
write.csv(data.frame(col=colnames(data1), type = sapply(data1, class),
                     missing = sapply(data1, function(x) sum(is.na(x)| x=="" | x=="N/A"))/nrow(data1) * 100),
          file = "/Users/Huanhuan/Desktop/principal/sample.csv")
sum(is.na(data1$DEPS_INTEXP_G))

#Taking missing >50% out

data(StockIndex)
y <- StockIndex[, "SP500"]
cs <- capser(y, min = 100, max = 200)
head(cs)



#TEST IF I CAN CHANGE IT!
