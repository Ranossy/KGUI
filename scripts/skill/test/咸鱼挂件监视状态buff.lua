---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/test/咸鱼挂件监视状态buff.lua
-- 更新时间:	2013/11/13 10:00:15
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	if nLeftFrame ~= 0 then
		player.CastSkill(8563, 1)
		player.RemovePendent(10959)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com