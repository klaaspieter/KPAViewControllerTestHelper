task :test do
  sh "xcodebuild -scheme KPAViewControllerTestHelper -workspace KPAViewControllerTestHelper.xcworkspace -sdk iphonesimulator test"
  # sh "xctool -workspace KPAViewControllerTestHelper.xcworkspace -scheme SpecsApp -sdk iphonesimulator test"
end

task :default => :test
