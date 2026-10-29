Gen_AccClust <- function(cluster, label) {
  if (missing(cluster) || missing(label))
    stop("Both 'cluster' and 'label' are required.")
  
  if (length(cluster) == 0L || length(cluster) != length(label))
    stop("'cluster' and 'label' must be nonempty and have equal lengths.")
  
  if (anyNA(cluster) || anyNA(label))
    stop("'cluster' and 'label' must not contain missing values.")
  
  tab = table(cluster, label)
  if (nrow(tab) > ncol(tab))
    tab <- t(tab)
  
  perm=solve_LSAP(tab, maximum = TRUE)
  acc = sum(tab[cbind(seq_len(nrow(tab)),perm)])/sum(tab)
  return(acc)
}
