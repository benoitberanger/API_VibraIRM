function Start( self , channel, value )

self.AssertIsOpen ();
self.AssertIsReady();

if nargin < 3
    value = self.Value(channel);
else
    self.Value(channel) = value;
end

msg = {'C0' , '00' , '02' , num2str(channel) , dec2hex(value,2) , 'C1'};

if ~self.dummy
    
    [ FT_STATUS , numBytesWritten ] = self.FTDI_Handle.Write(  uint8(hex2dec(msg)) , uint32(length(msg)), uint32(0)); self.Update_FT_STATUS(FT_STATUS);
    
end

end % function
