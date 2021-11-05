class getFeedService {
    get_feed_list(param) {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: '/feed/contents',
                type: 'POST',
                data: param,
                //dataType is a aspect of client, contentType is a aspect of server that means received data type from client.
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (result, status, xhr) {
                    resolve(data);
                },
                error: function (xhr, status, err) {
                    reject(err);
                }
            })
        });
    }
}