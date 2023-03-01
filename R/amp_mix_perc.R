#' Amplification mix percentage
#'
#' @description
#' This data set is for a set of quantitative real-time PCR runs that targets
#' the amplification of a sequence of the MT-ND1 gene, for a seven-point,
#' ten-fold a serial dilution starting at 3.14 x 10^7 copies of DNA molecules.
#' In addition, a range of amplification mix quantities ranging from 60% to 100%
#' are also performed. This results in 5 serial dilutions, one for each
#' amplification mix quantity (0.6, 0.7, 0.8, 0.9 and 1.0).
#'  Please read the Methods section of Guescini et al.
#' (2008) for more details.
#'
#' @format A [tibble][tibble::tibble-package] with 21,000 rows and 12 variables:
#' \describe{
#' \item{`plate`}{Plate identifier.}
#' \item{`well`}{Well identifier. Values are always `NA` (not available). This
#' variable is kept nevertheless to be coherent with other data sets from other
#' similar R data packages.}
#' \item{`dye`}{The type of dye used. In this data set the values are always
#' `"SYBR"`, meaning SYBR Green I master mix (Roche).}
#' \item{`target`}{Target identifier: the amplicon used, `"MT_ND1"`.}
#' \item{`sample_type`}{Sample type (all curves are standards, i.e. `"std"`).}
#' \item{`run`}{This variable discriminates amplification curves within the
#' group defined by `amp_mix_perc` and `copies`. Range: `1` thru `12`.}
#' \item{`replicate`}{Replicate identifier: 1 thru 3.}
#' \item{`amp_mix_perc`}{Amplification mix percentage.}
#' \item{`copies`}{Standard copy number.}
#' \item{`dilution`}{Dilution factor. Higher number means greater dilution.}
#' \item{`cycle`}{PCR cycle.}
#' \item{`fluor`}{Raw fluorescence values.}
#' }
#'
#' @examples
#' amp_mix_perc
#'
#' @source \doi{10.1186/1471-2105-9-326}
#' @name amp_mix_perc
#' @keywords datasets
NULL
