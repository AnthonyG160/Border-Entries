# Border-Entries Project
This project involved analyzing and visualizing data on border entries at points of entry along the US-Canada and US-Mexico borders, obtained from Data.gov. The primary goal was to design and implement a functional database to accommodate this data and generate interactive visualizations using Tableau.

# Key Objectives:
- Import border entry data from Excel into a MySQL database.
- Design a database to organize the data effectively, ensuring scalability for future updates.
- Visualize key trends and patterns in the data using Tableau Public, including the volume of various transportation types (e.g., trains, trucks, pedestrians) at different ports.

# Tools Used:
- MySQL: Created the database to store and manage the structured border entry data.
- Excel: Used as the primary data source for the project, which was cleaned and prepared for import into the database.
- Tableau Public: Generated visualizations to analyze trends in the data and provide insights on traffic patterns at border ports.

# Highlights:
- Developed a schema that includes tables for ports, measures (types of entries such as trucks, pedestrians, etc.), and historical data for different years and months.
- Addressed issues such as duplicate port codes by introducing composite keys in the MySQL database.
- Created interactive dashboards in Tableau to visualize entry amounts based on transport type, port, and year.

Tableau visualization link: https://public.tableau.com/views/BorderEntries_17276594647490/BorderCrossingEntries?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

Data source: https://catalog.data.gov/dataset/border-crossing-entry-data-683ae

This project showcases the integration of data management and visualization techniques to extract actionable insights from real-world border entry data.

