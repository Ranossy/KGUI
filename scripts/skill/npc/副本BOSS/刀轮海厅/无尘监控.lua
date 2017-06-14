---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/player/副本BOSS/刀轮海厅/无尘监控.lua
-- 更新时间:	2017/4/1 21:45:00
-- 更新用户:	CHENGSIHAN
-- 脚本说明:
----------------------------------------------------------------------<

-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player then
		if player.GetBuff(11846, 1) then
			local Nbuff = player.GetBuff(11846, 1)
			local Num = Nbuff.nStackNum
			if Num == 5 then
				player.DelGroupBuff(11846, 1)
				player.AddBuff(player.dwID, player.nLevel, 11844, 1)
			end
		end
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com