function hello(wsapi_env)
  local headers = { ["Content-type"] = "text/html" }
  local function hello_text()
    coroutine.yield("<h1>Hello Wsapi!</h1>\n")
  end
  return 200, headers, coroutine.wrap(hello_text)
end

return hello