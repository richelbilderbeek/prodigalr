#' Checks the installation of Prodigal.
#' Throws a helpful error message if incomplete,
#' else does nothing
#' @inheritParams default_params_doc
#' @return Nothing
#' @examples
#' library(testthat)
#'
#' if (1 == 2) {
#'   expect_silent(check_prodigal_installation())
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
check_prodigal_installation <- function(
  folder_name = get_default_prodigal_folder()
) {
  if (1 == 2) {
    # Download zip if needed
    zip_filename_path <- file.path(folder_name, "Prodigal_Package.zip")
    if (!file.exists(zip_filename_path)) {
      stop(
        "Cannot find Prodigal zip file at '", zip_filename_path, "'\n",
        "\n",
        "Tip: from R, run 'prodigal::install_prodigal()'\n"
      )
    }
    testthat::expect_true(file.exists(zip_filename_path))
  }
  # Extract zip if needed
  prodigal_folder <- file.path(folder_name, "Prodigal_Package")
  if (!dir.exists(prodigal_folder)) {
    stop(
      "Cannot find the Prodigal folder '", prodigal_folder, "'\n",
      "\n",
      "Tip: from R, run 'prodigal::install_prodigal()'\n"
    )
  }
  testthat::expect_true(dir.exists(prodigal_folder))

  # Does the binary exist?
  bin_filename <- file.path(prodigal_folder, "Prodigal.sh")
  if (!file.exists(bin_filename)) {
    stop(
      "Cannot find the Prodigal binary at '", bin_filename, "'\n",
      "\n",
      "Tip: from R, run 'prodigal::install_prodigal()'\n"
    )
  }
  testthat::expect_true(file.exists(bin_filename))

  # binary file is executable
  testthat::expect_true(
    file.info(bin_filename)$mode != as.octmode("0600")
  )
}
