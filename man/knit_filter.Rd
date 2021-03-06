% Please edit documentation in R/utils-vignettes.R
\name{knit_filter}
\alias{knit_filter}
\title{Spell check filter for source documents}
\usage{
knit_filter(ifile, encoding = "unknown")
}
\arguments{
\item{ifile}{the filename of the source document}

\item{encoding}{the file encoding}
}
\value{
A chracter vector of the file content, excluding code chunks and
  inline expressions.
}
\description{
When performing spell checking on source documents, we may need to skip R
code chunks and inline R expressions, because many R functions and symbols
are likely to be identified as typos. This function is designed for the
\code{filter} argument of \code{\link{aspell}()} to filter out code chunks
and inline expressions.
}
\examples{
library(knitr)
knitr_example = function(...) system.file("examples", ..., package = "knitr")
\donttest{
if (Sys.which("aspell") != "") {
    # -t means the TeX mode
    utils::aspell(knitr_example("knitr-minimal.Rnw"), knit_filter, control = "-t")
    
    # -H is the HTML mode
    utils::aspell(knitr_example("knitr-minimal.Rmd"), knit_filter, control = "-H -t")
}
}
}
