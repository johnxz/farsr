#context("read in annual FARS data for multiple years")
setwd(system.file("extdata", "fars_data", package = "farsr"))


test_that("reading FARS data works as expected", {

    years <- c(2013:2015)
    l <- fars_read_years(years = years)
    expect_type( l, "list" )
    expect_s3_class( l[[1]], "tbl_df" )
    expect_output(str( fars_read_years(years = years)), "List of 3" )

})


test_that("reading FARS data produces a warning", {

    years <- c(1960, 2013)
    expect_warning( fars_read_years(years = years),
                    "invalid year: 1960" )

    l <- suppressWarnings( fars_read_years(years = years) )
    expect_output( str(l), "List of 2" )
    expect_null( l[[1]] )

})

