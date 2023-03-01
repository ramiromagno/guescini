library(tidyverse)
library(here)

# Get column names
IgG_inhibition_header <-
  readxl::read_excel(here::here("data-raw/12859_2008_2311_MOESM5_ESM.xls"),
                     range = "Fluorescence Data!A2:K2",
                     col_names = FALSE,
                     .name_repair = "unique_quiet") %>%
  unlist()

# IgG concentrations
IgG_concentrations <-
  stringr::str_replace(IgG_inhibition_header[-1], "NO IgG", "IgG 0 ug/ml") %>%
  stringr::str_extract(r"{\d(\.\d+)?}") %>%
  as.double()

# Fluorescence data
IgG_inhibition01 <-
  readxl::read_excel(here::here("data-raw/12859_2008_2311_MOESM5_ESM.xls"),
                     range = "Fluorescence Data!A3:K42",
                     col_names = c("cycle", seq_len(length(IgG_concentrations))),
                     )

n_cycles <- nrow(IgG_inhibition01)

IgG_inhibition <-
  IgG_inhibition01 %>%
  tidyr::pivot_longer(cols = -1L,
                      names_to = "IgG_conc",
                      values_to = "fluor") %>%
  dplyr::mutate(replicate = rep(rep(1:2, 5), n_cycles)) %>%
  dplyr::mutate(IgG_conc = IgG_concentrations[as.integer(IgG_conc)]) %>%
  dplyr::arrange(IgG_conc, replicate, cycle) %>%
  dplyr::transmute(
    plate = factor(NA_character_),
    well = factor(NA_character_),
    dye = factor("SYBR"),
    target = factor("ND1/ND2"),
    sample_type = factor("std"),
    replicate = replicate,
    copies = 41700000L, # Value obtained from 12859_2008_2311_MOESM5_ESM.xls, sheet 2, cell B2
                        # This value is in contradiction with the value reported
                        # in original paper, section
                        # "Experimental system 2: Real-time
                        # PCR quantification in the presence
                        # of the inhibitor IgG": "4.05 x 10^6 DNA molecules"
    IgG_conc = IgG_conc,
    cycle = as.integer(cycle),
    fluor = fluor
  )

usethis::use_data(IgG_inhibition, overwrite = TRUE)
