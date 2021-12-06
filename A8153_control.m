classdef A8153_control < handle
    properties
        c_gpib
    end
    properties(SetAccess = private)
        close_port % open and close connection for each command
    end
    methods
        function obj = A8153_control(boardindex,primaryaddress, varargin)
            obj.c_gpib = gpib('ni', boardindex, primaryaddress);
            obj.close_port = false;
            while ~isempty(varargin)
                switch lower(varargin{1})
                    case 'close_port'
                        obj.close_port = varargin{2};
                    otherwise
                        error('unknown paraiter')
                end
                varargin(1:2) = [];
            end
            if ~obj.isopen()
                fopen(obj.c_gpib);
            else
                disp('Port was open already!!!');
            end
            fprintf(obj.c_gpib,'*IDN?');
            int_result = fscanf(obj.c_gpib);
            disp(int_result);
            obj.CloseIfNeed();

        end
        function inform = IDN(obj)
            % *IDN? Identication Query
            obj.OpenIfNeed();
            obj.Fprintf('*IDN?');
            inform = obj.Fscanf();
            %             fprintf(obj.c_gpib,'*IDN?');
            %             inform = fscanf(obj.c_gpib);
            obj.CloseIfNeed();

        end
        function inform = Propinfo(obj)
            inform = propinfo(obj.c_gpib);
        end
        function satus = Fprintf(obj, varargin)
            %Fprintf - send command to device, return result
            if isempry(varargin)
                error('you need write 1 or more comands')
            end
            while ~isempty(varargin)
                satus = fprintf(obj.c_gpib, varargin{1});
                varargin{1} = [];
            end
        end
        function inform = Fscanf(obj)
            %Fscanf - return data from bufer of device
            inform = fscanf(obj.c_gpib);
        end
        function info = Fopen(obj)
            %Fopen - connect to device
            obj.OpenIfNeed();
            info = obj.c_gpib.Status;

        end
        function info = Fclose(obj)
            %Fclose - cancel connection to device
            fclose(obj.c_gpib);
            info = obj.c_gpib.Status;
        end
        function info = Status(obj)
            %Status - return status of connection
            info = obj.c_gpib.Status;
        end
        function inform = EventStatus(obj)
            % *ESE? Standard Event Status Enable Query

            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'*ESE?');
            inform = fscanf(obj.c_gpib);
            obj.CloseIfNeed();

        end
        function inform = StandardEventStatus(obj)
            % *ESR? Standard Event Status Register Query

            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'*ESR?');
            inform = fscanf(obj.c_gpib);
            obj.CloseIfNeed();

        end
        function inform = OperationCompleteStatus(obj)
            % *OPC? Operation Complete Query

            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'*OPC?');
            inform = fscanf(obj.c_gpib);
            obj.CloseIfNeed();

        end
        function inform = ServiceRequestEnableStatud(obj)
            % *SRE? Service Request Enable Query

            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'*SRE?');
            inform = fscanf(obj.c_gpib);
            obj.CloseIfNeed();

        end
        function inform = ReadStatusByte(obj)
            % *STB? Read Status Byte Query

            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'*STB?');
            inform = fscanf(obj.c_gpib);
            obj.CloseIfNeed();

        end
        function inform = SelfTest(obj)
            % *TST? Self Test Query

            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'*TST?');
            inform = fscanf(obj.c_gpib);
            obj.CloseIfNeed();

        end
        function [] = ClearStatus(obj)
            % *CLS Clear Status Command
            % The *CLS command clears all the event registers
            % summarized in the Status Byte register. With the
            % exception of the output queue, all queues that are
            % summarized in the Status Byte register are emptied. The
            % error queue is also emptied. Neither the Standard Event
            % Status Enable register, nor the Service Request Enable
            % register are affected by this command.
            % After the *CLS command the instrument is left in the idle
            % state. The command does not alter the instrument setting.
            % *OPC/*OPC? actions are canceled.
            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'*CLS');
            obj.CloseIfNeed();

        end
        function [] = StdEventStatusEnable(obj, value)
            % *ESE Standard Event Status Enable Command
            % Syntax *ESE <wsp> <value>
            % 0 <= value <= 255
            % Definition The *ESE command sets bits in the Standard Event Status
            % Enable register and thus enables the corresponding bits
            % in the Standard Event Status register. A 1 in a bit in the
            % enable register enables the same bit in the status register. The value sent as an integer or a
            % oating point number
            % (NRf).
            % The register is cleared at power-on. The *RST and *CLS
            % commands do not change the register.
            obj.OpenIfNeed();
            fprintf(obj.c_gpib,['*ESE' num2str(value)]);
            obj.CloseIfNeed();

        end
        function [] = OperationComplete(obj)
            % *OPC Operation Complete Command
            % The *OPC command parses all program message units in
            % the input queue and sets the operation complete bit in the
            % Standard Event Status register, when the contents of the
            % input queue have been processed.

            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'*OPC');
            obj.CloseIfNeed();

        end
        function [] = Reset(obj)
            % *RST Reset Command
            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'*RST');
            obj.CloseIfNeed();

        end
        function [] = ServiceRequestEnable(obj, value)
            % *SRE Service Request Enable Command
            % Syntax *SRE <wsp> <value>
            % 0 <= value <= 255
            % Definition The *SRE command sets bits in the Service Request
            % Enable register. A 1 in a bit in the enable register enables
            % the corresponding bit in the status register. The value sent
            % as an integer or a
            % oating point number (NRf).
            % The register is cleared at power-on. The *RST and *CLS
            % commands do not change the register.

            obj.OpenIfNeed();
            fprintf(obj.c_gpib,['*SRE' num2str(value)]);
            obj.CloseIfNeed();

        end
        function [] = Trigger(obj)
            % *TRG Trigger Command

            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'*TRG');
            obj.CloseIfNeed();

        end
        function [] = Wait(obj)
            % *WAI Wait Command

            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'*TRG');
            obj.CloseIfNeed();

        end
        function [] = Abort(obj)
            % *WAI Wait Command

            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'*ABOR');
            obj.CloseIfNeed();

        end
        function inform = GetCurrentPower(obj)
            % *TST? Self Test Query
            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'read1:pow?');
            inform = (str2double(fscanf(obj.c_gpib)));
            obj.CloseIfNeed();

        end
        function [] = SetSenseParamiters(obj, varargin)
            % Sense commands include most of the functions for setting up
            % and using the sensor modules.

            comands_list = {};
            while ~isempty(varargin)
                switch lower(varargin{1})
                    case 'atime'
                        comands_list{end+1} =...
                            ['SENS1:POW:ATIME ' num2str(varargin{2}) 'MS'];
                    case 'autorange'
                        comands_list{end+1} =...
                            ['SENS:POW:RANG:AUTO ' num2str(varargin{2})];
                    case 'unit'
                        comands_list{end+1} =...
                            ['SENS:POW:UNIT ' (varargin{2})];
                    case 'wavelength'
                        comands_list{end+1} =...
                            ['SENS:POW:WAVE ' num2str(varargin{2})];
                    otherwise
                        error('unknown paramiter')
                end
                varargin(1:2) = [];
            end
            obj.OpenIfNeed();
            while ~isempty(comands_list)
                fprintf(obj.c_gpib,comands_list{1});
                comands_list(1) = [];
            end
            obj.CloseIfNeed();

        end
        function [inform] = GetSenseParamiters(obj, varargin)
            % Sense commands include most of the functions for setting up
            % and using the sensor modules.

            comands_list = {};
            while ~isempty(varargin)
                switch lower(varargin{1})
                    case 'atime' % average
                        comands_list{end+1} =...
                            'SENS1:POW:ATIME?';
                    case 'autorange'
                        comands_list{end+1} =...
                            'SENS:POW:RANG:AUTO?';
                    case 'unit'
                        comands_list{end+1} =...
                            'SENS:POW:UNIT?';
                    case 'wavelength'
                        comands_list{end+1} =...
                            'SENS:POW:WAVE?';
                    otherwise
                        error('unknown paramiter')
                end
                varargin(1) = [];
            end
            obj.OpenIfNeed();
            while ~isempty(comands_list)
                fprintf(obj.c_gpib,comands_list{1});
                comands_list(1) = [];
                inform = fscanf(obj.c_gpib);

            end
            obj.CloseIfNeed();
        end
        function inform = GetCurrentError(obj)
            % get number of current error

            obj.OpenIfNeed();
            fprintf(obj.c_gpib,'syst:err?');
            inform = fscanf(obj.c_gpib);
            obj.CloseIfNeed();
        end
        function state = isopen(obj)
            % return true if port is open and false of closed
            if string(obj.c_gpib.Status) == "open"
                state = true;
            elseif string(obj.c_gpib.Status) == "closed"
                state = false;
            end

        end
        function OpenIfNeed(obj)
            %OpenIfNeed - check tatus of connection and open if it was not oppened
            % before
            if ~obj.isopen()
                obj.Fopen()
            end
        end
        function CloseIfNeed(obj)
            %CloseIfNeed - close connection if it need to be closed
            if obj.close_port
                obj.Fclose();
            end
        end

    end %methods
end


