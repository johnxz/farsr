#context("count FARS accidents by month and year")
setwd(system.file("extdata", "fars_data", package = "farsr"))


test_that("counting monthly total works as expected", {

    years <- 2013:2015
    monthly_totals <- fars_summarize_years(years = years)
    expect_type( monthly_totals, "list" )
    expect_s3_class( monthly_totals, "tbl" )
    expect_match( names(monthly_totals[1]), 'MONTH' )
    expect_equal( as.numeric(unlist(monthly_totals[1])), 1:12 )
    expect_equal( as.numeric(names(monthly_totals[-1])), years )


})


test_that("counting throws the expected warning", {

    years <- c(1960, 2013, 2014)
    expect_warning( fars_summarize_years(years = years),
                    "invalid year: 1960" )

})


test_that("counting halts and throws the expected error", {

    years <- c(1960, 2020)
    expect_error( suppressWarnings( fars_summarize_years(years = years) ),
                  "Must group by variables found in `.data`" )

})

