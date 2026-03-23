## Storage Systems

For this system, different storage technologies are used based on specific requirements. A relational database like MySQL is used for storing patient records and transactional data, as it ensures strong consistency and follows ACID properties. This is critical in healthcare systems where data accuracy is essential.

A data warehouse is used for generating monthly reports such as bed occupancy and department-wise costs. It is optimized for analytical queries and large-scale aggregations. For flexible storage of semi-structured patient history data, MongoDB is used, as it allows storing varying medical records without strict schema constraints.

A vector database such as FAISS or Pinecone is used to enable semantic search. It converts patient records into embeddings so that doctors can query data in plain English and retrieve meaningful results. For real-time ICU data, a streaming system like Kafka is used to ingest and process continuous data from monitoring devices.

## OLTP vs OLAP Boundary

The OLTP system consists of the MySQL database where real-time patient records, treatments, and transactions are stored. This system is optimized for frequent inserts, updates, and quick lookups.

The OLAP system begins at the data warehouse, where data from the OLTP system is processed through ETL pipelines and stored for analytical purposes. This separation ensures that heavy reporting queries do not impact transactional performance. The boundary lies at the ETL layer, where data is extracted from OLTP and loaded into OLAP systems.

## Trade-offs

One major trade-off in this design is between consistency and performance. Using multiple systems such as MongoDB, a data warehouse, and a vector database improves flexibility and scalability but introduces data duplication and synchronization challenges.

To mitigate this, a well-designed ETL pipeline is used to ensure data consistency across systems. Additionally, periodic data validation and monitoring can help detect and resolve inconsistencies. While this adds complexity, it allows the system to handle diverse workloads efficiently while maintaining acceptable accuracy.