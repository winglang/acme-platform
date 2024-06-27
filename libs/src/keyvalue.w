bring dynamodb;

pub class KeyValueStore {
  table: dynamodb.Table;
  new() {
    this.table = new dynamodb.Table(
      attributes: [
        {
          name: "id",
          type: "S",
        },
      ],
      hashKey: "id",
    );
  }

  pub inflight get(key: str): str {
    let response = this.table.query(
      KeyConditionExpression: "id = :id",
      ExpressionAttributeValues: {":id": key},
    );

    return response.Items[0]["body"].asStr();
  }

  pub inflight set(key: str, value: str) {
    this.table.put(
      Item: {
        id: key,
        body: value,
      },
    );
  }
}