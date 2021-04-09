#context("plot geographical mapping of FARS crashes")
setwd(system.file("extdata", "fars_data", package = "farsr"))


test_that("plotting works as expected and does not produce error", {

    expect_failure( expect_error( fars_map_state(state.num=36, year=2013 )))
    expect_type( fars_map_state(state.num=36, year=2013), "NULL" )
    expect_invisible( fars_map_state(state.num=36, year=2013) )

})


test_that("plotting fails and throws the expected errors", {

    expect_error( fars_map_state(state.num=36, year=2021),
                  "file 'accident_2021.csv.bz2' does not exist" )
    expect_error( fars_map_state(state.num=90, year=2013),
                  "invalid STATE number: 90" )

})
