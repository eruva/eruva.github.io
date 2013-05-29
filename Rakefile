desc "compile and run the site"
task :default do
  pids = [
    spawn("jekyll serve -w"),
    # spawn("scss --watch assets:stylesheets"),
    spawn("compass watch")
    # spawn("coffee -b -w -o javascripts -c assets/*.coffee")
  ]

  trap "INT" do
    Process.kill "INT", *pids
    exit 1
  end

  loop do
    sleep 1
  end
end