
    -- Display Queries --

        -- port
        SELECT * FROM port;

        -- border
        SELECT * FROM border;

        -- port_state
        SELECT * FROM port_state;

        -- state
        SELECT * FROM state;

        -- port_measure
        SELECT * FROM port_measure;

        -- measure
        SELECT * FROM measure;

        -- master display
        SELECT
            p.port_code AS Port_Code,
            b.border_name AS Border,
            p.port_name AS Port_Entry_Name,
            p.latitude AS Latitude,
            p.longitude AS Longitude,
            s.state_id AS State_ID,
            s.state_Name AS State_Name,
            m.measure_id AS Measure_ID,
            m.measure_name AS Measure_Name,
            pm.amount AS Entry_Amount,
            pm.entry_date AS Entry_Date
        FROM
            port p
        INNER JOIN
            border b ON p.border_name = b.border_name -- Joins port and border
        INNER JOIN
            port_measure pm ON p.port_code = pm.port_code -- Joins port and port_measure
        INNER JOIN
            measure m ON pm.measure_id = m.measure_id -- Joins port_measure and measure
        INNER JOIN
            port_state ps ON p.port_code = ps.port_code -- Joins port and port_state
        INNER JOIN
            state s ON ps.state_id = s.state_id; -- Joins state and port_state 

        
    -- Functions --

        -- Find all pedestrian entries through the Calexico border crossing in California for the year 2020.
        SELECT 
            p.port_name, 
            m.measure_name, 
            SUM(pm.amount) AS Total_Entries 
        FROM
            port p
        INNER JOIN
            port_measure pm ON p.port_code = pm.port_code
        INNER JOIN 
            measure m ON pm.measure_id = m.measure_id
        WHERE
            p.port_name = 'Calexico' 
        AND 
            YEAR(pm.entry_date) = 2020
        AND
            m.measure_name = 'Trains';

        -- Find all border entry points on the US-Canadian border.
        SELECT
            port_code,
            port_name
        FROM
            port
        WHERE
            border_name = 'US-Canada Border';

        -- Find the total personal vehicle traffic for the US-Canada and US-Mexico border for the year 2023
        SELECT
            m.measure_name AS Entry_Type,
            SUM(pm.amount) AS Total_Entries,
            p.border_name AS Border
        FROM
            port p
        INNER JOIN
            port_measure pm ON p.port_code = pm.port_code
        INNER JOIN
            measure m ON pm.measure_id = m.measure_id
        WHERE
            m.measure_name = 'personal vehicles'
        AND
            YEAR(pm.entry_date) = 2023
        GROUP BY
            p.border_name;