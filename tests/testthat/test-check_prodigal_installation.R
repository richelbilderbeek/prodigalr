test_that("use", {
  skip("WIP")
  if (!is_prodigal_installed()) return()

  # Locally, Prodigal is expected to be installed
  expect_silent(check_prodigal_installation())

  if (!is_on_travis()) return()

  expect_error(
    check_prodigal_installation(folder_name = "nonsense"),
    "Prodigal binary not found at location '"
  )

  # Only bin
  folder_name <- tempdir()
  install_prodigal_bin(folder_name = folder_name)
  expect_error(
    check_prodigal_installation(folder_name = folder_name),
    "Prodigal not set up completely"
  )
})
