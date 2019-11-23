module Response
    def json_response(object, message, status = :ok)
        render json: { code: status, msg: message, data: object }
    end
end