#' Create the Prodigal output files, by running Prodigal
#' @inheritParams default_params_doc
#' @return nothing, will create the files as specified in
#'   the \code{prodigal_options}
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(testthat)
#'
#' if (is_prodigal_installed()) {
#'   prodigal_options <- create_prodigal_options(
#'     fasta_filename = system.file(
#'       "extdata", "covid19.fasta", package = "prodigalr"
#'     )
#'   )
#'   expect_true(are_prodigal_options(prodigal_options))
#'   expect_silent(create_prodigal_files(prodigal_options))
#'   expect_true(file.exists(prodigal_options$output_filename))
#'   expect_true(file.exists(prodigal_options$trans_filename))
#'   expect_true(file.exists(prodigal_options$nuc_filename))
#'   expect_true(file.exists(prodigal_options$start_filename))
#' }
#' @seealso use \link{run_prodigal} to received
#'   also the parsed output
#' @export
create_prodigal_files <- function(
  prodigal_options
) {
  if (!file.exists(prodigal_options$fasta_filename)) {
    stop(
      "'prodigal_options$fasta_filename' not found ",
      "at path '", prodigal_options$fasta_filename, "'"
    )
  }
  prodigalr::check_prodigal_installation(
    folder_name = prodigal_options$folder_name
  )
  prodigal_folder <- file.path(prodigal_options$folder_name, "Prodigal")
  testthat::expect_true(dir.exists(prodigal_folder))
  bin_filename <- file.path(prodigal_folder, "prodigal")
  testthat::expect_true(file.exists(bin_filename))

  dir.create(dirname(prodigal_options$output_filename), showWarnings = FALSE, recursive = TRUE)
  dir.create(dirname(prodigal_options$trans_filename), showWarnings = FALSE, recursive = TRUE)
  dir.create(dirname(prodigal_options$start_filename), showWarnings = FALSE, recursive = TRUE)
  dir.create(dirname(prodigal_options$nuc_filename), showWarnings = FALSE, recursive = TRUE)

  error_code <- system2(
    command = bin_filename,
    args = c(
      "-i", prodigal_options$fasta_filename,
      "-a", prodigal_options$trans_filename,
      "-d", prodigal_options$nuc_filename,
      "-o", prodigal_options$output_filename,
      "-s", prodigal_options$start_filename
    ),
    stdout = FALSE,
    stderr = FALSE
  )

  if (error_code != 0) {
    stop("Warning or error: '", error_code, "'")
  }
}
