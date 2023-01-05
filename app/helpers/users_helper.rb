module UsersHelper
  def user_avatar_thumb(user)
  if user.avatar.file.present?
    user.avatar.thumb.url
  else
    asset_path("https://vibirai.ru/image/964472.jpg")
  end
end
end
