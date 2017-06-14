---------------------------------------------------------------------->
-- 脚本名称:	F:/zhugan/client/scripts/skill/装备/天策特殊武器_上马处理.lua
-- 更新时间:	2013/1/28 15:30:56
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.AddBuff(0, 99, 5193, 1, 1)
	player.AddBuff(0, 99, 5194, 1, 1)
	player.AddBuff(0,99,5214,1,1)
	player.AddBuff(0,99,5215,1,1)
	player.AddBuff(0,99,5216,1,1)
	player.AddBuff(0,99,5217,1,1)
	local t = player.GetRepresentID()
	local buff = player.GetBuff(5194, 1)
	local buff1 = player.GetBuff(5214, 1)
	local buff2 = player.GetBuff(5215, 1)
	local buff3 = player.GetBuff(5216, 1)
	local buff4 = player.GetBuff(5217, 1)
	buff.nCustomValue = t[EQUIPMENT_REPRESENT.HORSE_STYLE]
	buff1.nCustomValue = t[EQUIPMENT_REPRESENT.HORSE_ADORNMENT1]
	buff2.nCustomValue = t[EQUIPMENT_REPRESENT.HORSE_ADORNMENT2]
	buff3.nCustomValue = t[EQUIPMENT_REPRESENT.HORSE_ADORNMENT3]
	buff4.nCustomValue = t[EQUIPMENT_REPRESENT.HORSE_ADORNMENT4]
	player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_STYLE, 33)
	player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT1, 0)
	player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT2, 0)
	player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT3, 0)
	player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT4, 0)
	player.AddBuff(0, 99, 244, 1, 1)
	player.DoAction(0, 10479)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com