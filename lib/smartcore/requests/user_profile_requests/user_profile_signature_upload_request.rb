module Smartcore
  class UserProfileSignatureUploadRequest < TokenRequest

    attribute :user_token, String
    attribute :signature, String

    def execute
      response = execute_request_with_token
      if response.status == success_status
        Smartcore::UserProfileResponse.new(JSON.parse(response.body))
      else
        process_error(response)
      end
    end

    def path
      router.user_upload_signature_path
    end
  end
end
