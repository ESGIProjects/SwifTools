#
#  Be sure to run `pod spec lint SwifTools.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "SwifTools"
  s.version      = "0.0.1"
  s.summary      = "A Swift Framework that serves as a development toolbox."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
  A Swift Framework that serves as a development toolbox. Handles things like constraints, Touch ID,
  and Home Screen Quick Actions.
                   DESC

  s.homepage     = "https://github.com/ESGIProjects/SwifTools"
  s.license      = "BSD"
  s.authors      = { "Jason Pierna" => "jasonpierna7@gmail.com", "Kévin Le" => "kevints.le@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/ESGIProjects/SwifTools.git", :tag => "#v{s.version}" }
  s.source_files  = "SwifTools", "SwifTools/**/*.{h,m,swift}"
  s.exclude_files = "SwifTools/SwifToolsTests/*"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3'}

end
