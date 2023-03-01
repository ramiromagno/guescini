library(tidyverse)
library(here)

header1 <-
  readxl::read_xls(
    here::here("data-raw/12859_2008_2311_MOESM1_ESM.xls"),
    range = "Runs!A3:IG5",
    col_names = FALSE,
    .name_repair = "unique_quiet"
  ) %>%
  t() %>%
  `colnames<-`(.[1,]) %>%
  .[-1,] %>%
  as_tibble(.name_repair = "unique") %>%
  tidyr::fill(1:2) %>%
  dplyr::mutate(
    `Input Molecular Number` = as.integer(`Input Molecular Number`),
    `Amplification mix percentage` = as.double(`Amplification mix percentage`)
  )

header2 <-
  readxl::read_xls(
    here::here("data-raw/12859_2008_2311_MOESM1_ESM.xls"),
    range = "Runs!A58:FY60",
    col_names = FALSE,
    .name_repair = "unique_quiet"
  ) %>%
  t() %>%
  `colnames<-`(.[1,]) %>%
  .[-1,] %>%
  as_tibble(.name_repair = "unique") %>%
  tidyr::fill(1:2) %>%
  dplyr::mutate(
    `Input Molecular Number` = as.integer(`Input Molecular Number`),
    `Amplification mix percentage` = as.double(`Amplification mix percentage`)
  )

metadata_cols <- dplyr::bind_rows(header1, header2) %>%
  dplyr::transmute(
    run = factor(as.integer(sub("Run ", "", Runs))),
    amp_mix_perc = `Amplification mix percentage`,
    copies = `Input Molecular Number`)

data1 <-
  readxl::read_xls(
    here::here("data-raw/12859_2008_2311_MOESM1_ESM.xls"),
    range = "Runs!B6:IG55",
    col_names = FALSE,
    .name_repair = "unique_quiet"
  ) %>%
  unlist(use.names = FALSE)

data2 <-
  readxl::read_xls(
    here::here("data-raw/12859_2008_2311_MOESM1_ESM.xls"),
    range = "Runs!B61:FY110",
    col_names = FALSE,
    .name_repair = "unique_quiet"
  ) %>%
  unlist(use.names = FALSE)

amp_mix_perc <-
  metadata_cols %>%
  dplyr::mutate(replicate = rep(1:3, length.out = nrow(metadata_cols))) %>%
  dplyr::group_by(run, amp_mix_perc, copies, replicate) %>%
  dplyr::reframe(cycle = 1:50) %>%
  dplyr::arrange(desc(copies), desc(amp_mix_perc), run) %>%
  dplyr::mutate(
    plate = factor(NA_character_),
    well = factor(NA_character_),
    dye = factor("SYBR"),
    target = factor("MT-ND1"),
    sample_type = factor("std"),
    amp_mix_perc = 100* amp_mix_perc, # actually convert to percentage
    .before = 1L
  ) %>%
  dplyr::mutate(dilution = as.integer(31400000 / copies), .after = copies) %>%
  dplyr::mutate(fluor = c(data1, data2))

usethis::use_data(amp_mix_perc, overwrite = TRUE)
