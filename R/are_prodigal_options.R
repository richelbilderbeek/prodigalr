#' Determine if the Prodigal options are valid
#' @inheritParams default_params_doc
#' @export
are_prodigal_options <- function(prodigal_options) {
  if (!is.list(prodigal_options)) return(FALSE)
  expected_names <- c(
    "fasta_filename",
    "folder_name",
    "output_filename",
    "trans_filename",
    "nuc_filename"
  )
  if (!all(expected_names %in% names(prodigal_options))) {
    return(FALSE)
  }
  TRUE
}
