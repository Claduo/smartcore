module Smartcore
  class SignatureImageListRequest < TokenRequest

    attribute :limit,  Integer, default: 20
    attribute :offset, Integer, default: 0

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::DocumentImageListResponse.new(JSON.parse(response.body)).document_scans
      else
        process_error(response)
      end
    end

    def path
      router.signature_list_path
    end
  end
end
