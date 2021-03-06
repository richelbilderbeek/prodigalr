#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param download_url the URL to download Prodigal from
#' @param fasta_filename path to a FASTA file
#' @param folder_name superfolder of Prodigal.
#'   The superfolder's name is \code{/home/[user_name]/.local/share}
#'   by default, as can be obtained by
#'   \link{get_default_prodigal_folder}
#' @param locatome text similar to a FASTA file, with protein names
#'   and the locations of its amino acids
#' @param protein_sequence a protein sequence
#' @param protein_sequences one or more protein sequences
#' @param prodigal_filename filename to write the Prodigal results to
#' @param prodigal_result the result of a Prodigal run
#' @param temp_folder_name path of a temporary folder.
#'   The folder does not need to exist.
#'   Files that are out in this folder are not automatically
#'   deleted, which is not a problem, as the default
#'   path given by \link{tempdir} is automatically cleaned
#'   by the operating system
#' @param verbose set to TRUE for more output
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  download_url,
  fasta_filename,
  folder_name,
  locatome,
  protein_sequence,
  protein_sequences,
  prodigal_filename,
  prodigal_result,
  temp_folder_name,
  verbose
) {
  # Nothing
}
