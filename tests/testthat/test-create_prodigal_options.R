test_that("use", {
  expect_silent(create_prodigal_options(fasta_filename = tempfile()))
})
