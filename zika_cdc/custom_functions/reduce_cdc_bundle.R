reduce_cdc_bundle <- function(cdc_github_commit_hash) {
    extracted_path <- sprintf('data/zika-%s', cdc_github_commit_hash)

    junk <- list.files(pattern='*.pdf', full.names = TRUE, recursive = TRUE)
    file.remove(junk)
}
