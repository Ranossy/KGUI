---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/血战天策/血战天策_雷狼_战马上马.lua
-- 更新时间:	2013/10/28 14:59:55
-- 更新用户:	liguanghao2
-- 脚本说明:	
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene()
		if not scene then
			return
		end
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_STYLE, 7)
		if scene.dwMapID == 175 then
			player.SetDynamicSkillGroup(77)
		elseif scene.dwMapID == 176 then
			player.SetDynamicSkillGroup(90)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_STYLE, 0)
		player.SetDynamicSkillGroup(0)
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com