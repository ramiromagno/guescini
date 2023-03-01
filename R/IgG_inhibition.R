#' IgG inhibition
#'
#' @description
#' This data set is for a set of quantitative real-time PCR runs that were
#' performed in the presence of an optimal amplification reaction mix added with
#' serial dilutions of IgG (0.0, 0.25, 0.50, 1.0, and 2.0 μg/ml) thus acting as
#' the inhibitory agent. There are two replicates for each concentration of IgG.
#' The concentration of the amplicon ND1/ND2 is 41,700,000 copies.
#' Please read the Methods section of Guescini et al. (2008) for more details.
#'
#' @format A [tibble][tibble::tibble-package] with 400 rows and 10 variables:
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
#' \item{`IgG_conc`}{IgG concentration in μg/ml.}
#' \item{`copies`}{Standard copy number.}
#' \item{`cycle`}{PCR cycle.}
#' \item{`fluor`}{Raw fluorescence values.}
#' }
#'
#' @examples
#' IgG_inhibition
#'
#' @source \doi{10.1186/1471-2105-9-326}
#' @name IgG_inhibition
#' @keywords datasets
NULL
