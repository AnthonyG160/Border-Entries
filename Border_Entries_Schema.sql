CREATE TABLE border (
    border_name		VARCHAR(50) PRIMARY KEY
);

CREATE TABLE port (
	port_code		NUMERIC(4) PRIMARY KEY,
    port_name		VARCHAR(50) NOT NULL,
    border_name		VARCHAR(50) NOT NULL,
				FOREIGN KEY (border_name)
					REFERENCES border (border_name)
                    ON DELETE CASCADE ON UPDATE CASCADE,
	latitude		DECIMAL(10, 8) NOT NULL,
    longitude		DECIMAL(11, 8) NOT NULL
);

CREATE TABLE state (
	state_id		VARCHAR(2) PRIMARY KEY,
    state_name		VARCHAR(50) NOT NULL
);

CREATE TABLE port_state (
	port_code		NUMERIC(4) NOT NULL,
				FOREIGN KEY (port_code)
					REFERENCES port (port_code)
                    ON DELETE CASCADE ON UPDATE CASCADE,
	state_id		VARCHAR(2) NOT NULL,
				FOREIGN KEY (state_id)
					REFERENCES state (state_id)
                    ON DELETE CASCADE ON UPDATE CASCADE,
				PRIMARY KEY (port_code, state_id)
);

CREATE TABLE measure (
	measure_id		NUMERIC(4) PRIMARY KEY,
    measure_name	VARCHAR(50) NOT NULL
);

CREATE TABLE port_measure (
	port_code		NUMERIC(4) NOT NULL,
				FOREIGN KEY (port_code)
					REFERENCES port (port_code)
                    ON DELETE CASCADE ON UPDATE CASCADE,
	measure_id		NUMERIC(4) NOT NULL,
				FOREIGN KEY (measure_id)
					REFERENCES measure (measure_id)
					ON DELETE CASCADE ON UPDATE CASCADE,
	amount			NUMERIC(10) NOT NULL,
    entry_date		DATE NOT NULL,
				PRIMARY KEY (port_code, measure_id, entry_date)
);