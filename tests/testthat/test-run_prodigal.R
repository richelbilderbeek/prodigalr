test_that("use", {
  skip("WIP")
  if (!is_prodigal_installed()) return()

  prodigal_options <- create_prodigal_options(
    fasta_filename = system.file(
      "extdata", "covid19.fasta", package = "prodigalr"
    )
  )
  expect_true(are_prodigal_options(prodigal_options))
  prodigal_results <- run_prodigal(prodigal_options)
  expect_silent(check_prodigal_results(prodigal_results))
})
