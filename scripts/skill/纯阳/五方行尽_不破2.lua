---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/五方行尽_不破1.lua
-- 更新时间:	2013/5/11 21:24:49
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local character = nil
	if IsPlayer(dwCharacterID) then
		character = GetPlayer(dwCharacterID)
	else
		character = GetNpc(dwCharacterID)
	end
	--if character then 
	--character.AddBuff(0,99,2289,1)
	--end
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if player.GetSkillLevel(5841) == 0 then
		if character then 
			character.AddBuff(0, 99, 2289, 2)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com