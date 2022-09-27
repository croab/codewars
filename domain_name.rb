def domain_name(url)
  if url.include?("www.")
    split_url = url.split("www.")[1]
    return split_url.split(".")[0]
  elsif url.include?("://")
    return url.split("://")[1].split(".")[0]
  else
    return url.split(".")[0]
  end
end

domain_name("https://google.com")
