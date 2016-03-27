#' takes a commmit hash from the cdc repo
#' if the zip file exists: check to see if the directory exists
#' if the zip file does not exist, download and extract
get_cdc_data <- function(cdc_github_commit_hash){
    # cdc_github_commit_hash <- '05e6c978330da18ee5902cceabeab742f54294f2'
    downloaded_zip <- sprintf('zika-%s.zip', cdc_github_commit_hash)
    downloaded_zip_path <- sprintf('data/%s.zip', cdc_github_commit_hash)
    extracted_path <- sprintf('data/zika-%s', cdc_github_commit_hash)

    if(file.exists(downloaded_zip_path)){
        if(dir.exists(extracted_path)){
            # if the zip exists and the directory is found
            # do nothing
        } else {
            unzip(downloaded_zip_path, exdir = 'data')
        }
    } else {
        github_zip_url <- sprintf('https://github.com/cdcepi/zika/archive/%s.zip',
                                  cdc_data_commit)
        download.file(url = github_zip_url,
                      destfile = downloaded_zip_path)
        unzip(downloaded_zip_path, exdir = 'data')
    }
}
