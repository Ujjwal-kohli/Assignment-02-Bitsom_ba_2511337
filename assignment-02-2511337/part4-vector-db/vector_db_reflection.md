## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for a law firm handling large contracts. As Keyword search only matches exact words, so if a lawyer searches for "termination clauses" but the document uses different wording like "contract ending conditions", there are chances that the system may failin order to retrieve relevant results.

Vector databases solves such kind of problems by understanding the semantic meaning of text rather than just matching keywords. i.e. By converting the text into embeddings (numerical representations), vector databases can find similar meanings even if the exact words are different. This makes search more smart and accurate, especially for large documents like 500-1000 page contracts.

In this system, all contract text would first be converted into embeddings and stored in a vector database. When a lawyer asks a question, the query is also converted into an embedding and then it is compared with stored embeddings to find out the most relevant sections. This allows quick and meaningful retrieval of information.