#' Create the Prodigal options
#' @inheritParams default_params_doc
#' @return the Prodigal options
#' @author Richèl J.C. Bilderbeek
#' @export
create_prodigal_options <- function(
  fasta_filename,
  folder_name = get_default_prodigal_folder(),
  output_filename = tempfile("output_"),
  trans_filename = tempfile("trans_"),
  nuc_filename = tempfile("nuc_"),
  start_filename = tempfile("start_")
) {
  list(
    fasta_filename = fasta_filename,
    folder_name = folder_name,
    output_filename = output_filename,
    trans_filename = trans_filename,
    nuc_filename = nuc_filename,
    start_filename = start_filename
  )
}
