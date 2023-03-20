local status_ok, live_server = pcall(require, "live_server")
if not status_ok then
  return
end

live_server.setup({
  port = 8080,
  browser_command = "brave-browser", -- Command or executable path
  quiet = false,
  no_css_inject = true,
  install_path = os.getenv("HOME") .. "/live/",
})
