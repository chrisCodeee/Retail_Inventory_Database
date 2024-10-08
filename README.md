
# Designing A Retail Inventory Database

This project involves the development of a Retail Inventory Database designed to manage essential components of a retail business, including products, categories, suppliers, and warehouses. The database is structured to optimize operations, provide actionable insights, and support data-driven decision-making. Through the creation of tables, data insertion, and execution of various SQL queries, views, and stored procedures, I developed a strong understanding of database design and management.

## SQL Queries and Operations

- Identify Products with Shared Prices: This query retrieves products that have the same price across the inventory. It helps identify potential pricing strategies, such as bundling similarly priced products or adjusting prices to differentiate items. It can also highlight inconsistencies in pricing that may need correction.
  
- Second Highest Priced Product: This query finds the second most expensive product and its category. Understanding the second-highest priced product aids in competitive pricing strategies and helps determine how to position high-value items within the market. This insight is valuable for ensuring that pricing aligns with customer expectations and market trends.
  
- Maximum Price by Category: This Identifies the highest-priced product in each category. By pinpointing the most expensive products in each category, the company can focus marketing efforts on these high-margin items and optimize inventory management to prioritize their availability.
  
- Supplier Product Contribution: This counts the number of products supplied by each supplier. This information is crucial for managing supplier relationships and ensuring a balanced supply chain. It helps the company make informed decisions about supplier negotiations and diversification.
  
- Simplified Product Name and Price: This extracts the first word of the product name and appends the price for a simplified view. It provides a quick reference for product identification, useful in marketing materials and sales reports. It enhances clarity and aids in communicating product information effectively.
  
- Filter Products with Odd Prices: This selects products with odd prices. Identifying products with odd pricing can inform adjustments to make pricing more consistent or align with specific pricing strategies. This can lead to a more standardized approach, improving customer perception and simplifying pricing management.
  
- View for High-Value Products: Creates a view to retrieve products priced above $500. This view allows the company to focus on high-value items, which are often the focus of targeted marketing and sales efforts. It also helps in managing the inventory of these premium products more effectively.
  
- Price Update Procedure: A stored procedure that increases the price of electronics by 15%, excluding those from SupplierA. This procedure automates price adjustments, enabling the company to respond quickly to market changes or supplier cost fluctuations. It supports flexible pricing strategies that can enhance profit margins.
  
- Comprehensive Product Details with Error Handling: A stored procedure to retrieve detailed product information, including category, supplier, and warehouse data, with error handling. This procedure ensures reliable and accurate data retrieval, which is essential for making informed business decisions. The inclusion of error handling safeguards against disruptions in business operations, maintaining data integrity and consistency.

## Impact on Business Processes

- Optimized Inventory Management: The database structure allows for efficient tracking and management of inventory levels, reducing the risk of stockouts and overstock situations. This leads to better resource allocation and cost savings.
  
- Informed Decision-Making: The SQL queries and stored procedures provide critical insights that support strategic decisions, such as pricing adjustments, supplier management, and product prioritization. This data-driven approach enhances the company's ability to respond to market trends and customer needs.
  
- Increased Operational Efficiency: Automation of key tasks, like price updates and detailed data retrieval, streamlines operations and reduces manual effort. This efficiency leads to faster decision-making and more effective use of company resources.
  
- Strategic Supplier Management: The database allows for close monitoring of supplier contributions, enabling the company to negotiate better terms, diversify its supply chain, and ensure a steady flow of products.
  
- Targeted Marketing and Sales: By identifying high-value products and understanding pricing trends, the company can develop more focused marketing campaigns, increasing sales potential and customer satisfaction.
