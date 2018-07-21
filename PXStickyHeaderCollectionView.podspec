Pod::Spec.new do |s|
    s.name             = 'PXStickyHeaderCollectionView'
    s.version          = '0.1.0'
    s.summary          = 'Parallax Sticky header in collection view'
    s.homepage         = 'https://github.com/mercadolibre/MPDynamicSkeleton'
    s.author           = { 'Marcelo José' => 'marcelo.oscar.jose@gmail.com' }
    s.description      = 'Parallax Sticky header in collection view'
    
    s.source           = { :git => 'https://github.com/mercadolibre/MPDynamicSkeleton.git', :tag => s.version.to_s}
    s.license          = 'Apache License, Version 2.0'
    s.platform         = :ios, '10.0'
    s.requires_arc     = true
    
    s.source_files = 'LibraryComponents/Classes/**/*'
    
end
