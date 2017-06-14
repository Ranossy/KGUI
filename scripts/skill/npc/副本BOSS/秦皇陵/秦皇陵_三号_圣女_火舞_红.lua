---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/秦皇陵/秦皇陵_三号_圣女_火舞_红.lua
-- 更新时间:	2014/3/20 11:36:58
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	
	if not player then
		return
	end
	local scene = player.GetScene()
	local buffLV = 0
	if scene.dwMapID == 182 then
		buffLV = 1
	else
		buffLV = 2
	end
	local buff = player.GetBuff(7640, buffLV)
	if buff then
		player.DelGroupBuff(7640, buffLV)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com