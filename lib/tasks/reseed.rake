task :reseed do
  # Delete all tables (ignores sqlite3 config tables)
`rake db:drop`
`rake db:create`
`rake db:migrate`
`rake db:seed`
end