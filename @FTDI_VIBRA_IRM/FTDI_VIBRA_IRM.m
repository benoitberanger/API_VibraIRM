classdef FTDI_VIBRA_IRM < handle
    %FTDI_VIBRA_IRM is an class to command VibraIRM from TechnoConcept
    % This class uses FTD2XX_NET.dll to access the FTDI chip on the device
    
    
    %% Properties (attributs)
    
    properties % attributs
        
        FTD2XX_NET_dll_path = fullfile(pwd,'FTD2XX_NET_v1.1.0','FTD2XX_NET.dll');
        FTDI_Handle
        FT_STATUS
        IsOpen              = 0;
        IsReady             = 0;
        Value               = [100 100 100 100]; % [0-100] : percentage(%) of valve opening, 1 value each of the 4 outputs
        
        dummy               = 0;                 % for non supported sytems
        
    end % properties
    
    
    %% Methods
    
    methods
        
        % -----------------------------------------------------------------
        %                           Constructor
        % -----------------------------------------------------------------
        
        function self = FTDI_VIBRA_IRM( DLL_path )
            
            if ispc
                
                if nargin
                    assert( exist( DLL_path , 'file') == 2 , 'Not a valide file : %s', DLL_path)
                    self.FTD2XX_NET_dll_path = DLL_path;
                end
                
                % Load DLL
                NET.addAssembly(self.FTD2XX_NET_dll_path);
                
            else
                
                self.dummy = 1;
                warning('FTDI_VIBRA_IRM is in dummy mode')
                
            end
            
        end % function : ctor
        
    end % methods
    
    methods(Static)
        
        % Here, I use a static method so you can call this methods without instantiate the object, such as :
        %       FTDI_VIBRA_IRM.GUI_VIBRA_IRM()              % open our bring to focus the GUI
        % out = FTDI_VIBRA_IRM.GUI_VIBRA_IRM()              % open our bring to focus the GUI
        % out = FTDI_VIBRA_IRM.GUI_VIBRA_IRM(figHandle    ) % open GUI in specified figure
        % out = FTDI_VIBRA_IRM.GUI_VIBRA_IRM(uipanelHandle) % open GUI in specified uipanel
        out = GUI_VIBRA_IRM( container )
        
    end % methods static
    
    
end % classdef
