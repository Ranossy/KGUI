---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/90级奇穴/沧月加致残buff.lua
-- 更新时间:	2013/4/17 15:38:03
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local player = GetPlayer(nCharacterID)
	local buff = player.GetBuff(5639, 1)
	local splayer = GetPlayer(buff.nCustomValue)
	if nLeftFrame == 0 then
		player.AddBuff(splayer.dwID, splayer.nLevel, 540, 1, 1)
	end
	player.DelBuff(5639, 1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com