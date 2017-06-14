---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/丐帮/奇穴随机回蓝.lua
-- 更新时间:	2013/6/8 14:21:44
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	--player.nCurrentMana = player.nCurrentMana + 0.5 * player.nMaxMana
	local i = Random(1, 1000)
	if player.GetSkillLevel(6855) == 1 then
		if i <= 300 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.1
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com