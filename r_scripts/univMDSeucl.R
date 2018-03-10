

computeIntersections <- function(X, ii, D) {
    k <- nrow(X)
    nl <- ncol(X)
    V <- X - matlab::repmat(t(t(as.matrix(X[, ii]))), 1, nl)
    Daux <- t(t(sqrt((apply(V * V, 2, sum)))))

    Q <- as.matrix(D[ii, ])/Daux  #mirar el operador

    Z <- X - V * matlab::repmat(Q, k, 1)
    Z <- Z[, -ii]
    return(Z)
}


randomMatrix <- function(NRows, NCols) {
    myMat <- matrix(runif(NCols * NRows), ncol = NCols)
    return(myMat)
}

distAllPairsL2 <- function(X) {
    q <- t(X) %*% X
    n <- ncol(q)
    normx <- matlab::repmat(as.matrix(apply(t(X)^2, 1, sum)), 1, n)
    K <- Re(sqrtm(q * (-2) + normx + t(normx)))
    K <- K - (diag(diag(K)))
    return(K)
}


univMDSeucl <- function(D, k) {
    iteraciones <- 100
    tol <- 1e-09
    nl <- nrow(D)
    X <- t(randomMatrix(nl, k))

    Dk <- distAllPairsL2(X)
    c <- sum((D - Dk)^2)
    cant <- 0

    for (iter in 1:iteraciones) {
        for (ii in 1:nl) {
            for (it in 1:floor(sqrt(iter))) {
                print(iter)
                Z <- computeIntersections(X, ii, D)
                a <- t(t(apply(Z, 2, mean)))
                x1 <- cbind(t(t(X[, 1:ii - 1])), a)
                if ((ii + 1) <= nl) {

                  X <- cbind(x1, t(t(X[, (ii + 1):nl])))

                } else {
                  X <- x1
                }

            }
        }


        Dk <- distAllPairsL2(X)
        cant <- c
        c <- sum((D - Dk)^2)
        if (abs(c - cant) < tol) {
            break
        }
    }
    return(t(X))
}

needs(igraph)
needs(geomorph)
needs(MASS)
needs(jsonlite)
needs(matlab)
attach(input[[1]])


result <- univMDSeucl(data,dim)
json <- list(data = result)
toJSON(json, pretty = TRUE, auto_unbox = TRUE)