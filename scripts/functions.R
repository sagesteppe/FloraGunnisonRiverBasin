lat_first <- function(x){
  
  coords <- gsub("[\\(\\)]|POLYGON ", "", x)
  pieces <- t(
    stringr::str_split_fixed(
      coords, ',', 
      n = str_count(coords, ',') +1
    )
  )
  pieces <- data.frame(Raw = apply(pieces, MARGIN = 2, str_trim, side = 'both'))
  soro_order <- pieces |>
    dplyr::mutate(
      Long = stringr::str_remove(stringr::str_extract(Raw, '-.* '), ' '), 
      Lat = stringr::str_extract(Raw, ' .*$'), 
      SORO_WKT = paste(Lat, Long)
    ) |>
    dplyr::pull(SORO_WKT)
  soro_order <- gsub('^ ', '', paste0(soro_order, sep="", collapse = ','))
  soro_order <- paste0('POLYGON ((', soro_order, '))' )
  return(soro_order)
}