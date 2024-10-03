require "rake/testtask"

namespace :test do
  Rake::TestTask.new(:all) do |task|
    task.description = "Run all unit and integration tests"
    task.libs << ["test", "test/unit" "lib"]
    task.test_files = FileList["test/unit/*_test.rb", "test/integration/*_test.rb"]
  end

  Rake::TestTask.new(:unit) do |task|
    task.description = "Run unit tests"
    task.libs << ["test", "test/unit" "lib"]
    task.test_files = FileList["test/unit/*_test.rb"]
  end

  Rake::TestTask.new(:integration) do |task|
    task.description = "Run integration tests"
    task.libs << ["test", "test/unit" "lib"]
    task.test_files = FileList["test/integration/*_test.rb"]
  end

  desc "Run all benchmark evaluations"
  task :benchmark do
    Dir.glob("test/benchmarks/*_bench.rb") do |benchmark|
      puts "\nRunning..."
      ruby "-I lib -I test/benchmarks #{benchmark}"
      puts "\n\n#{"-" * 8}\n"
    end
  end
end

desc "Print the specs"
task :print_specs do
  puts "\n"
  FileList["test/unit/*_test.rb", "test/integration/*_test.rb"].each do |f|
    puts "\n#{f}\n"
    indent = 2
    File.readlines(f).each do |line|
      indent += 1 if /\bdo\b/ =~ line
      case
      when /describe\s*\"(.*)\"/ =~ line
        puts "#{"  " * indent}#{$1}"
      when /it\s*\"(.*)\"/ =~ line
        puts "#{"  " * indent}it #{$1}"
      when /^\s*end/ =~ line
        indent = [indent -= 1, 0].max
      end
    end
  end
end

task :default => "test:unit"
task :test => "test:unit"
