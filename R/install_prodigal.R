#' Install Prodigal to a local folder
#' @inheritParams default_params_doc
#' @examples
#' library(testthat)
#'
#' if (1 == 2) {
#'   install_prodigal()
#'   expect_true(is_prodigal_installed())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
install_prodigal <- function(
  folder_name = get_default_prodigal_folder()
) {
  if (is_prodigal_installed()) {
    stop("Prodigalis already installed")
  }

  # Extract zip if needed
  prodigal_folder <- file.path(folder_name, "Prodigal")
  if (!dir.exists(prodigal_folder)) {
    curwd <- getwd()
    setwd(folder_name)
    system2(
      command = "git",
      args = c(
        "clone",
        "https://github.com/hyattpd/Prodigal.git"
      )
    )
    setwd(curwd)
  }
  testthat::expect_true(dir.exists(prodigal_folder))

  # Does the binary exist?
  bin_filename <- file.path(prodigal_folder, "prodigal")
  if (!file.exists(bin_filename)) {
    #make_filename <- file.path(prodigal_folder, "Makefile")
    #testthat::expect_true(file.exists(make_filename))
    cmd <- paste0("cd ", prodigal_folder, " && make")
    system(cmd)
  }
  testthat::expect_true(file.exists(bin_filename))

  # binary file is executable
  testthat::expect_true(
    file.info(bin_filename)$mode != as.octmode("0600")
  )
}
