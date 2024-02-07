module UsersHelper
  # 引数で与えられたユーザーの Gravatar 画像を返す
  def gravatar_for(user, size: 80)
    # キーワード引数を使用する場合は以下が必要
    # def gravatar_for(user, options = { size: 80 })
    # size = options[:size]

    # キーワード引数を使用しない場合
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
