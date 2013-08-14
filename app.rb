require "sinatra"
require "slim"

get '/' do
  repo = Grit::Repo.new(Dir.pwd)
  stats = repo.commit_stats("master").map { |x| x.last }
  @hash  = stats.map { |x| { :additions => x.additions, :deletions => x.deletions } }
  slim :index
end


__END__

@@ index
pre
  == @hash
