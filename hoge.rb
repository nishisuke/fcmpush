Fcmpush::Message.new
  .set_notification(title: 'hoge')
  .set_data({})
  .set_token('')
  .set_apns({})
  .set_fcm_options({})
  .send()
