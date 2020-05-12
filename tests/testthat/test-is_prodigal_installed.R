test_that("use", {
  if (!is_on_travis()) return()

  if (is_prodigal_installed()) {
    uninstall_prodigal()
    expect_false(is_prodigal_installed())
    install_prodigal()
    expect_true(is_prodigal_installed())
  } else  {
    expect_true(!is_prodigal_installed())
    install_prodigal()
    expect_true(is_prodigal_installed())
    uninstall_prodigal()
    expect_false(is_prodigal_installed())
  }

})

test_that("re-install must fails", {
  if (!is_prodigal_installed()) return()

  expect_error(
    install_prodigal(),
    "Prodigalis already installed"
  )
})
