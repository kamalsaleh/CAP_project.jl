
julia> package_loading_info_level = InfoLevel( InfoPackageLoading );

julia> SetInfoLevel( InfoPackageLoading, PACKAGE_ERROR );

julia> true
true

julia> SetInfoLevel( InfoPackageLoading, PACKAGE_INFO );

julia> true
true

julia> SetInfoLevel( InfoPackageLoading, package_loading_info_level );

julia> HOMALG_IO.show_banners = false;
