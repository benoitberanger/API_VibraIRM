function AssertIsReady( self )

assert( self.IsReady == 1, '[%s:%s] Device not ready', class(self), mfilename )

end % function
