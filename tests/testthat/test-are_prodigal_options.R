test_that("use", {
  prodigal_options <- create_prodigal_options(
    fasta_filename = tempfile()
  )
  expect_true(are_prodigal_options(prodigal_options))

  expect_false(are_prodigal_options("nonsense"))
  expect_false(are_prodigal_options(""))
  expect_false(are_prodigal_options(NULL))
  expect_false(are_prodigal_options(NA))
  expect_false(are_prodigal_options(Inf))
  expect_false(are_prodigal_options(3.14))
  expect_false(are_prodigal_options(c(options, options)))
})
