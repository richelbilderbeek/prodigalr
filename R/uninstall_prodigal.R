#' Uninstall Prodigal
#' @param folder_name name of the folder
#'   where the Prodigal files are installed.
#'   The name of the Prodigal binary file will be at
#'   \code{[folder_name]/Prodigal_Package}
#' @author Richèl J.C. Bilderbeek
#' @export
uninstall_prodigal <- function(
  folder_name = get_default_prodigal_folder()
) {
  if (!is_prodigal_installed(folder_name = folder_name)
  ) {
    stop("Cannot uninstall absent Prodigal at folder '", folder_name, "'")
  }
  # Remove extracted folder
  prodigal_folder <- file.path(folder_name, "Prodigal")
  if (dir.exists(prodigal_folder)) {
    unlink(prodigal_folder, recursive = TRUE, force = TRUE)
  }
  testthat::expect_false(dir.exists(prodigal_folder))
}
