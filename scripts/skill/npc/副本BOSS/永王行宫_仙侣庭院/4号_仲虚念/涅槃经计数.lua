---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/永王行宫_仙侣庭院/4号_仲虚念/涅槃经计数.lua
-- 更新时间:	2015/9/15 14:33:18
-- 更新用户:	WANGZEYU
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local Target = GetPlayer(dwCharacterID)
	if Target and Target.nMoveState ~= MOVE_STATE.ON_DEATH then
		local PBuff = Target.GetBuff(9762, 1)
		if PBuff and PBuff.nStackNum == 10 then
			Target.Die()
		end
		local BBuff = Target.GetBuff(9762, 2)
		if BBuff and BBuff.nStackNum == 10 then
			Target.Die()
		end
		local BBuff = Target.GetBuff(9762, 3)
		if BBuff and BBuff.nStackNum == 10 then
			Target.Die()
		end
		local BBuff = Target.GetBuff(9762, 4)
		if BBuff and BBuff.nStackNum == 10 then
			Target.Die()
		end
	end
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com