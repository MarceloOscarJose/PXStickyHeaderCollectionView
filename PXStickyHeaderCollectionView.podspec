Pod::Spec.new do |s|
    s.name             = 'PXStickyHeaderCollectionView'
    s.version          = '1.2.1'
    s.summary          = 'Parallax Sticky header in collection view'
    s.homepage         = 'https://github.com/MarceloOscarJose/PXStickyHeaderCollectionView'
    s.author           = { 'Marcelo José' => 'marcelo.oscar.jose@gmail.com' }
    s.description      = 'Parallax Sticky header in custom CollectionView'

    s.source           = { :git => 'https://github.com/MarceloOscarJose/PXStickyHeaderCollectionView.git', :tag => s.version.to_s}
    s.license          = 'Apache License, Version 2.0'
    s.platform         = :ios, '10.0'
    s.requires_arc     = true
    s.swift_version     = '5'

    s.source_files = 'LibraryComponents/Classes/**/*'
end
