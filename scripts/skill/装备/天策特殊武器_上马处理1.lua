---------------------------------------------------------------------->
-- 脚本名称:	
-- 更新时间:	2013/1/28 17:18:26
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)

end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(5194, 1)
	local buff1 = player.GetBuff(5214,1)
	local buff2 = player.GetBuff(5215,1)
	local buff3 = player.GetBuff(5216,1)
	local buff4 = player.GetBuff(5217,1)
	if not buff then
		return
	end
	if not buff1 then
		return
	end
	if not buff2 then
		return
	end
	if not buff3 then
		return
	end
	if not buff4 then
		return
	end
	local t = buff.nCustomValue
	local t1 = buff1.nCustomValue
	local t2 = buff2.nCustomValue
	local t3 = buff3.nCustomValue
	local t4 = buff4.nCustomValue
	player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_STYLE, t)
	player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT1, t1)
	player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT2, t2)
	player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT3, t3)
	player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT4, t4)
	player.DelBuff(5194, 1)
	player.DelBuff(5214, 1)
	player.DelBuff(5215, 1)
	player.DelBuff(5216, 1)
	player.DelBuff(5217, 1)
	--player.Del Buff(244, 1)
	player.DownHorse()
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com