xml.instruct!
xml.ad do
  xml.id @ad.title
  xml.title @ad.title
  xml.finish_date l @ad.finish_date
  xml.author @ad.member.profile_member.full_name
end