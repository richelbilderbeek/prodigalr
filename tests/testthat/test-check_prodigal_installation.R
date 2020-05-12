test_that("use", {
  if (!is_prodigal_installed()) return()

  # Locally, Prodigal is expected to be installed
  expect_silent(check_prodigal_installation())

  expect_error(
    check_prodigal_installation(folder_name = "nonsense"),
    "Cannot find the Prodigal folder"
  )

  # Only bin
  folder_name <- tempdir()
  dir.create(file.path(folder_name, "Prodigal"), showWarnings =  FALSE, recursive = TRUE)
  expect_error(
    check_prodigal_installation(folder_name = folder_name),
    "Cannot find the Prodigal binary"
  )
})
