test_that("use", {
  if (!is_prodigal_installed()) return()

  fasta_filename <- system.file("extdata", "prodigal.fasta", package = "prodigal")
  readLines(fasta_filename)
  text <- run_prodigal(fasta_filename)
  expect_equal(2, length(text))
})
