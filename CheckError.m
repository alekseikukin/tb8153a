function [message] = CheckError(error_code)
            % Module Related Errors
            % E 0101 Error in the low wavelength monitor current.
            % E 0102 Error in the high wavelength monitor current.
            % E 0103 Error in the low wavelength laser diode current.
            % E 0104 Error in the high wavelength laser diode current.
            % E 1xxx LIGHT Error while zeroing. Digits marked x indicate the phase, loop
            % counter value, and hardware.
            % E 3000 NO HEAD No head attached to the optical head interface module.
            % E 3100 SETTLING Module not yet adjusted to temperature.
            % E 3200 Checksum error in optical head data.
            % E 3300 No memory to store the zero data (memory allocation failure).
            % E 3400 NO HEAD Optical head removed during the zero operation.
            % E 4001 MODULE Reading EEPROM failed.
            % E 4002 MODULE EEPROM checksum error.
            % E 4004 MODULE No acknowledge from EEPROM.
            % E 4005 MODULE reading EPROM failed.
            % E 4006 KEY JAM reading EPROM failed.
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Specific Error Identifiers
            % E 4010 Input value exceeds limits
            % E 4020 Input value below lower limit
            % E 4030 Registers of the real time clock cannot be read from or written to.
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Store and Recall Errors
            % E 4101 CH EMPTY Store from or recall to an empty slot.
            % E 4102 MISMATCH Attempt to recall source data into a sensor module, or
            % sensor data into a source module.
            % E 4103 NO DATA Attempt to recall data from a location where no data has
            % been stored, or where the data is unintelligible.
            % E 4105 MEM FAIL Memory checksum failed.
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Plot, Print, Show, and Manual Logging Errors
            % E 4201 NO DATA There is no data for the application. Another cause could be
            % that there is not enough data for the results statistics to be calculated.
            % E 4202 INVALID The data is invalid.
            % E 4203 TLKONLY? Plot or print is not possible because the HP-IB is not set to
            % talk only mode.
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % Loss Errors
            % E 4301 CONFIG The Loss application cannot run, because it
            % needs both a source and a sensor module.
            % E 4302 CONFIG The
            % Loss application cannot run, because it needs one of the
            % modules is already being used.
            if isempty(error_code)
                message = 'no errores';
            else
                switch lower(error_code)
                    % Module Related Errors
                    case 'e 0101'
                        error('Error in the low wavelength monitor current.');
                    case 'e 0102'
                        error('Error in the high wavelength monitor current.');
                    case 'e 0103'
                        error('Error in the low wavelength laser diode current.');
                    case 'e 0104'
                        error('Error in the high wavelength laser diode current.');
                    case 'e 1xxx'
                        error(['LIGHT Error while zeroing.'...
                            ' Digits marked x indicate the phase,'...
                            ' loop counter value, and hardware.']);
                    case 'e 3000'
                        error(['NO HEAD No head attached to'...
                            ' the optical head interface module. ']);
                    case 'e 3100'
                        error(' SETTLING Module not yet adjusted to temperature. ');
                    case 'e 3200'
                        error('Checksum error in optical head data.');
                    case 'e 3300'
                        error(['No memory to store the zero data'...
                            ' (memory allocation failure).']);
                    case 'e 3400'
                        error(['NO HEAD Optical head removed'...
                            ' during the zero operation.']);
                    case 'e 4001'
                        error('MODULE Reading EEPROM failed.');
                    case 'e 4002'
                        error('MODULE EEPROM checksum error. ');
                    case 'e 4004'
                        error('MODULE No acknowledge from EEPROM.');
                    case 'e 4005'
                        error('MODULE reading EPROM failed.');
                    case 'e 4006'
                        error('KEY JAM reading EPROM failed');
                        % Specific Error Identifiers
                    case 'e 4010'
                        error('Input value exceeds limits');
                    case 'e 4020'
                        error('Input value below lower limit');
                    case 'e 4030'
                        error(['Registers of the real time clock'...
                            ' cannot be read from or written to.']);
                        %Store and Recall Errors
                    case 'e 4101'
                        error('CH EMPTY Store from or recall to an empty slot.');
                    case 'e 4102'
                        error(['MISMATCH Attempt to recall source data'...
                            ' into a sensor module, or '...
                            'sensor data into a source module.']);
                    case 'e 4103'
                        eerror(['NO DATA Attempt to recall data'...
                            ' from a location where no data has'...
                            ' been stored, or where the data is unintelligible.']);
                    case 'e 4105'
                        error('MEM FAIL Memory checksum failed.');
                        % Plot, Print, Show, and Manual Logging Errors
                    case 'e 4201'
                        error(['NO DATA There is no data for the application.'...
                            ' Another cause could be that there is not enough'...
                            ' data for the results statistics to be calculated']);
                    case 'e 4202'
                        eerror('INVALID The data is invalid.');
                    case 'e 4203'
                        error(['E 4203 TLKONLY? Plot or print is not possible'...
                            ' because the HP-IB is not set to talk only mode.']);
                        % Loss Errors
                    case 'e 4301'
                        eerror(['CONFIG The Loss application cannot run,'...
                            ' because it needs both a source'...
                            ' and a sensor module.']);
                    case 'e 4302'
                        error(['CONFIG The Loss application cannot run,'...
                            ' because it needs one of the modules'...
                            ' is already being used.']);
                    otherwise
                end
            end
        end