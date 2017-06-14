---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/刀轮海厅/刀势监控.lua
-- 更新时间:	2017/4/1 18:46:43
-- 更新用户:	CHENGSIHAN
-- 脚本说明:
----------------------------------------------------------------------<

-- 当一个技能作用的时候触发, 参数为作用的对象ID
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

function Apply(dwCharacterID, dwSkillSrcID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	if npc then
		if npc.GetBuff(11854, 1) then
			local Nbuff = npc.GetBuff(11854, 1)
			local Num = Nbuff.nStackNum
			if Num == 10 then
				npc.DelGroupBuff(11854, 1)
				npc.AddBuff(npc.dwID, npc.nLevel, 11855, 1)
			end
		end
	end
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com