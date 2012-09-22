require 'thor/scmversion'

GEMNAME = 'gemname'

class Gemname < Thor
  namespace GEMNAME

  desc "build", "Build the gem"
  def build
    system("gem build -V '#{GEMNAME}.gemspec'")
    FileUtils.mkdir_p(File.join(File.dirname(__FILE__), 'pkg'))
    FileUtils.mv("#{GEMNAME}-#{current_version}.gem", 'pkg')
  end

  desc "install", "Build and install latest to system gems"
  def install
    invoke "build", []
    system("gem install pkg/#{GEMNAME}-#{current_version}.gem")
  end

  desc "release TYPE", "Bump version, make a build, and push to Rubygems"
  def release(type)
    @current_version = nil
    invoke "version:bump", [type]
    invoke "build", []
    system("gem push pkg/#{GEMNAME}-#{current_version}.gem")
  end
    
  private
  def current_version
    @current_version ||= ::ThorSCMVersion.versioner.from_path
  end
end