local status_ok, browse = pcall(require, "browse")
if not status_ok then
	return
end

browse.setup({
  -- search provider you want to use
  provider = "duckduckgo", -- google, duckduckgo, bing

  -- either pass it here or just pass the table to the functions
  -- see below for more
  bookmarks = {}
})
