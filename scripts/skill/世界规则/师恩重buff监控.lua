---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/世界规则/师恩重buff监控.lua
-- 更新时间:	2015/4/15 17:58:22
-- 更新用户:	mantong2
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local bRemotePlayer = IsRemotePlayer(dwCharacterID)
	if bRemotePlayer then
		return
	end
	local GetMentorCache = GetMentorCache()
	local GetDirectMentorCache = GetDirectMentorCache()
	local nMentorCount = GetMentorCache.GetMentorCount(dwCharacterID)
	local nDirectMentorCount = GetDirectMentorCache.GetMentorCount(dwCharacterID)
	if nMentorCount < 1 and nDirectMentorCount < 1 then
		player.DelGroupBuff(8841, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com