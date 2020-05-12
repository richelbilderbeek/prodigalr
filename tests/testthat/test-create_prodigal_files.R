test_that("use", {
  skip("Not now")
  if (!is_prodigal_installed()) return()
  fasta_filename <- system.file(
    "extdata", "prodigal.fasta", package = "prodigalr"
  )
  readLines(fasta_filename)
  filenames <- create_prodigal_files(fasta_filename)
  expect_equal(5, length(filenames))
  expect_true(all(file.exists((filenames))))
})
