Aws.config.update({
    credentials: Aws::Credentials.new(Figaro.env.access_key_id, Figaro.env.secret_access_key)
})
