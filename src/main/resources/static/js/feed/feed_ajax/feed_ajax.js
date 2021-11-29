class getFeedService {
    get_feed_list(param) {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/ajax/contents',
                type: 'POST',
                data: JSON.stringify(param),
                //dataType is a aspect of client, contentType is a aspect of server that means received data type from client.
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (result, status, xhr) {
                    resolve(result);
                },
                error: function (xhr, status, err) {
                    reject(err);
                }
            })
        });
    }
}