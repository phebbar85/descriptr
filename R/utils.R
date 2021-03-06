formatter_freq <- function(x) {
    x %>%
      as.character() %>%
      format(width = 13, justify = "centre")
}


formatter <- function(x) {
    x %>%
      as.character() %>%
      format(width = 13, justify = "right")
}

percent <- function(x, y) {
    out <- round((x / y) * 100, 2)
}


formata <- function(x, round, width, justify = "centre") {
    x %>%
      round(round) %>%
      as.character() %>%
      format(width = width, justify = justify)
}

formatas <- function(x, round, width, justify = "centre") {
    return(format(x, width = width, justify = justify))
}

bin_size <- function(data, bins) {
    return((max(data, na.rm = TRUE) - min(data, na.rm = TRUE)) / bins)
}

intervals <- function(data, bins, na.rm = TRUE) {
    binsize <- bin_size(data, bins)
    bin <- bins - 1
    interval <- min(data)
    for (i in seq_len(bin)) {
        out <- interval[i] + binsize
        interval <- c(interval, out)
    }
    interval <- c(interval, max(data))
    return(interval)
}

freq <- function(data, bins, inta) {
    result <- c()
    for (i in seq_len(bins)) {
        k <- i + 1
        freq <- data >= inta[i] & data <= inta[k]
        out <- length(data[freq])
        result <- c(result, out)
    }
    return(result)
}

div_by <- function(x) {
    1 / x
}

standardize <- function(x, avg, stdev, p) {
    ((x - avg) / stdev) ^ p
}


sums <- function(x, q) {
    avg <- mean(x)
    stdev <- sd(x)
    result <- sum(sapply(x, standardize, avg, stdev, q))
    return(result)
}

md_helper <- function(x, y) {
    abs(x - y)
}


std_error <- function(x) {
    sd(x) / (length(x) ^ 0.5)
}

uss <- function(x, y) {
    (x - y) ^ 2
}

stat_uss <- function(x) {
    sum(x ^ 2)
}


formatl <- function(x) {
    x %>%
      format(nsmall = 2) %>%
      format(width = 20, justify = "left")
}

formatol <- function(x, w) {
    format(as.character(x), width = w, justify = "centre")
}


formatr <- function(x, w) {
    x %>%
      rounda() %>%
      format(nsmall = 2, width = w, justify = "right")
}


formatc <- function(x, w) {
    if (is.numeric(x)) {
        ret <- x %>%
                 round(2) %>%
                 as.character(x) %>%
                 format(width = w, justify = "centre")
    } else {
        ret <- x %>%
                 as.character(x) %>%
                 format(width = w, justify = "centre")
    }
    return(ret)
}


formatnc <- function(x, w) {
    x %>%
      round(2) %>%
      format(nsmall = 2) %>%
      format(width = w, justify = "centre")
}


formats <- function() {
    x <- rep("    ")
}

format_gap <- function(w) {
    x <- rep("", w)
}

return_pos <- function(data, number) {
    out <- c()
    for (i in seq_len(length(data))) {
        if (data[i] == number) {
            out <- c(out, i)
        }
    }
    return(out)
}

row_pct <- function(mat, tot) {
    rows <- dim(mat)[1]
    l <- length(tot)
    result <- c()
    for (i in seq_len(rows)) {
        diva <- mat[i, ] / tot[i]
        result <- rbind(result, diva)
    }
    rownames(result) <- NULL
    return(result)
}

col_pct <- function(mat, tot) {
    cols <- dim(mat)[2]
    l <- length(tot)
    result <- c()
    for (i in seq_len(cols)) {
        diva <- mat[, i] / tot[i]
        result <- cbind(result, diva)
    }
    colnames(result) <- NULL
    return(result)
}

rounda <- function(x) {
    round(x, 2)
}

l <- function(x) {
    x <- as.character(x)
    k <- grep("\\$", x)
    if (length(k) == 1) {
        temp <- strsplit(x, "\\$")
        out <- temp[[1]][2]
    } else {
        out <- x
    }
    return(out)
}

fround <- function(x) {
    format(round(x, 2), nsmall = 2)
}

pol_chi <- function(l1, l2, df, col) {

    x <- c(l1, seq(l1, l2, 0.01), l2)
    y <- c(0, dchisq(seq(l1, l2, 0.01), df), 0)
    polygon(x, y, col = col)

}

pol_f <- function(l1, l2, num_df, den_df, col) {

    x <- c(l1, seq(l1, l2, 0.01), l2)
    y <- c(0, df(seq(l1, l2, 0.01), num_df, den_df), 0)
    polygon(x, y, col = col)

}


pol_cord <- function(l1, l2, mean, sd, col) {

    x <- c(l1, seq(l1, l2, 0.01), l2)
    y <- c(0, dnorm(seq(l1, l2, 0.01), mean, sd), 0)
    polygon(x, y, col = col)

}


xaxp <- function(mean, el) {

    xl <- mean - el
    xu <- mean + el
    x <- seq(xl, xu, 0.01)
    return(x)
}


seqlp <- function(mean, sd, el) {
    if (el > 4) {
      lmin <- mean - (el * sd)
      lmax <- mean + (el * sd)
    } else {
      lmin <- mean - (4 * sd)
      lmax <- mean + (4 * sd)
    }

    l    <- seq(lmin, lmax, sd)
    return(l)

}


xmmp <- function(mean, sd, el) {
    if (el > 4) {
      xmin <- mean - (el * sd)
      xmax <- mean + (el * sd)
    } else {
      xmin <- mean - (4 * sd)
      xmax <- mean + (4 * sd)
    }

    out  <- c(xmin, xmax)
    return(out)
}


xax <- function(mean) {

    xl <- mean - 3
    xu <- mean + 3
    x <- seq(xl, xu, 0.01)
    return(x)
}


seql <- function(mean, sd) {

    lmin <- mean - (5 * sd)
    lmax <- mean + (5 * sd)
    l    <- seq(lmin, lmax, sd)
    return(l)

}

chiseql <- function(mean, sd) {

    lmin <- mean - (5 * sd)
    lmax <- mean + (5 * sd)
    l    <- seq(lmin, lmax, 0.01)
    return(l)

}


xmm <- function(mean, sd) {
    xmin <- mean - (5 * sd)
    xmax <- mean + (5 * sd)
    out  <- c(xmin, xmax)
    return(out)
}


seqln <- function(mean, sd) {

    lmin <- mean - 3 * sd
    lmax <- mean + 3 * sd
    l    <- seq(lmin, lmax, sd)
    return(l)

}


xmn <- function(mean, sd) {
    xmin <- mean - 3 * sd
    xmax <- mean + 3 * sd
    out  <- c(xmin, xmax)
    return(out)
}


pol_t <- function(l1, l2, df, col) {

    x <- c(l1, seq(l1, l2, 0.01), l2)
    y <- c(0, dt(seq(l1, l2, 0.01), df), 0)
    polygon(x, y, col = col)

}


# ss <- function(x) {
#     return(x ^ 2)
# }
#
# fl <- function(x, w) {
#     x <- as.character(x)
#     ret <- format(x, width = w, justify = "left")
#     return(ret)
# }
#
# fc <- function(x, w) {
#     x <- as.character(x)
#     ret <- format(x, width = w, justify = "centre")
#     return(ret)
# }
# formatrc <- function(x, w) {
#     x <- as.character(x)
#     ret <- format(x, width = w, justify = "right")
#     return(ret)
# }
