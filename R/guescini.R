#' qPCR data set by Guescini et al. (2008)
#'
#' @description
#' Each data set comprises a seven-point, ten-fold dilution series, repeated in
#' 12 independent runs targeting an amplicon for the MT-ND1 gene. A slight
#' amplification inhibition in the quantitative real-time PCR experiments was
#' obtained by using two systems: decreasing the amplification mix
#' (`amp_mix_perc`) used in the reaction and adding varying amounts of IgG, a
#' known PCR inhibitor. Please read the Methods section of Guescini et al.
#' (2008) for more details.
#'
#' @format A [tibble][tibble::tibble-package] with 21,000 rows and 11 variables:
#' \describe{
#' \item{`plate`}{Plate identifier.}
#' \item{`well`}{Well identifier. Values are always `NA` (not available). This
#' variable is kept nevertheless to be coherent with other data sets from other
#' similar R data packages.}
#' \item{`dye`}{The type of dye used. In this data set the values are always
#' `"SYBR"`, meaning SYBR Green I master mix (Roche).}
#' \item{`target`}{Target identifier: the amplicon used, `"MT_ND1"`.}
#' \item{`sample_type`}{Sample type (all curves are standards, i.e. `"std"`).}
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
