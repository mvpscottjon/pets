# Uncomment the next line to define a global platform for your project
# platform :ios, '14.0'

def core_pods
    pod 'SnapKit'
    pod 'RxSwift'
    pod 'RxCocoa'
    pod 'Alamofire'
    pod 'Kingfisher'
    pod 'FirebaseAuth'
    pod 'FirebaseFirestore'
    pod 'FirebaseAnalytics'
end

target 'Pets' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  core_pods

   target 'PetsTests' do
   	inherit! :search_paths
   
   	core_pods	
	pod 'OHHTTPStubs/Swift'

  end

end
