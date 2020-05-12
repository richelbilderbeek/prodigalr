test_that("use", {
  if (!is_prodigal_installed()) return()
  fasta_filename <- system.file(
    "extdata", "covid19.fasta", package = "prodigalr"
  )
  readLines(fasta_filename)
  filenames <- create_prodigal_files(fasta_filename)
  expect_equal(4, length(filenames))
  expect_true(all(file.exists((filenames))))
})
