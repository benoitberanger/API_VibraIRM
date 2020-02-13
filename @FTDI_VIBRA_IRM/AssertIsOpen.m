function AssertIsOpen( self )

assert( self.IsOpen == 1, '[%s:%s] Device not opened', class(self), mfilename )

end % function
