#' Runs Prodigal and returns the parsed results
#' @inheritParams default_params_doc
#' @return full path to the files created
#' @author Richèl J.C. Bilderbeek
#' @examples
#' library(testthat)
#'
#' if (1 == 2 && is_prodigal_installed()) {
#'   fasta_filename <- system.file(
#'     "extdata", "prodigal.fasta", package = "prodigal"
#'   )
#'   locatome <- run_prodigal(fasta_filename)
#'   cat(locatome, sep = "\n")
#' }
#' @seealso use \link{create_prodigal_files} to
#'   only create the Prodigal output files
#' @export
run_prodigal <- function(
  fasta_filename,
  folder_name = get_default_prodigal_folder(),
  temp_folder_name = tempfile(pattern = "pureseqt_")
) {
  prodigalr::check_prodigal_installation(folder_name = folder_name)

  filenames <- prodigalr::create_prodigal_files(
    fasta_filename = fasta_filename,
    folder_name = folder_name,
    temp_folder_name = temp_folder_name
  )
  # [1] "/tmp/RtmpsfA4tg/pureseqt_838661d1571/prodigal.fasta"
  # [2] "/tmp/RtmpsfA4tg/pureseqt_838661d1571/prodigal.fasta_raw"
  # [3] "/tmp/RtmpsfA4tg/pureseqt_838661d1571/prodigal.pred_mode"
  # [4] "/tmp/RtmpsfA4tg/pureseqt_838661d1571/prodigal.prob"
  # [5] "/tmp/RtmpsfA4tg/pureseqt_838661d1571/prodigal.top"
  #readLines(fasta_filename)
  text_1 <- readLines(filenames[1])
  text_2 <- readLines(filenames[2])
  text_3 <- readLines(filenames[3])
  text_4 <- readLines(filenames[4])
  text_5 <- readLines(filenames[5])
  locatome <- readLines(filenames[5])
  readLines(filenames[5])
}
