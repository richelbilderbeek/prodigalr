test_that("uninstall absent Prodigal must throw", {
  expect_error(
    uninstall_prodigal(folder_name = "absent"),
    "Cannot uninstall absent Prodigal at"
  )
})
