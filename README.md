# gifsicle cookbook

Downloads, builds and installs [gifsicle](http://www.lcdf.org/gifsicle/) from source.

# Requirements

Depends on Opscode's `build-essential` cookbook

# Usage

Put either `gifsicle::source` or `gifsicle::default` in your node's run list. They both do the same thing at the moment.

# Attributes

`node[:gifsicle][:install_prefix]` - the directory prefix to use when configuring gifsicle (defaults to '/usr/local')
`node[:gifsicle][:build_prefix]` - the directory where gifsicle will be downloaded, unpacked and built (defaults to '/usr/src')
`node[:gifsicle][:version]` - version string
`node[:gifsicle][:source_url]` - url to source
`node[:gifsicle][:source_sha256]` - checksum for source

# Recipes

See usage.

# Author

Author:: Cameron Johnston (<cameron@rootdown.net>)
