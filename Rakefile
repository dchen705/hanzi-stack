require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'

  t.test_files = FileList['test/**/*_test.rb']
  # test results are combined. Simplecov doesn't work if run tests from here.
end

desc 'Run tests'
task default: [:test]
