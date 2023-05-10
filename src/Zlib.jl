# This file was copied from https://github.com/dcjones/Zlib.jl
#
# Zlib is licensed under the MIT License:
#
# > Copyright (c) 2013: Daniel C. Jones
# >
# > Permission is hereby granted, free of charge, to any person obtaining
# > a copy of this software and associated documentation files (the
# > "Software"), to deal in the Software without restriction, including
# > without limitation the rights to use, copy, modify, merge, publish,
# > distribute, sublicense, and/or sell copies of the Software, and to
# > permit persons to whom the Software is furnished to do so, subject to
# > the following conditions:
# >
# > The above copyright notice and this permission notice shall be
# > included in all copies or substantial portions of the Software.
# >
# > THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# > EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# > MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# > NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# > LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# > OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# > WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

module Zlib
using Zlib_jll

export crc32


function crc32(data::AbstractArray{UInt8}, crc::Integer=0)
    convert(UInt32, (ccall((:crc32, libz),
                 Culong, (Culong, Ptr{UInt8}, Cuint),
                 crc, data, length(data))))
end

crc32(data::AbstractString, crc::Integer=0) = crc32(convert(AbstractArray{UInt8}, data), crc)

end # module
