% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ngramrr.R
\name{ngramrr}
\alias{ngramrr}
\title{General purpose n-gram tokenizer}
\usage{
ngramrr(x, char = FALSE, ngmin = 1, ngmax = 2, rmEOL = TRUE)
}
\arguments{
\item{x}{input string.}

\item{char}{logical, using character n-gram. char = FALSE denotes word n-gram.}

\item{ngmin}{integer, minimun order of n-gram}

\item{ngmax}{integer, maximun order of n-gram}

\item{rmEOL}{logical, remove ngrams wih EOL character}
}
\value{
vector of n-grams
}
\description{
A non-Java based n-gram tokenizer to be used with the tm package. Support both character and word n-gram.
}
\examples{
require(tm)

nirvana <- c("hello hello hello how low", "hello hello hello how low",
"hello hello hello how low", "hello hello hello",
"with the lights out", "it's less dangerous", "here we are now", "entertain us",
"i feel stupid", "and contagious", "here we are now", "entertain us",
"a mulatto", "an albino", "a mosquito", "my libido", "yeah", "hey yay")

ngramrr(nirvana[1], ngmax = 3)
ngramrr(nirvana[1], ngmax = 3, char = TRUE)
nirvanacor <- Corpus(VectorSource(nirvana))
TermDocumentMatrix(nirvanacor, control = list(tokenize = function(x) ngramrr(x, ngmax =3)))

# Character ngram

TermDocumentMatrix(nirvanacor, control = list(tokenize =
function(x) ngramrr(x, char = TRUE, ngmax =3), wordLengths = c(1, Inf)))
}

