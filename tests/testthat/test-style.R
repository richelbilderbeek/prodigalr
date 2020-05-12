test_that("Package style", {
  if (!is_on_travis()) return()
  lintr::expect_lint_free()
})
