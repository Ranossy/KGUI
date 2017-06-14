---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/藏剑/藏剑_秀水剑法_子技能_施放梦泉虎跑循环.lua
-- 更新时间:	2013/5/29 21:02:24
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	local dwSkillLevel = player.GetSkillLevel(1589)   --获得母技能 梦泉虎跑 的等级

	--云体锁定目标
	if player.GetSkillLevel(6544) ~= 1 then
		player.CastSkill(1592, 1)
	end
	if player.GetBuff(1702, 1) then
		player.DelBuff(1702, 1)
		player.AddBuff(0, 99, 1593, 1)
		player.AddBuff(0, 99, 1702, 2)
	elseif player.GetBuff(1702, 2) then
		player.DelBuff(1702, 2)
		player.AddBuff(0, 99, 1593, 1)
		player.AddBuff(0, 99, 1702, 3)
	elseif player.GetBuff(1702, 3) then
		player.DelBuff(1702, 3)
		player.AddBuff(0, 99, 1593, 1)
		player.AddBuff(0, 99, 1702, 4)
	else player.GetBuff(1702, 4)
		player.DelBuff(1702, 4)
		player.AddBuff(0, 99, 1593, 1)
		player.AddBuff(0, 99, 1702, 1)
	end	
	player.CastSkill(1591, dwSkillLevel)
end

function UnApply(dwCharacterID)

end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com