# ios/Podfile

platform :ios, '13.0'

use_frameworks!
use_modular_headers!

target 'Runner' do
  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))
end
