---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/丐帮/丐帮回蓝通用.lua
-- 更新时间:	2013/5/22 16:26:10
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(5997, 1)
	if not buff then
		return
	end
	local n = buff.nStackNum
	player.nCurrentMana = player.nCurrentMana + player.nMaxMana * n * 0.01
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com