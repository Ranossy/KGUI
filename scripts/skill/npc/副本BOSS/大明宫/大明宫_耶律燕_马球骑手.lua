
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
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

	--print("下马_" .. buff.nCustomValue .. "_" .. buff1.nCustomValue .. "_" .. buff2.nCustomValue .. "_" .. buff3.nCustomValue .. "_" .. buff4.nCustomValue .. "_")
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

	scene.SetTimer(0.5 * GLOBAL.GAME_FPS, "scripts/skill/npc/副本BOSS/大明宫/大明宫_耶律燕_马球骑手.lua", dwCharacterID, 0)
end

function OnTimer(scene, nParam1, nParam2)
	local player = GetPlayer(nParam1)
	if not player then
		return
	end
	player.DoAction(0, 10103)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com