test_that("use", {
  prodigal_options <- create_prodigal_options(
    fasta_filename = system.file(
      "extdata", "covid19.fasta", package = "prodigalr"
    )
  )
  expect_true(are_prodigal_options(prodigal_options))
  expect_silent(create_prodigal_files(prodigal_options))
  expect_true(file.exists(prodigal_options$output_filename))
  expect_true(file.exists(prodigal_options$trans_filename))
  expect_true(file.exists(prodigal_options$nuc_filename))
  expect_true(file.exists(prodigal_options$start_filename))
})
