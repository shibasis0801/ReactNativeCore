#
# Be sure to run `pod lib lint ReactNativeCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
boost_compiler_flags = '-Wno-documentation  -Wno-nullability-completeness'

Pod::Spec.new do |s|
  s.name = 'ReactNativeCore'
  s.version = '0.2.0'
  s.summary = 'An runtime base on react-native.'
  s.description =
  <<-DESC
  'Introduce this library for your App, development by react-native code.'
  DESC

  s.homepage = 'https://github.com/beatjs/ReactNativeCore'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Liam Xu' => 'liamxujia@outlook.com' }
  s.source = { :git => 'https://github.com/beatjs/ReactNativeCore.git', :tag => s.version.to_s }
  
  s.resource_bundle = { 'AccessibilityResources' => ['React/AccessibilityResources/*.lproj']}
  s.header_dir = 'React'
  s.library = 'stdc++'
  s.framework = 
  'JavaScriptCore',
  'Photos'
  s.ios.deployment_target = '11.0'
  s.pod_target_xcconfig = {
    "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/DoubleConversion\"",
    "DEFINES_MODULE" => "YES"
  }
  s.compiler_flags = folly_compiler_flags + ' ' + boost_compiler_flags
  s.default_subspec = "All"
  
  s.subspec 'All' do |ss|
    ss.dependency 'ReactNativeCore/Default'
    ss.dependency 'ReactNativeCore/folly'
    ss.dependency 'ReactNativeCore/ReactCommon'
    ss.dependency 'ReactNativeCore/callinvoker'
    ss.dependency 'ReactNativeCore/cxxreact'
    ss.dependency 'ReactNativeCore/jsi'
    ss.dependency 'ReactNativeCore/jsireact'
    ss.dependency 'ReactNativeCore/jsinspector'
    ss.dependency 'ReactNativeCore/RCTRequired'
    ss.dependency 'ReactNativeCore/RCTTypeSafety'
    ss.dependency 'ReactNativeCore/FBLazyVector'
    ss.dependency 'ReactNativeCore/FBReactNativeSpec'
    ss.dependency 'ReactNativeCore/RCTWebSocket'
    ss.dependency 'ReactNativeCore/DevSupport'
    ss.dependency 'ReactNativeCore/CoreModules'
    ss.dependency 'ReactNativeCore/RCTActionSheet'
    ss.dependency 'ReactNativeCore/RCTAnimation'
    ss.dependency 'ReactNativeCore/RCTBlob'
    ss.dependency 'ReactNativeCore/RCTImage'
    ss.dependency 'ReactNativeCore/RCTLinking'
    ss.dependency 'ReactNativeCore/RCTNetwork'
    ss.dependency 'ReactNativeCore/RCTSettings'
    ss.dependency 'ReactNativeCore/RCTText'
    ss.dependency 'ReactNativeCore/RCTVibration'
  end

  s.subspec 'Default' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files =
    'React/**/*.{c,h,m,mm,S,cpp}'
    ss.exclude_files =
    'React/CoreModules/**/*',
    'React/DevSupport/**/*',
    'React/Fabric/**/*',
    'React/Inspector/**/*'
    ss.ios.exclude_files = 'React/**/RCTTV*.*'
    ss.tvos.exclude_files =
    'React/Modules/RCTClipboard*',
    'React/Views/RCTDatePicker*',
    'React/Views/RCTPicker*',
    'React/Views/RCTRefreshControl*',
    'React/Views/RCTSlider*',
    'React/Views/RCTSwitch*'
    ss.private_header_files = 'React/Cxx*/*.h'
  end
  
  # #import <React/*>
  s.subspec 'folly' do |ss|
    ss.pod_target_xcconfig = {
        "USE_HEADERMAP" => "YES",
        "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)\" \"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/DoubleConversion\""
    }
    ss.source_files =
    'folly/String.cpp',
    'folly/Conv.cpp',
    'folly/Demangle.cpp',
    'folly/FileUtil.cpp',
    'folly/Format.cpp',
    'folly/lang/SafeAssert.cpp',
    'folly/ScopeGuard.cpp',
    'folly/Unicode.cpp',
    'folly/dynamic.cpp',
    'folly/json.cpp',
    'folly/json_pointer.cpp',
    'folly/container/detail/F14Table.cpp',
    'folly/detail/Demangle.cpp',
    'folly/detail/UniqueInstance.cpp',
    'folly/hash/SpookyHashV2.cpp',
    'folly/lang/Assume.cpp',
    'folly/lang/CString.cpp',
    'folly/memory/detail/MallocImpl.cpp',
    'folly/net/NetOps.cpp',
    'folly/portability/SysUio.cpp'
    ss.preserve_paths =
    'folly/*.h',
    'folly/container/*.h',
    'folly/container/detail/*.h',
    'folly/detail/*.h',
    'folly/functional/*.h',
    'folly/hash/*.h',
    'folly/lang/*.h',
    'folly/memory/*.h',
    'folly/memory/detail/*.h',
    'folly/net/*.h',
    'folly/net/detail/*.h',
    'folly/portability/*.h'

  end
  
  # #import <React/*>
  s.subspec 'ReactCommon' do |ss|
    ss.source_files =
    'ReactCommon/turbomodule/core/**/*.{h,mm,m,cpp}'
    ss.private_header_files =
    'ReactCommon/turbomodule/core/**/*.{h}'
    ss.exclude_files =
    'ReactCommon/turbomodule/core/platform/android/**/*'
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
  end

  # #import <React/*>
  s.subspec 'callinvoker' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files =
    'ReactCommon/callinvoker/ReactCommon/**/*.{h}'
    ss.private_header_files =
    'ReactCommon/callinvoker/ReactCommon/**/*.{h}'
  end

  # #import <React/*>
  s.subspec 'cxxreact' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files =
    'ReactCommon/cxxreact/**/*.{h,cpp}'
    ss.private_header_files =
    'ReactCommon/cxxreact/**/*.{h}'
    ss.exclude_files = 'ReactCommon/cxxreact/tests'
  end

  # #import <React/*>
  s.subspec 'jsi' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files =
    'ReactCommon/jsi/**/*.{h,cpp}'
    ss.private_header_files =
    'ReactCommon/jsi/**/*.{h}'
    ss.exclude_files = 'ReactCommon/jsi/jsi/test'
  end

  # #import <React/*>
  s.subspec 'jsireact' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files =
    'ReactCommon/jsiexecutor/jsireact/**/*.{h,cpp}'
    ss.private_header_files =
    'ReactCommon/jsiexecutor/jsireact/**/*.{h}'
  end

  # #import <React/*>
  s.subspec 'jsinspector' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files =
    'ReactCommon/jsinspector/**/*.{h,cpp}'
    ss.private_header_files =
    'ReactCommon/jsinspector/**/*.{h}'
  end

  # #import <React/*>
  s.subspec 'RCTRequired' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files =
    'Libraries/RCTRequired/**/*.{h,mm}'
    ss.private_header_files =
    'Libraries/RCTRequired/RCTRequired/RCTRequired.h'
  end
  
  # #import <React/*>
  s.subspec 'RCTTypeSafety' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files =
    'Libraries/TypeSafety/**/*.{h,mm}'
    ss.private_header_files =
    'Libraries/TypeSafety/RCTConvertHelpers.h',
    'Libraries/TypeSafety/RCTTypedModuleConstants.h'
  end

  # #import <React/*>
  s.subspec 'FBLazyVector' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files =
    'Libraries/FBLazyVector/FBLazyVector/**/*.{h}'
    ss.private_header_files =
    'Libraries/FBLazyVector/FBLazyVector/**/*.{h}'
  end

  # #import <React/*>
  s.subspec 'FBReactNativeSpec' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files =
    'Libraries/FBReactNativeSpec/FBReactNativeSpec/**/*.{h,mm,cpp}'
    ss.private_header_files =
    'Libraries/FBReactNativeSpec/FBReactNativeSpec/**/*.{h}'
  end
  
  s.subspec 'RCTWebSocket' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files = 'Libraries/WebSocket/*.{h,m}'
  end
  
  s.subspec 'DevSupport' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files =
    'React/DevSupport/*.{h,mm,m}',
    'React/Inspector/*.{h,mm,m}'
  end

  s.subspec 'CoreModules' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files = 'React/CoreModules/**/*.{c,h,m,mm,cpp}'
  end

  s.subspec 'RCTActionSheet' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files = 'Libraries/ActionSheetIOS/**/*.{h,m}'
  end

  s.subspec 'RCTAnimation' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files = 'Libraries/NativeAnimation/{Drivers/*,Nodes/*,*}.{h}'
  end

  s.subspec 'RCTBlob' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files = 'Libraries/Blob/**/*.{h,m,mm}'
    ss.private_header_files =
    'Libraries/Blob/RCTBlobCollector.h',
    'Libraries/Blob/RCTBlobPlugins.h'
  end

  s.subspec 'RCTImage' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files = 'Libraries/Image/*.{h,m,mm}'
  end

  s.subspec 'RCTLinking' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files = 'Libraries/LinkingIOS/*.{h,m,mm}'
  end

  s.subspec 'RCTNetwork' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files = 'Libraries/Network/*.{h,m,mm}'
  end

  s.subspec 'RCTSettings' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files = 'Libraries/Settings/*.{h,m,mm}'
  end

  s.subspec 'RCTText' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files = 'Libraries/Text/**/*.{h,m,mm}'
  end

  s.subspec 'RCTVibration' do |ss|
    ss.pod_target_xcconfig = { "USE_HEADERMAP" => "YES" }
    ss.source_files = 'Libraries/Vibration/*.{h,m,mm}'
  end

  s.dependency 'Yoga', '1.14.0'
  s.dependency 'boost-for-react-native', '1.63.0'
  s.dependency 'DoubleConversion', '1.1.5'
  s.dependency 'glog', '0.3.4'
  
  s.platforms = { :ios => '11.0' }
end
