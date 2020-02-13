clear
clc


%% Initialize the communication
% This part is mandatory

vb = FTDI_VIBRA_IRM(); % Instantiate the object
vb.Open ();            % Open connection
vb.Setup();            % Setup specific parameters of the FTDI chip so TechnoConcept protocol can be used


%% Open/Close valves
% Open successively each valve at 100%, then close.
% The pause give us some time to hear the "clic", because the execution of
% the command (start/stop) is fast : 2-3ms on my computer

vb.SetValue([100 100 100 100]);

for valve = 1 : 4
    
    tic, vb.Start( valve ); toc
    fprintf('Valve %d opened \n', valve)
    pause(0.5)
    
    tic, vb.Stop ( valve ); toc,
    fprintf('Valve %d closed \n', valve)
    pause(0.5)
    
end


%% Cleanup

% Close all valves
vb.StopAll();

% Close connection and delete object
vb.Close();
delete(vb)
clear('vb')
