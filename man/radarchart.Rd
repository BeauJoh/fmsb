\name{radarchart}
\alias{radarchart}
\title{Drawing radar chart (a.k.a. spider plot)}
\description{
 Drawing the radar chart with several lines from a data frame, 
 which must be composed of more than 3 variables as axes and the 
 rows indicate cases as series.
}
\usage{
 radarchart(df, axistype, seg, pty, pcol, plty, plwd, 
 cglty, cglwd, cglcol, axislabcol, title, maxmin, ...)
}
\arguments{
 \item{df}{The data frame to be used to draw radarchart.  If maxmin is TRUE, this must include maximum values as row 1 and minimum values as row 2 for each variables, and actual data should be given as row 3 and lower rows.  The number of columns (variables) must be more than 2.}
 \item{axistype}{The type of axes, specified by any of 0:3.  0 means no axis label.  1 means center axis label only.  2 means around-the-chart label only.  3 means both center and around-the-chart labels (default 0).}
 \item{seg}{The number of segments for each axis (default 4).}
 \item{pty}{A vector to specify point symbol: Default 16 (closed circle), if you don't plot data points, it should be 32.  This is repeatedly used for data series.}
 \item{pcol}{A vector of color codes for plot data: Default 1:8, which are repeatedly used.}
 \item{plty}{A vector of line types for plot data: Default 1:6, which are repeatedly used.}
 \item{plwd}{A vector of line widths for plot data: Default 1, which is repeatedly used.}
 \item{cglty}{Line type for radar grids: Default 3, which means dotted line.}
 \item{cglwd}{Line width for radar grids: Default 1, which means thinnest line.}
 \item{cglcol}{Line color for radar grids: Default "navy"}
 \item{axislabcol}{Color of axis label and numbers: Default "blue"}
 \item{title}{if any, title should be typed.}
 \item{maxmin}{Logical.  If true, data frame includes possible maximum values as row 1 and possible minimum values as row 2.  If false, the maximum and minimum values for each axis will be calculated as actual maximum and minimum of the data.  Default TRUE.}
 \item{...}{Miscellaneous arguments to be given for plot.default().}
}
\value{
 No value is returned.
}
\author{Minato Nakazawa \email{minato-nakazawa@umin.net} \url{http://phi.med.gunma-u.ac.jp/}}
\examples{
# Data must be given as the data frame, where the first cases show maximum.
maxmin <- data.frame(
 total=c(5,1),
 phys=c(15,3),
 psycho=c(3,0),
 social=c(5,1),
 env=c(5,1))
# data for radarchart function version 1 series, minimum value must be omitted from above.
RNGkind("Mersenne-Twister")
set.seed(123)
dat <- data.frame(
 total=runif(3,1,5),
 phys=rnorm(3,10,2),
 psycho=c(0.5,NA,3),
 social=runif(3,1,5),
 env=c(5,2.5,4))
dat <- rbind(maxmin,dat)
op <- par(mar=c(1,2,2,1),mfrow=c(2,2))
radarchart(dat,axistype=1,seg=5,plty=1,title="(axis=1, 5 segments)")
radarchart(dat,axistype=2,pcol=topo.colors(3),plty=1,title="(topo.colors, axis=2)")
radarchart(dat,axistype=3,pty=32,plty=1,axislabcol="grey",title="(no points, axis=3)")
radarchart(dat,axistype=0,plwd=1:5,pcol=1,title="(use lty and lwd but b/w, axis=0)")
par(op)
}